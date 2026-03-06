import '../../models/account_model.dart';
import '../../models/email_model.dart';
import '../../models/mailbox_model.dart';

class DemoMailLocalSource {
  List<AccountModel> buildAccounts() {
    final now = DateTime.now();
    return [
      AccountModel(
        id: 1,
        email: 'hello@ponymail.app',
        displayName: 'PonyMail',
        imapHost: 'imap.ponymail.app',
        imapPort: 993,
        imapSsl: true,
        smtpHost: 'smtp.ponymail.app',
        smtpPort: 465,
        smtpSsl: true,
        passwordKey: 'account_1_password',
        color: 0xFF007AFF,
        signature: 'Sent from PonyMail',
        createdAt: now,
      ),
      AccountModel(
        id: 2,
        email: 'team@skstudio.cn',
        displayName: 'SK Studio',
        imapHost: 'imap.skstudio.cn',
        imapPort: 993,
        imapSsl: true,
        smtpHost: 'smtp.skstudio.cn',
        smtpPort: 465,
        smtpSsl: true,
        passwordKey: 'account_2_password',
        color: 0xFFFF9F0A,
        signature: 'Best regards',
        createdAt: now.subtract(const Duration(days: 8)),
      ),
    ];
  }

  List<MailboxModel> buildMailboxes() {
    return const [
      MailboxModel(
        id: 1,
        accountId: 1,
        name: 'Inbox',
        path: 'INBOX',
        type: 'inbox',
        unreadCount: 2,
      ),
      MailboxModel(
        id: 2,
        accountId: 1,
        name: 'Archive',
        path: 'Archive',
        type: 'archive',
        unreadCount: 0,
      ),
      MailboxModel(
        id: 3,
        accountId: 2,
        name: 'Inbox',
        path: 'INBOX',
        type: 'inbox',
        unreadCount: 1,
      ),
    ];
  }

  List<EmailModel> buildEmails() {
    final now = DateTime.now();
    return [
      EmailModel(
        id: 101,
        accountId: 1,
        messageId: 'msg_101',
        mailbox: 'INBOX',
        subject: 'Welcome to PonyMail',
        fromName: 'Pony Team',
        fromEmail: 'updates@ponymail.app',
        to: const [EmailAddressModel(name: 'You', email: 'hello@ponymail.app')],
        cc: const [],
        date: now.subtract(const Duration(minutes: 18)),
        preview: 'Your cross-platform inbox is ready to sync.',
        bodyPlain: 'Your cross-platform inbox is ready to sync.',
        bodyHtml:
            '<h2>Welcome to PonyMail</h2><p>Your cross-platform inbox is ready to sync.</p>',
        isRead: false,
        isStarred: true,
        isDeleted: false,
        labels: const ['primary'],
        threadId: 'thread_1',
        hasAttachments: false,
      ),
      EmailModel(
        id: 102,
        accountId: 1,
        messageId: 'msg_102',
        mailbox: 'INBOX',
        subject: 'Design review notes',
        fromName: 'Avery',
        fromEmail: 'avery@skstudio.cn',
        to: const [EmailAddressModel(name: 'You', email: 'hello@ponymail.app')],
        cc: const [EmailAddressModel(name: 'Design', email: 'design@skstudio.cn')],
        date: now.subtract(const Duration(hours: 2)),
        preview: 'Three interaction issues still need polish before release.',
        bodyPlain: 'Three interaction issues still need polish before release.',
        bodyHtml:
            '<p>Three interaction issues still need polish before release.</p>',
        isRead: true,
        isStarred: false,
        isDeleted: false,
        labels: const ['social'],
        threadId: 'thread_2',
        hasAttachments: true,
      ),
      EmailModel(
        id: 103,
        accountId: 2,
        messageId: 'msg_103',
        mailbox: 'INBOX',
        subject: 'Build pipeline finished',
        fromName: 'CI Bot',
        fromEmail: 'ci@skstudio.cn',
        to: const [EmailAddressModel(name: 'Team', email: 'team@skstudio.cn')],
        cc: const [],
        date: now.subtract(const Duration(days: 1, hours: 1)),
        preview: 'Android, iOS, macOS and Windows builds all passed.',
        bodyPlain: 'Android, iOS, macOS and Windows builds all passed.',
        bodyHtml:
            '<p>Android, iOS, macOS and Windows builds all passed.</p>',
        isRead: false,
        isStarred: false,
        isDeleted: false,
        labels: const ['updates'],
        threadId: 'thread_3',
        hasAttachments: false,
      ),
    ];
  }
}
