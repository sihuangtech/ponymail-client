import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/attachment_model.dart';
import '../../data/models/email_model.dart';
import '../../data/models/mailbox_model.dart';
import '../../data/models/search_result_model.dart';
import 'account_provider.dart';
import 'app_providers.dart';

class SelectedMailboxNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void select(String? path) => state = path;
}

final selectedMailboxProvider =
    NotifierProvider<SelectedMailboxNotifier, String?>(
      SelectedMailboxNotifier.new,
    );

class InboxNotifier extends AsyncNotifier<List<EmailModel>> {
  @override
  Future<List<EmailModel>> build() async {
    final repository = ref.watch(mailRepositoryProvider);
    final currentAccount = ref.watch(currentAccountProvider);
    final accounts = ref.watch(accountProvider).value ?? const [];
    final selectedMailbox = ref.watch(selectedMailboxProvider);
    if (currentAccount == null) {
      if (accounts.isNotEmpty) {
        for (final account in accounts) {
          await repository.syncInbox(
            account,
            mailboxPath: selectedMailbox ?? 'INBOX',
          );
        }
      }
      final result = await repository.getInboxEmails();
      return result.data ?? const <EmailModel>[];
    }
    final sync = await repository.syncInbox(
      currentAccount,
      mailboxPath: selectedMailbox ?? 'INBOX',
    );
    return sync.data ?? const <EmailModel>[];
  }

  Future<void> refreshInbox() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(build);
  }

  Future<void> markRead(EmailModel email, bool read) async {
    final repository = ref.read(mailRepositoryProvider);
    await repository.markRead(email, read);
    await refreshInbox();
  }

  Future<void> deleteEmail(EmailModel email) async {
    final repository = ref.read(mailRepositoryProvider);
    await repository.deleteEmail(email);
    await refreshInbox();
  }

  Future<void> moveEmail(EmailModel email, MailboxModel target) async {
    final repository = ref.read(mailRepositoryProvider);
    await repository.moveEmail(email, target);
    await refreshInbox();
  }
}

final inboxProvider = AsyncNotifierProvider<InboxNotifier, List<EmailModel>>(
  InboxNotifier.new,
);

final emailDetailProvider = FutureProvider.family<EmailModel, int>((
  ref,
  emailId,
) async {
  final repository = ref.watch(mailRepositoryProvider);
  final result = await repository.getEmailDetail(emailId);
  if (!result.isSuccess || result.data == null) {
    throw Exception(result.failure?.message ?? 'unknown error');
  }
  return result.data!;
});

final mailboxProvider = FutureProvider<List<MailboxModel>>((ref) async {
  final repository = ref.watch(mailRepositoryProvider);
  final currentAccount = ref.watch(currentAccountProvider);
  final accounts = ref.watch(accountProvider).value ?? const [];
  if (currentAccount != null) {
    await repository.startRealtimeSync(currentAccount);
  } else {
    for (final account in accounts) {
      await repository.startRealtimeSync(account);
    }
  }
  final result = await repository.getMailboxes(
    accountId: ref.watch(selectedAccountIdProvider),
  );
  return result.data ?? const <MailboxModel>[];
});

class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void update(String value) => state = value;
}

final searchQueryProvider = NotifierProvider<SearchQueryNotifier, String>(
  SearchQueryNotifier.new,
);

final searchResultProvider = FutureProvider<SearchResultModel>((ref) async {
  final repository = ref.watch(mailRepositoryProvider);
  final query = ref.watch(searchQueryProvider);
  if (query.trim().isEmpty) {
    return const SearchResultModel(localResults: [], remoteResults: []);
  }
  final result = await repository.searchEmails(
    query.trim(),
    account: ref.watch(currentAccountProvider),
  );
  if (!result.isSuccess || result.data == null) {
    throw Exception(result.failure?.message ?? 'search failed');
  }
  return result.data!;
});

final attachmentsProvider =
    FutureProvider.family<List<AttachmentModel>, EmailModel>((
      ref,
      email,
    ) async {
      final repository = ref.watch(mailRepositoryProvider);
      final result = await repository.getAttachments(email);
      return result.data ?? const <AttachmentModel>[];
    });
