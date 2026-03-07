import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/build_context_x.dart';
import '../../providers/account_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(accountProvider).value ?? const [];
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settings)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.manageAccounts,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: () => context.push('/settings/accounts/new'),
                icon: const Icon(Icons.add),
                label: Text(context.l10n.addAccount),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...accounts.map(
            (account) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(account.color),
                  child: Text(account.displayName.characters.first),
                ),
                title: Text(account.displayName),
                subtitle: Text(account.email),
                onTap: () => context.push('/settings/accounts/${account.id}'),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) async {
                    if (value == 'edit') {
                      context.push('/settings/accounts/${account.id}');
                      return;
                    }
                    final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (dialogContext) => AlertDialog(
                        title: Text(context.l10n.deleteAccount),
                        content: Text(context.l10n.deleteAccountConfirm),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.of(dialogContext).pop(false),
                            child: Text(context.l10n.cancel),
                          ),
                          FilledButton(
                            onPressed: () =>
                                Navigator.of(dialogContext).pop(true),
                            child: Text(context.l10n.delete),
                          ),
                        ],
                      ),
                    );
                    if (confirmed != true || !context.mounted) {
                      return;
                    }
                    final error = await ref
                        .read(accountProvider.notifier)
                        .deleteAccount(account.id);
                    if (!context.mounted || error == null) {
                      return;
                    }
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(error)));
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: Text(context.l10n.editAccount),
                    ),
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: Text(context.l10n.deleteAccount),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: Text(context.l10n.themeMode),
            subtitle: Text(context.l10n.systemDefault),
          ),
          ListTile(
            title: Text(context.l10n.notifications),
            subtitle: Text(context.l10n.enabled),
          ),
          ListTile(
            title: Text(context.l10n.signature),
            subtitle: Text(context.l10n.signatureDefault),
          ),
          ListTile(
            title: Text(context.l10n.cache),
            subtitle: Text(context.l10n.clearCache),
          ),
        ],
      ),
    );
  }
}
