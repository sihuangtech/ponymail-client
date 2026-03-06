import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          Text(
            context.l10n.manageAccounts,
            style: Theme.of(context).textTheme.titleMedium,
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
