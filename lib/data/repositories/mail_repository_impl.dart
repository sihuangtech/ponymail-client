import 'package:drift/drift.dart';

import '../../core/utils/result.dart';
import '../database/database.dart';
import '../datasources/local/demo_mail_local_source.dart';
import '../models/account_model.dart';
import '../models/attachment_model.dart';
import '../models/compose_request.dart';
import '../models/email_model.dart';
import '../models/mailbox_model.dart';
import '../models/search_result_model.dart';
import '../services/mail_runtime_service.dart';
import 'account_repository.dart';
import 'mail_repository.dart';

class MailRepositoryImpl implements MailRepository {
  MailRepositoryImpl(
    this._database,
    this._demoSource,
    this._accountRepository,
    this._runtimeService,
  );

  final AppDatabase _database;
  final DemoMailLocalSource _demoSource;
  final AccountRepository _accountRepository;
  final MailRuntimeService _runtimeService;

  @override
  Future<Result<List<EmailModel>>> getInboxEmails({int? accountId}) async {
    try {
      final emails = await _database.getInboxEmails(accountId: accountId);
      return Result.ok(emails);
    } catch (e) {
      return Result.err('读取收件箱失败: $e');
    }
  }

  @override
  Future<Result<EmailModel>> getEmailDetail(int emailId) async {
    try {
      final email = await _database.getEmailById(emailId);
      if (email == null) {
        return Result.err('邮件不存在');
      }
      return Result.ok(email);
    } catch (e) {
      return Result.err('读取邮件详情失败: $e');
    }
  }

  @override
  Future<Result<List<MailboxModel>>> getMailboxes({int? accountId}) async {
    try {
      final values = await _database.getMailboxModels(accountId: accountId);
      return Result.ok(values);
    } catch (e) {
      return Result.err('读取文件夹失败: $e');
    }
  }

  @override
  Future<Result<void>> seedDemoMailboxData() async {
    try {
      await _database.replaceMailboxes(_demoSource.buildMailboxes());
      await _database.replaceEmails(_demoSource.buildEmails());
      return Result.ok(null);
    } catch (e) {
      return Result.err('初始化演示邮件失败: $e');
    }
  }

  @override
  Future<Result<List<EmailModel>>> syncInbox(
    AccountModel account, {
    String mailboxPath = 'INBOX',
  }) async {
    try {
      final passwordResult = await _accountRepository.getPassword(account);
      if (!passwordResult.isSuccess || passwordResult.data == null) {
        return Result.err(passwordResult.failure!.message);
      }
      final mailboxes =
          await _runtimeService.syncMailboxes(account, passwordResult.data!);
      await _database.replaceMailboxes(mailboxes);
      final emails = await _runtimeService.syncMailbox(
        account,
        passwordResult.data!,
        mailboxPath: mailboxPath,
      );
      await _database.upsertEmails(emails);
      return Result.ok(
        await _database.getInboxEmails(
          accountId: account.id,
          mailboxPath: mailboxPath,
        ),
      );
    } catch (e) {
      return Result.err('同步邮箱失败: $e');
    }
  }

  @override
  Future<Result<SearchResultModel>> searchEmails(
    String queryText, {
    AccountModel? account,
  }) async {
    try {
      final localResults = await _database.searchCachedEmails(
        queryText,
        accountId: account?.id,
      );
      if (account == null) {
        return Result.ok(
          SearchResultModel(localResults: localResults, remoteResults: const []),
        );
      }
      final passwordResult = await _accountRepository.getPassword(account);
      if (!passwordResult.isSuccess || passwordResult.data == null) {
        return Result.err(passwordResult.failure!.message);
      }
      final remote = await _runtimeService.searchMessages(
        account,
        passwordResult.data!,
        queryText,
      );
      return Result.ok(
        remote.copyWith(localResults: localResults),
      );
    } catch (e) {
      return Result.err('搜索邮件失败: $e');
    }
  }

