part of 'mail_repository_impl.dart';

extension _MailRepositoryImplHelpers on MailRepositoryImpl {
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
