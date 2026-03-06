import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../data/models/email_model.dart';
import '../../../providers/inbox_provider.dart';
import '../../../widgets/mail_list_tile.dart';
import 'home_mail_actions_sheet.dart';

class HomeInboxList extends ConsumerWidget {
  const HomeInboxList({
    super.key,
    required this.inboxAsync,
  });

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
                confirmDismiss: (_) async {
                  await showModalBottomSheet<void>(
                    context: context,
                    builder: (_) => HomeMailActionsSheet(email: email),
                  );
                  return false;
                },
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
      error: (error, stackTrace) => Center(
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
