import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/build_context_x.dart';
import '../../../data/models/email_model.dart';
import '../../../data/models/mailbox_model.dart';
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
    final selectedIds = ref.watch(selectedEmailIdsProvider);
    final selectionMode = selectedIds.isNotEmpty;
    final visibleEmails = inboxAsync.value ?? const <EmailModel>[];
    final selectedEmails = visibleEmails
        .where((email) => selectedIds.contains(email.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        leading: selectionMode
            ? IconButton(
                onPressed: () =>
                    ref.read(selectedEmailIdsProvider.notifier).clear(),
                icon: const Icon(Icons.close),
              )
            : null,
        title: Text(
          selectionMode
              ? context.l10n.selectedCount(selectedIds.length)
              : currentAccount == null
              ? context.l10n.allInboxes
              : currentAccount.displayName,
        ),
        actions: [
          if (selectionMode) ...[
            IconButton(
              onPressed: selectedEmails.length == visibleEmails.length
                  ? () => ref.read(selectedEmailIdsProvider.notifier).clear()
                  : () => ref
                        .read(selectedEmailIdsProvider.notifier)
                        .replaceAll(visibleEmails.map((email) => email.id)),
              icon: Icon(
                selectedEmails.length == visibleEmails.length
                    ? Icons.remove_done_outlined
                    : Icons.select_all,
              ),
            ),
          ] else ...[
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
        ],
      ),
      bottomNavigationBar: selectionMode
          ? _BatchToolbar(
              selectedEmails: selectedEmails,
              mailboxes: mailboxesAsync.value ?? const <MailboxModel>[],
            )
          : null,
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
                  child: Center(child: Text(context.l10n.previewPlaceholder)),
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

class _BatchToolbar extends ConsumerWidget {
  const _BatchToolbar({required this.selectedEmails, required this.mailboxes});

  final List<EmailModel> selectedEmails;
  final List<MailboxModel> mailboxes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      top: false,
      child: Material(
        elevation: 12,
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        child: SizedBox(
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () async {
                  final error = await ref
                      .read(inboxProvider.notifier)
                      .markReadBatch(selectedEmails, true);
                  if (!context.mounted) {
                    return;
                  }
                  _showResult(context, error, context.l10n.markRead);
                },
                icon: const Icon(Icons.mark_email_read_outlined),
                tooltip: context.l10n.markRead,
              ),
              IconButton(
                onPressed: () async {
                  final error = await ref
                      .read(inboxProvider.notifier)
                      .markReadBatch(selectedEmails, false);
                  if (!context.mounted) {
                    return;
                  }
                  _showResult(context, error, context.l10n.markUnread);
                },
                icon: const Icon(Icons.mark_email_unread_outlined),
                tooltip: context.l10n.markUnread,
              ),
              IconButton(
                onPressed: () async {
                  final target = await showModalBottomSheet<MailboxModel>(
                    context: context,
                    builder: (_) => SafeArea(
                      child: ListView(
                        shrinkWrap: true,
                        children: mailboxes
                            .take(8)
                            .map(
                              (mailbox) => ListTile(
                                leading: const Icon(
                                  Icons.drive_file_move_outline,
                                ),
                                title: Text(mailbox.name),
                                onTap: () => Navigator.of(context).pop(mailbox),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  );
                  if (target == null) {
                    return;
                  }
                  final error = await ref
                      .read(inboxProvider.notifier)
                      .moveBatch(selectedEmails, target);
                  if (!context.mounted) {
                    return;
                  }
                  _showResult(context, error, context.l10n.batchMove);
                },
                icon: const Icon(Icons.drive_file_move_outline),
                tooltip: context.l10n.batchMove,
              ),
              IconButton(
                onPressed: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (dialogContext) => AlertDialog(
                      title: Text(context.l10n.delete),
                      content: Text(context.l10n.batchDeleteConfirm),
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
                  if (confirmed != true) {
                    return;
                  }
                  final error = await ref
                      .read(inboxProvider.notifier)
                      .deleteBatch(selectedEmails);
                  if (!context.mounted) {
                    return;
                  }
                  _showResult(context, error, context.l10n.delete);
                },
                icon: const Icon(Icons.delete_outline),
                tooltip: context.l10n.delete,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showResult(BuildContext context, String? error, String successLabel) {
    if (!context.mounted) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(error ?? successLabel)));
  }
}
