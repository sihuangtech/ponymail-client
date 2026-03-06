import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../data/models/account_model.dart';
import '../../../providers/account_provider.dart';
import '../../../providers/inbox_provider.dart';

class HomeAccountSwitcher extends ConsumerWidget {
  const HomeAccountSwitcher({
    super.key,
    required this.accountsAsync,
  });

  final AsyncValue<List<AccountModel>> accountsAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return accountsAsync.when(
      data: (accounts) => ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          FilterChip(
            selected: ref.watch(selectedAccountIdProvider) == null,
            label: Text(context.l10n.allInboxes),
            onSelected: (_) {
              ref.read(accountProvider.notifier).selectAccount(null);
              ref.invalidate(inboxProvider);
              ref.invalidate(mailboxProvider);
            },
          ),
          const SizedBox(width: 10),
          ...accounts.map(
            (account) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: FilterChip(
                selected: ref.watch(selectedAccountIdProvider) == account.id,
                avatar: CircleAvatar(
                  backgroundColor: Color(account.color),
                  radius: 10,
                ),
                label: Text(account.displayName),
                onSelected: (_) {
                  ref.read(accountProvider.notifier).selectAccount(account.id);
                  ref.invalidate(inboxProvider);
                  ref.invalidate(mailboxProvider);
                },
              ),
            ),
          ),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => const SizedBox.shrink(),
    );
  }
}
