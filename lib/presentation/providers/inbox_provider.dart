import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/email_model.dart';
import '../../data/models/mailbox_model.dart';
import 'account_provider.dart';
import 'app_providers.dart';

class InboxNotifier extends AsyncNotifier<List<EmailModel>> {
  @override
  Future<List<EmailModel>> build() async {
    final repository = ref.watch(mailRepositoryProvider);
    await repository.seedDemoMailboxData();
    final selectedAccountId = ref.watch(selectedAccountIdProvider);
    final result = await repository.getInboxEmails(accountId: selectedAccountId);
    return result.data ?? const <EmailModel>[];
  }

  Future<void> refreshInbox() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(build);
  }
}

final inboxProvider =
    AsyncNotifierProvider<InboxNotifier, List<EmailModel>>(InboxNotifier.new);

final emailDetailProvider =
    FutureProvider.family<EmailModel, int>((ref, emailId) async {
  final repository = ref.watch(mailRepositoryProvider);
  final result = await repository.getEmailDetail(emailId);
  if (!result.isSuccess || result.data == null) {
    throw Exception(result.failure?.message ?? 'unknown error');
  }
  return result.data!;
});

final mailboxProvider = FutureProvider<List<MailboxModel>>((ref) async {
  final repository = ref.watch(mailRepositoryProvider);
  final result = await repository.getMailboxes(
    accountId: ref.watch(selectedAccountIdProvider),
  );
  return result.data ?? const <MailboxModel>[];
});
