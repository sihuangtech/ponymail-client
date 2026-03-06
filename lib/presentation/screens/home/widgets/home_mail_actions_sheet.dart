import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../data/models/email_model.dart';
import '../../../../data/models/mailbox_model.dart';
import '../../../providers/inbox_provider.dart';

class HomeMailActionsSheet extends ConsumerWidget {
  const HomeMailActionsSheet({
    super.key,
    required this.email,
  });

  final EmailModel email;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mailboxes = ref.watch(mailboxProvider).value ?? const <MailboxModel>[];
    return SafeArea(
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.mark_email_read_outlined),
            title: Text(email.isRead ? context.l10n.markUnread : context.l10n.markRead),
            onTap: () async {
              await ref.read(inboxProvider.notifier).markRead(email, !email.isRead);
              if (context.mounted) Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline),
            title: Text(context.l10n.delete),
            onTap: () async {
              await ref.read(inboxProvider.notifier).deleteEmail(email);
              if (context.mounted) Navigator.of(context).pop();
            },
          ),
          ...mailboxes
              .where((mailbox) => mailbox.path != email.mailbox)
              .take(4)
              .map(
                (mailbox) => ListTile(
                  leading: const Icon(Icons.drive_file_move_outline),
                  title: Text('${context.l10n.archive}: ${mailbox.name}'),
                  onTap: () async {
                    await ref.read(inboxProvider.notifier).moveEmail(email, mailbox);
                    if (context.mounted) Navigator.of(context).pop();
                  },
                ),
              ),
        ],
      ),
    );
  }
}
