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

part 'mail_runtime_service_actions.dart';

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
          mailboxPath: 'INBOX',
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
}