  @override
  Future<Result<void>> startRealtimeSync(AccountModel account) async {
    try {
      final passwordResult = await _accountRepository.getPassword(account);
      if (!passwordResult.isSuccess || passwordResult.data == null) {
        return Result.err(passwordResult.failure!.message);
      }
      await _runtimeService.startRealtimeSync(
        account,
        passwordResult.data!,
        onNewMail: (email) async {
          await _database.into(_database.emails).insertOnConflictUpdate(
                _emailCompanionFromNotification(email),
              );
        },
      );
      return Result.ok(null);
    } catch (e) {
      return Result.err('启动实时同步失败: $e');
    }
  }

  @override
  Future<Result<void>> markRead(EmailModel email, bool read) async {
    return _withAccountForEmail(email, (account, password) async {
      await _runtimeService.markRead(account, password, email, read);
      await (_database.update(_database.emails)
            ..where((tbl) => tbl.id.equals(email.id)))
          .write(EmailsCompanion(isRead: Value(read)));
      return Result.ok(null);
    });
  }

  @override
  Future<Result<void>> deleteEmail(EmailModel email) async {
    return _withAccountForEmail(email, (account, password) async {
      await _runtimeService.deleteMessage(account, password, email);
      await (_database.update(_database.emails)
            ..where((tbl) => tbl.id.equals(email.id)))
          .write(const EmailsCompanion(isDeleted: Value(true)));
      return Result.ok(null);
    });
  }

  @override
  Future<Result<void>> moveEmail(EmailModel email, MailboxModel target) async {
    return _withAccountForEmail(email, (account, password) async {
      await _runtimeService.moveMessage(account, password, email, target);
      await (_database.update(_database.emails)
            ..where((tbl) => tbl.id.equals(email.id)))
          .write(EmailsCompanion(mailbox: Value(target.path)));
      return Result.ok(null);
    });
  }

  @override
  Future<Result<List<AttachmentModel>>> getAttachments(EmailModel email) async {
    return _withAccountForEmail(email, (account, password) async {
      final attachments =
          await _runtimeService.fetchAttachments(account, password, email);
      return Result.ok(attachments);
    });
  }

  @override
  Future<Result<String?>> downloadAttachment(
    EmailModel email,
    AttachmentModel attachment,
  ) async {
    return _withAccountForEmail(email, (account, password) async {
      final path = await _runtimeService.downloadAttachment(
        account,
        password,
        email,
        attachment,
      );
      return Result.ok(path);
    });
  }

  @override
  Future<Result<void>> sendEmail(ComposeRequest request) async {
    try {
      final accounts = await _database.getAccountModels();
      final account = accounts.firstWhere((item) => item.id == request.accountId);
      final passwordResult = await _accountRepository.getPassword(account);
      if (!passwordResult.isSuccess || passwordResult.data == null) {
        return Result.err(passwordResult.failure!.message);
      }
      await _runtimeService.sendMessage(account, passwordResult.data!, request);
      return Result.ok(null);
    } catch (e) {
      return Result.err('发送邮件失败: $e');
    }
  }

  Future<Result<T>> _withAccountForEmail<T>(
    EmailModel email,
    Future<Result<T>> Function(AccountModel account, String password) action,
  ) async {
    try {
      final accounts = await _database.getAccountModels();
      final account = accounts.firstWhere((item) => item.id == email.accountId);
      final passwordResult = await _accountRepository.getPassword(account);
      if (!passwordResult.isSuccess || passwordResult.data == null) {
        return Result.err(passwordResult.failure!.message);
      }
      return action(account, passwordResult.data!);
    } catch (e) {
      return Result.err('账户读取失败: $e');
    }
  }

  EmailsCompanion _emailCompanionFromNotification(EmailModel email) {
    return EmailsCompanion.insert(
      id: Value(email.id),
      accountId: email.accountId,
      remoteUid: Value(email.remoteUid),
      messageId: email.messageId,
      mailbox: email.mailbox,
      subject: email.subject,
      fromName: email.fromName,
      fromEmail: email.fromEmail,
      toList: '[]',
      date: email.date,
      preview: Value(email.preview),
      bodyPlain: Value(email.bodyPlain),
      bodyHtml: Value(email.bodyHtml),
      hasAttachments: Value(email.hasAttachments),
      isRead: Value(email.isRead),
      isStarred: Value(email.isStarred),
      isDeleted: Value(email.isDeleted),
      isDraft: Value(email.isDraft),
    );
  }
}
