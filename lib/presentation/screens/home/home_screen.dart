import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/build_context_x.dart';
import '../../../data/models/account_model.dart';
import '../../../data/models/email_model.dart';
import '../../../data/models/mailbox_model.dart';
import '../../providers/account_provider.dart';
import '../../providers/inbox_provider.dart';
import '../../widgets/mail_list_tile.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(accountProvider);
    final inboxAsync = ref.watch(inboxProvider);
    final mailboxesAsync = ref.watch(mailboxProvider);
    final currentAccount = ref.watch(currentAccountProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(currentAccount == null
            ? context.l10n.allInboxes
            : currentAccount.displayName),
        actions: [
          IconButton(
            onPressed: () => context.push('/search'),
            icon: const Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () => context.push('/compose'),
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            onPressed: () => context.push('/settings'),
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 980;
          if (isWide) {
            return Row(
              children: [
                SizedBox(
                  width: 280,
                  child: _Sidebar(
                    accountsAsync: accountsAsync,
                    mailboxesAsync: mailboxesAsync,
                  ),
                ),
                const VerticalDivider(width: 1),
                Expanded(child: _InboxList(inboxAsync: inboxAsync)),
                const VerticalDivider(width: 1),
                Expanded(
                  child: Center(
                    child: Text(context.l10n.previewPlaceholder),
                  ),
                ),
              ],
            );
          }
          return Column(
            children: [
              SizedBox(
                height: 76,
                child: _AccountSwitcher(accountsAsync: accountsAsync),
              ),
              Expanded(child: _InboxList(inboxAsync: inboxAsync)),
            ],
          );
        },
      ),
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({
    required this.accountsAsync,
    required this.mailboxesAsync,
  });

  final AsyncValue<List<AccountModel>> accountsAsync;
  final AsyncValue<List<MailboxModel>> mailboxesAsync;

  @override
  Widget build(BuildContext context) {
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

class _AccountSwitcher extends ConsumerWidget {
  const _AccountSwitcher({required this.accountsAsync});

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

class _InboxList extends ConsumerWidget {
  const _InboxList({required this.inboxAsync});

  final AsyncValue<List<EmailModel>> inboxAsync;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return inboxAsync.when(
      data: (mails) {
        if (mails.isEmpty) {
          return Center(child: Text(context.l10n.emptyInbox));
        }
        return RefreshIndicator(
          onRefresh: () => ref.read(inboxProvider.notifier).refreshInbox(),
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: mails.length,
            itemBuilder: (context, index) {
              final email = mails[index];
              return Dismissible(
                key: ValueKey(email.id),
                background: _SwipeAction(
                  color: Theme.of(context).colorScheme.primary,
                  icon: Icons.archive_outlined,
                  alignment: Alignment.centerLeft,
                ),
                secondaryBackground: _SwipeAction(
                  color: Theme.of(context).colorScheme.error,
                  icon: Icons.delete_outline,
                  alignment: Alignment.centerRight,
                ),
                child: MailListTile(
                  email: email,
                  onTap: () => context.push('/email/${email.id}'),
                ),
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: Text(context.l10n.loadingFailed(error.toString())),
      ),
    );
  }
}

class _SwipeAction extends StatelessWidget {
  const _SwipeAction({
    required this.color,
    required this.icon,
    required this.alignment,
  });

  final Color color;
  final IconData icon;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
