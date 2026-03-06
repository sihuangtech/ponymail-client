import 'dart:async';
import 'dart:io';

import 'package:enough_mail/enough_mail.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../models/account_model.dart';
import '../models/attachment_model.dart';
import '../models/compose_request.dart';
import '../models/email_model.dart';
import '../models/mailbox_model.dart';
import '../models/search_result_model.dart';
import 'mail_message_mapper.dart';
import 'notification_service.dart';

typedef NewMailCallback = Future<void> Function(EmailModel email);

class MailRuntimeService {
  MailRuntimeService(
    this._mapper,
    this._notificationService,
  );

  final MailMessageMapper _mapper;
  final NotificationService _notificationService;
  final Map<int, MailClient> _clients = {};
  final Map<int, StreamSubscription<MailLoadEvent>> _subscriptions = {};

  Future<MailClient> connect(AccountModel account, String password) async {
    final cached = _clients[account.id];
    if (cached != null) {
      return cached;
    }
    final client = MailClient(
      MailAccount.fromManualSettings(
        name: account.displayName,
        email: account.email,
        incomingHost: account.imapHost,
        outgoingHost: account.smtpHost,
        password: password,
        incomingPort: account.imapPort,
        outgoingPort: account.smtpPort,
        incomingSocketType:
            account.imapSsl ? SocketType.ssl : SocketType.starttls,
        outgoingSocketType:
            account.smtpSsl ? SocketType.ssl : SocketType.starttls,
      ),
      isLogEnabled: false,
    );
    await client.connect();
    _clients[account.id] = client;
    return client;
  }

  Future<List<MailboxModel>> syncMailboxes(
    AccountModel account,
    String password,
  ) async {
    final client = await connect(account, password);
    final mailboxes = await client.listMailboxes();
    return mailboxes.asMap().entries
        .map((entry) => _mapper.toMailboxModel(entry.value, account.id, entry.key + 1))
        .toList();
  }

  Future<List<EmailModel>> syncMailbox(
    AccountModel account,
    String password, {
    String mailboxPath = 'INBOX',
    int pageSize = 50,
  }) async {
    final client = await connect(account, password);
    await client.selectMailboxByPath(mailboxPath);
    final messages = await client.fetchMessages(count: pageSize);
    return messages.asMap().entries
        .map(
          (entry) => _mapper.toEmailModel(
            entry.value,
            accountId: account.id,
            mailboxPath: mailboxPath,
            fallbackId: account.id * 100000 + entry.key + 1,
          ),
        )
        .toList();
  }

  Future<SearchResultModel> searchMessages(
    AccountModel account,
    String password,
    String queryText, {
    String mailboxPath = 'INBOX',
  }) async {
    final client = await connect(account, password);
    await client.selectMailboxByPath(mailboxPath);
    final result = await client.searchMessages(
      MailSearch(queryText, SearchQueryType.fromOrSubject),
    );
    return SearchResultModel(
      localResults: const [],
      remoteResults: result.messages.asMap().entries
          .map(
            (entry) => _mapper.toEmailModel(
              entry.value,
              accountId: account.id,
              mailboxPath: mailboxPath,
              fallbackId: account.id * 200000 + entry.key + 1,
            ),
          )
          .toList(),
    );
  }

  Future<void> startRealtimeSync(
    AccountModel account,
    String password, {
    required NewMailCallback onNewMail,
  }) async {
    final client = await connect(account, password);
    await _subscriptions[account.id]?.cancel();
    _subscriptions[account.id] = client.eventBus.on<MailLoadEvent>().listen(
      (event) async {
        final email = _mapper.toEmailModel(
          event.message,
          accountId: account.id,
          mailboxPath: event.message.envelope?.mailboxName ?? 'INBOX',
          fallbackId: account.id * 300000 + (event.message.uid ?? 1),
        );
        await _notificationService.showNewMail(
          id: email.id,
          title: email.fromName.isEmpty ? email.fromEmail : email.fromName,
          body: email.subject,
        );
        await onNewMail(email);
      },
    );
    await client.startPolling(const Duration(minutes: 15));
  }

  Future<void> markRead(
    AccountModel account,
    String password,
    EmailModel email,
    bool read,
  ) async {
    final client = await connect(account, password);
    await client.selectMailboxByPath(email.mailbox);
    final sequence = MessageSequence.fromIds([email.remoteUid ?? 0], isUid: true);
    if (read) {
      await client.markSeen(sequence);
    } else {
      await client.markUnseen(sequence);
    }
  }

  Future<void> deleteMessage(
    AccountModel account,
    String password,
    EmailModel email,
  ) async {
    final client = await connect(account, password);
    await client.selectMailboxByPath(email.mailbox);
    await client.deleteMessages(
      MessageSequence.fromIds([email.remoteUid ?? 0], isUid: true),
    );
  }

  Future<void> moveMessage(
    AccountModel account,
    String password,
    EmailModel email,
    MailboxModel target,
  ) async {
    final client = await connect(account, password);
    await client.selectMailboxByPath(email.mailbox);
    final boxes = await client.listMailboxes();
    final mailbox = boxes.firstWhere((item) => (item.path ?? item.name) == target.path);
    await client.moveMessages(
      MessageSequence.fromIds([email.remoteUid ?? 0], isUid: true),
      mailbox,
    );
  }

  Future<void> sendMessage(
    AccountModel account,
    String password,
    ComposeRequest request,
  ) async {
    final client = await connect(account, password);
    final builder = MessageBuilder.prepareMultipartAlternativeMessage(
      plainText: request.bodyPlain,
      htmlText: request.bodyHtml,
    )
      ..from = [MailAddress(account.email, account.displayName)]
      ..to = _addresses(request.to)
      ..cc = _addresses(request.cc)
      ..bcc = _addresses(request.bcc)
      ..subject = request.subject;
    for (final path in request.attachmentPaths) {
      final file = File(path);
      await builder.addFile(file, MediaType.guessFromFileName(path));
    }
    await client.sendMessageBuilder(builder);
  }

  Future<List<AttachmentModel>> fetchAttachments(
    AccountModel account,
    String password,
    EmailModel email,
  ) async {
    final client = await connect(account, password);
    await client.selectMailboxByPath(email.mailbox);
    final messages = await client.searchMessages(
      MailSearch(email.messageId, SearchQueryType.allTextHeaders, pageSize: 1),
    );
    if (messages.messages.isEmpty) {
      return const [];
    }
    final full = await client.fetchMessageContents(messages.messages.first);
    return _mapper.toAttachmentModels(full, emailId: email.id);
  }

  Future<String?> downloadAttachment(
    AccountModel account,
    String password,
    EmailModel email,
    AttachmentModel attachment,
  ) async {
    final client = await connect(account, password);
    await client.selectMailboxByPath(email.mailbox);
    final result = await client.searchMessages(
      MailSearch(email.messageId, SearchQueryType.allTextHeaders, pageSize: 1),
    );
    if (result.messages.isEmpty) {
      return null;
    }
    final full = await client.fetchMessageContents(result.messages.first);
    final parts = full.findContentInfo();
    final target = parts.firstWhere(
      (part) => (part.fileName ?? '') == attachment.filename,
      orElse: () => parts.first,
    );
    final mimePart = await client.fetchMessagePart(full, target.fetchId);
    final bytes = mimePart.decodeContentBinary();
    if (bytes == null) {
      return null;
    }
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, attachment.filename));
    await file.writeAsBytes(bytes, flush: true);
    return file.path;
  }

  List<MailAddress> _addresses(List<EmailAddressModel> values) {
    return values
        .map((item) => MailAddress(item.email, item.name))
        .toList();
  }
}
