import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/build_context_x.dart';
import '../../providers/account_provider.dart';
import '../../providers/inbox_provider.dart';
import 'widgets/home_account_switcher.dart';
import 'widgets/home_inbox_list.dart';
import 'widgets/home_sidebar.dart';

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
        title: Text(
          currentAccount == null
              ? context.l10n.allInboxes
              : currentAccount.displayName,
        ),
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
          if (constraints.maxWidth >= 980) {
            return Row(
              children: [
                SizedBox(
                  width: 280,
                  child: HomeSidebar(
                    accountsAsync: accountsAsync,
                    mailboxesAsync: mailboxesAsync,
                  ),
                ),
                const VerticalDivider(width: 1),
                Expanded(child: HomeInboxList(inboxAsync: inboxAsync)),
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
                child: HomeAccountSwitcher(accountsAsync: accountsAsync),
              ),
              Expanded(child: HomeInboxList(inboxAsync: inboxAsync)),
            ],
          );
        },
      ),
    );
  }
}
