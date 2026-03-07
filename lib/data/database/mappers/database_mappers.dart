part of '../database.dart';

extension DatabaseWriteOps on AppDatabase {
  Future<void> replaceAccounts(List<AccountModel> values) async {
    await batch((batch) {
      batch.deleteAll(accounts);
      batch.insertAll(
        accounts,
        values.map(
          (account) => AccountsCompanion.insert(
            id: Value(account.id),
            email: account.email,
            displayName: account.displayName,
            imapHost: account.imapHost,
            imapPort: account.imapPort,
            imapSsl: Value(account.imapSsl),
            smtpHost: account.smtpHost,
            smtpPort: account.smtpPort,
            smtpSsl: Value(account.smtpSsl),
            passwordKey: account.passwordKey,
            color: account.color,
            signature: Value(account.signature),
            createdAt: Value(account.createdAt),
          ),
        ),
      );
    });
  }

  Future<void> replaceEmails(List<EmailModel> values) async {
    await batch((batch) {
      batch.deleteAll(emails);
      batch.insertAll(emails, values.map(_emailCompanionFromModel));
    });
  }

  Future<void> upsertEmails(List<EmailModel> values) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        emails,
        values.map(_emailCompanionFromModel),
      );
    });
  }

  Future<void> replaceMailboxes(List<MailboxModel> values) async {
    await batch((batch) {
      batch.deleteAll(mailboxes);
      batch.insertAll(
        mailboxes,
        values.map(
          (mailbox) => MailboxesCompanion.insert(
            id: Value(mailbox.id),
            accountId: mailbox.accountId,
            name: mailbox.name,
            path: mailbox.path,
            type: mailbox.type,
            unreadCount: Value(mailbox.unreadCount),
          ),
        ),
      );
    });
  }

  Future<void> replaceAttachmentsForEmail(
    int emailId,
    List<AttachmentModel> values,
  ) async {
    await transaction(() async {
      await (delete(
        attachments,
      )..where((tbl) => tbl.emailId.equals(emailId))).go();
      if (values.isEmpty) {
        return;
      }
      await batch((batch) {
        batch.insertAll(
          attachments,
          values.map(
            (attachment) => AttachmentsCompanion.insert(
              id: Value(attachment.id),
              emailId: attachment.emailId,
              filename: attachment.filename,
              mimeType: attachment.mimeType,
              size: attachment.size,
              localPath: attachment.localPath,
            ),
          ),
        );
      });
    });
  }

  Future<void> upsertAttachment(AttachmentModel attachment) async {
    await into(attachments).insertOnConflictUpdate(
      AttachmentsCompanion.insert(
        id: Value(attachment.id),
        emailId: attachment.emailId,
        filename: attachment.filename,
        mimeType: attachment.mimeType,
        size: attachment.size,
        localPath: attachment.localPath,
      ),
    );
  }

  Future<void> clearAttachmentCacheMetadata() async {
    await update(
      attachments,
    ).write(const AttachmentsCompanion(localPath: Value('')));
  }

  EmailsCompanion _emailCompanionFromModel(EmailModel email) {
    return EmailsCompanion.insert(
      id: Value(email.id),
      accountId: email.accountId,
      remoteUid: Value(email.remoteUid),
      messageId: email.messageId,
      mailbox: email.mailbox,
      subject: email.subject,
      fromName: email.fromName,
      fromEmail: email.fromEmail,
      toList: jsonEncode(email.to.map((item) => item.toJson()).toList()),
      ccList: Value(jsonEncode(email.cc.map((item) => item.toJson()).toList())),
      bccList: Value(
        jsonEncode(email.bcc.map((item) => item.toJson()).toList()),
      ),
      date: email.date,
      preview: Value(email.preview),
      bodyPlain: Value(email.bodyPlain),
      bodyHtml: Value(email.bodyHtml),
      isRead: Value(email.isRead),
      isStarred: Value(email.isStarred),
      isDeleted: Value(email.isDeleted),
      isDraft: Value(email.isDraft),
      labels: Value(jsonEncode(email.labels)),
      threadId: Value(email.threadId),
      hasAttachments: Value(email.hasAttachments),
    );
  }
}

AccountModel _mapAccount(Account row) {
  return AccountModel(
    id: row.id,
    email: row.email,
    displayName: row.displayName,
    imapHost: row.imapHost,
    imapPort: row.imapPort,
    imapSsl: row.imapSsl,
    smtpHost: row.smtpHost,
    smtpPort: row.smtpPort,
    smtpSsl: row.smtpSsl,
    passwordKey: row.passwordKey,
    color: row.color,
    signature: row.signature,
    createdAt: row.createdAt,
  );
}

EmailModel _mapEmail(Email row) {
  return EmailModel(
    id: row.id,
    accountId: row.accountId,
    remoteUid: row.remoteUid,
    messageId: row.messageId,
    mailbox: row.mailbox,
    subject: row.subject,
    fromName: row.fromName,
    fromEmail: row.fromEmail,
    to: _decodeAddresses(row.toList),
    cc: _decodeAddresses(row.ccList),
    bcc: _decodeAddresses(row.bccList),
    date: row.date,
    preview: row.preview,
    bodyPlain: row.bodyPlain,
    bodyHtml: row.bodyHtml,
    isRead: row.isRead,
    isStarred: row.isStarred,
    isDeleted: row.isDeleted,
    isDraft: row.isDraft,
    labels: _decodeStringList(row.labels),
    threadId: row.threadId,
    hasAttachments: row.hasAttachments,
  );
}

MailboxModel _mapMailbox(Mailboxe row) {
  return MailboxModel(
    id: row.id,
    accountId: row.accountId,
    name: row.name,
    path: row.path,
    type: row.type,
    unreadCount: row.unreadCount,
  );
}

AttachmentModel _mapAttachment(Attachment row) {
  return AttachmentModel(
    id: row.id,
    emailId: row.emailId,
    filename: row.filename,
    mimeType: row.mimeType,
    size: row.size,
    localPath: row.localPath,
  );
}
