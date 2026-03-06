import '../../core/utils/result.dart';
import '../models/email_model.dart';
import '../models/mailbox_model.dart';

abstract class MailRepository {
  Future<Result<List<EmailModel>>> getInboxEmails({int? accountId});
  Future<Result<EmailModel>> getEmailDetail(int emailId);
  Future<Result<List<MailboxModel>>> getMailboxes({int? accountId});
  Future<Result<void>> seedDemoMailboxData();
}
