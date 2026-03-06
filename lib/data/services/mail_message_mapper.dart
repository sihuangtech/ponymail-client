import 'package:enough_mail/enough_mail.dart';

import '../models/attachment_model.dart';
import '../models/email_model.dart';
import '../models/mailbox_model.dart';

class MailMessageMapper {
  EmailModel toEmailModel(
    MimeMessage message, {
    required int accountId,
    required String mailboxPath,
    required int fallbackId,
  }) {
    final plain = message.decodeTextPlainPart() ?? '';
    final html = message.decodeTextHtmlPart() ?? '';
    return EmailModel(
      id: fallbackId,
      accountId: accountId,
      remoteUid: message.uid,
      messageId:
          message.decodeHeaderValue('message-id') ?? '${message.uid ?? fallbackId}',
      mailbox: mailboxPath,
      subject: message.decodeSubject() ?? '(无主题)',
      fromName: message.from?.first.personalName ?? '',
      fromEmail: message.from?.first.email ?? '',
      to: _mapAddresses(message.to),
      cc: _mapAddresses(message.cc),
      bcc: const [],
      date: message.decodeDate() ?? DateTime.now(),
      preview: _preview(plain, html),
      bodyPlain: plain,
      bodyHtml: html,
      isRead: message.isSeen ?? false,
      isStarred: message.isFlagged ?? false,
      isDeleted: message.isDeleted ?? false,
      isDraft: false,
      labels: _labelsFor(message),
      threadId: message.decodeHeaderValue('references') ?? '',
      hasAttachments: message.hasAttachments(),
    );
  }

  List<AttachmentModel> toAttachmentModels(
    MimeMessage message, {
    required int emailId,
  }) {
    final parts = message.findContentInfo();
    return parts.asMap().entries.map((entry) {
      final info = entry.value;
      return AttachmentModel(
        id: emailId * 1000 + entry.key,
        emailId: emailId,
        filename: info.fileName ?? 'attachment-${entry.key}',
        mimeType: info.mediaType?.text ?? 'application/octet-stream',
        size: info.size ?? 0,
        localPath: '',
      );
    }).toList();
  }

  MailboxModel toMailboxModel(Mailbox mailbox, int accountId, int fallbackId) {
    return MailboxModel(
      id: fallbackId,
      accountId: accountId,
      name: mailbox.name,
      path: mailbox.path ?? mailbox.name,
      type: _mailboxType(mailbox),
      unreadCount: mailbox.messagesUnseen ?? 0,
    );
  }

  List<EmailAddressModel> _mapAddresses(List<MailAddress>? addresses) {
    return (addresses ?? const <MailAddress>[])
        .map(
          (address) => EmailAddressModel(
            name: address.personalName ?? '',
            email: address.email,
          ),
        )
        .toList();
  }

  String _preview(String plain, String html) {
    final text = plain.isNotEmpty ? plain : html.replaceAll(RegExp('<[^>]*>'), ' ');
    final normalized = text.replaceAll(RegExp(r'\s+'), ' ').trim();
    return normalized.length > 120 ? normalized.substring(0, 120) : normalized;
  }

  List<String> _labelsFor(MimeMessage message) {
    final sender = message.from?.first.email.toLowerCase() ?? '';
    if (message.decodeHeaderValue('list-unsubscribe') != null) {
      return const ['subscription'];
    }
    if (sender.contains('noreply') || sender.contains('no-reply')) {
      return const ['notification'];
    }
    if (sender.contains('facebook') || sender.contains('twitter')) {
      return const ['social'];
    }
    return const ['primary'];
  }

  String _mailboxType(Mailbox mailbox) {
    if (mailbox.isInbox) return 'inbox';
    if (mailbox.isSent) return 'sent';
    if (mailbox.isTrash) return 'trash';
    if (mailbox.isArchive) return 'archive';
    if (mailbox.isDrafts) return 'drafts';
    if (mailbox.isJunk) return 'junk';
    return 'custom';
  }
}
