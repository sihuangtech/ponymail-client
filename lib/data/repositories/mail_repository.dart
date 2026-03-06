import '../../core/utils/result.dart';
import '../models/account_model.dart';
import '../models/attachment_model.dart';
import '../models/compose_request.dart';
import '../models/email_model.dart';
import '../models/mailbox_model.dart';
import '../models/search_result_model.dart';

abstract class MailRepository {
  Future<Result<List<EmailModel>>> getInboxEmails({int? accountId});
  Future<Result<EmailModel>> getEmailDetail(int emailId);
  Future<Result<List<MailboxModel>>> getMailboxes({int? accountId});
  Future<Result<List<EmailModel>>> syncInbox(
    AccountModel account, {
    String mailboxPath = 'INBOX',
  });
  Future<Result<SearchResultModel>> searchEmails(
    String queryText, {
    AccountModel? account,
  });
  Future<Result<void>> startRealtimeSync(AccountModel account);
  Future<Result<void>> markRead(EmailModel email, bool read);
  Future<Result<void>> deleteEmail(EmailModel email);
  Future<Result<void>> moveEmail(EmailModel email, MailboxModel target);
  Future<Result<List<AttachmentModel>>> getAttachments(EmailModel email);
  Future<Result<String?>> downloadAttachment(
    EmailModel email,
    AttachmentModel attachment,
  );
  Future<Result<void>> sendEmail(ComposeRequest request);
  Future<Result<void>> seedDemoMailboxData();
}
