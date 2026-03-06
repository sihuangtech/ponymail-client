import 'package:drift/drift.dart';

import '../../core/utils/result.dart';
import '../../data/database/database.dart';
import '../../data/datasources/remote/imap_service.dart';
import '../../data/models/account_model.dart';

class SyncInboxUseCase {
  SyncInboxUseCase(this._imapService, this._database);

  final ImapService _imapService;
  final AppDatabase _database;

  Future<Result<int>> execute(AccountModel account, String password) async {
    final conn = await _imapService.connect(account, password);
    if (!conn.isSuccess) return Result.err(conn.failure!.message);

    try {
      final client = conn.data!;
      final mailbox = await client.selectInbox();
      final sequence = mailbox.messagesExists;
      final fetchCount = sequence > 50 ? 50 : sequence;
      if (fetchCount == 0) return Result.ok(0);

      final messages = await client.fetchMessages(count: fetchCount);
      for (final m in messages) {
        final plainText = m.decodeTextPlainPart() ?? '';
        await _database.into(_database.emails).insert(
              EmailsCompanion.insert(
                accountId: account.id,
                remoteUid: Value(m.uid),
                messageId: m.decodeHeaderValue('message-id') ?? m.hashCode.toString(),
                mailbox: 'INBOX',
                subject: m.decodeSubject() ?? '(无主题)',
                fromName: m.from?.isNotEmpty == true ? m.from!.first.personalName ?? '' : '',
                fromEmail: m.from?.isNotEmpty == true ? m.from!.first.email : '',
                toList: '[]',
                bccList: const Value('[]'),
                date: m.decodeDate() ?? DateTime.now(),
                preview: Value(plainText.length > 120 ? plainText.substring(0, 120) : plainText),
                bodyPlain: Value(plainText),
                bodyHtml: Value(m.decodeTextHtmlPart() ?? ''),
                isDraft: const Value(false),
              ),
            );
      }
      await client.disconnect();
      return Result.ok(messages.length);
    } catch (e) {
      return Result.err('收件箱同步失败: $e');
    }
  }
}
