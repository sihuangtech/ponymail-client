import '../../core/utils/result.dart';
import '../database/database.dart';
import '../datasources/local/demo_mail_local_source.dart';
import '../models/email_model.dart';
import '../models/mailbox_model.dart';
import 'mail_repository.dart';

class MailRepositoryImpl implements MailRepository {
  MailRepositoryImpl(this._database, this._demoSource);

  final AppDatabase _database;
  final DemoMailLocalSource _demoSource;

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
}
