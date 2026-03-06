import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../data/models/account_model.dart';
import '../../../../data/models/mailbox_model.dart';
import '../../../providers/inbox_provider.dart';

class HomeSidebar extends ConsumerWidget {
  const HomeSidebar({
    super.key,
    required this.accountsAsync,
    required this.mailboxesAsync,
  });

  final AsyncValue<List<AccountModel>> accountsAsync;
  final AsyncValue<List<MailboxModel>> mailboxesAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          context.l10n.allInboxes,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        accountsAsync.when(
          data: (accounts) => Column(
            children: accounts
                .map(
                  (account) => ListTile(
                    dense: true,
                    leading: CircleAvatar(
                      backgroundColor: Color(account.color),
                      child: Text(account.displayName.characters.first),
                    ),
                    title: Text(account.displayName),
                    subtitle: Text(account.email),
                  ),
                )
                .toList(),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => const SizedBox.shrink(),
        ),
        const SizedBox(height: 16),
        Text(
          context.l10n.inbox,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        mailboxesAsync.when(
          data: (mailboxes) => Column(
            children: mailboxes
                .map(
                  (mailbox) => ListTile(
                    dense: true,
                    leading: const Icon(Icons.folder_open_rounded),
                    title: Text(mailbox.name),
                    selected: ref.watch(selectedMailboxProvider) == mailbox.path,
                    onTap: () {
                      ref.read(selectedMailboxProvider.notifier).select(mailbox.path);
                      ref.invalidate(inboxProvider);
                    },
                    trailing: mailbox.unreadCount > 0
                        ? CircleAvatar(
                            radius: 12,
                            child: Text(mailbox.unreadCount.toString()),
                          )
                        : null,
                  ),
                )
                .toList(),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => const SizedBox.shrink(),
        ),
      ],
    );
  }
}
