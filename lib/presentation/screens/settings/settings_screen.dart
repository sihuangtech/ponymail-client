import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/extensions/build_context_x.dart';
import '../../../data/models/app_preferences.dart';
import '../../providers/account_provider.dart';
import '../../providers/app_providers.dart';
import '../../providers/cache_provider.dart';
import '../../providers/scheduled_send_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(accountProvider).value ?? const [];
    final preferencesAsync = ref.watch(appPreferencesProvider);
    final scheduledAsync = ref.watch(scheduledSendProvider);
    final cacheAsync = ref.watch(attachmentCacheProvider);
    final preferences = preferencesAsync.value ?? const AppPreferences();
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
          SwitchListTile(
            title: Text(context.l10n.notifications),
            subtitle: Text(context.l10n.notificationSettingsHint),
            value: preferences.notificationsEnabled,
            onChanged: preferencesAsync.isLoading
                ? null
                : (value) => ref
                      .read(appPreferencesProvider.notifier)
                      .savePreferences(
                        preferences.copyWith(notificationsEnabled: value),
                      ),
          ),
          ListTile(
            title: Text(context.l10n.notificationPermission),
            subtitle: Text(context.l10n.notificationPermissionHint),
            trailing: TextButton(
              onPressed: () async {
                await ref
                    .read(notificationServiceProvider)
                    .requestPermissions();
                if (!context.mounted) {
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(context.l10n.permissionRequestSent)),
                );
              },
              child: Text(context.l10n.requestPermission),
            ),
          ),
          SwitchListTile(
            title: Text(context.l10n.backgroundSync),
            subtitle: Text(context.l10n.backgroundSyncHint),
            value: preferences.backgroundSyncEnabled,
            onChanged: preferencesAsync.isLoading
                ? null
                : (value) => ref
                      .read(appPreferencesProvider.notifier)
                      .savePreferences(
                        preferences.copyWith(backgroundSyncEnabled: value),
                      ),
          ),
          SwitchListTile(
            title: Text(context.l10n.idlePush),
            subtitle: Text(context.l10n.idlePushHint),
            value: preferences.idlePushEnabled,
            onChanged: preferencesAsync.isLoading
                ? null
                : (value) => ref
                      .read(appPreferencesProvider.notifier)
                      .savePreferences(
                        preferences.copyWith(idlePushEnabled: value),
                      ),
          ),
          SwitchListTile(
            title: Text(context.l10n.restoreScheduledSends),
            subtitle: Text(context.l10n.restoreScheduledSendsHint),
            value: preferences.restoreScheduledSends,
            onChanged: preferencesAsync.isLoading
                ? null
                : (value) => ref
                      .read(appPreferencesProvider.notifier)
                      .savePreferences(
                        preferences.copyWith(restoreScheduledSends: value),
                      ),
          ),
          ListTile(
            title: Text(context.l10n.signature),
            subtitle: Text(context.l10n.signatureDefault),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.scheduledQueue,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          scheduledAsync.when(
            data: (tasks) {
              if (tasks.isEmpty) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(context.l10n.noScheduledEmails),
                  subtitle: Text(context.l10n.scheduledQueueHint),
                );
              }
              return Column(
                children: tasks
                    .map(
                      (task) => Card(
                        child: ListTile(
                          title: Text(
                            task.request.subject.isEmpty
                                ? context.l10n.noSubject
                                : task.request.subject,
                          ),
                          subtitle: Text(
                            '${DateFormat.yMd().add_Hm().format(task.request.scheduledAt!.toLocal())}\n'
                            '${task.request.to.map((item) => item.email).join(', ')}'
                            '${task.lastError == null ? '' : '\n${context.l10n.lastError}: ${task.lastError}'}',
                          ),
                          isThreeLine: task.lastError != null,
                          trailing: IconButton(
                            onPressed: () => ref
                                .read(scheduledSendProvider.notifier)
                                .cancel(task.id),
                            icon: const Icon(Icons.close),
                            tooltip: context.l10n.cancelSchedule,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
            loading: () => const ListTile(
              contentPadding: EdgeInsets.zero,
              title: LinearProgressIndicator(),
            ),
            error: (error, _) => ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(context.l10n.loadingFailed('$error')),
            ),
          ),
          ListTile(
            title: Text(context.l10n.cache),
            subtitle: Text(
              cacheAsync.when(
                data: (summary) => context.l10n.cacheSummary(
                  summary.fileCount,
                  _formatBytes(summary.totalBytes),
                ),
                loading: () => context.l10n.cacheLoading,
                error: (error, _) => context.l10n.loadingFailed('$error'),
              ),
            ),
            trailing: TextButton(
              onPressed: () async {
                final error = await ref
                    .read(attachmentCacheProvider.notifier)
                    .clear();
                if (!context.mounted) {
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error ?? context.l10n.cacheCleared)),
                );
              },
              child: Text(context.l10n.clearCache),
            ),
          ),
        ],
      ),
    );
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    }
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
