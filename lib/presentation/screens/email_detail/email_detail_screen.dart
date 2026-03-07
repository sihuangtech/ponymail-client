import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:open_filex/open_filex.dart';

import '../../../core/extensions/build_context_x.dart';
import '../../providers/app_providers.dart';
import '../../providers/inbox_provider.dart';

class EmailDetailScreen extends ConsumerWidget {
  const EmailDetailScreen({super.key, required this.emailId});

  final int emailId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailAsync = ref.watch(emailDetailProvider(emailId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email'),
        actions: const [
          Icon(Icons.star_outline_rounded),
          SizedBox(width: 12),
          Icon(Icons.more_horiz_rounded),
          SizedBox(width: 16),
        ],
      ),
      body: emailAsync.when(
        data: (email) {
          final attachmentsAsync = ref.watch(attachmentsProvider(email));
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(
                email.subject,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${email.fromName} <${email.fromEmail}>'),
                      const SizedBox(height: 8),
                      Text(
                        '${context.l10n.to}: ${email.to.map((e) => e.email).join(', ')}',
                      ),
                      if (email.cc.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text(
                          '${context.l10n.cc}: ${email.cc.map((e) => e.email).join(', ')}',
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: email.bodyHtml.isNotEmpty
                      ? HtmlWidget(email.bodyHtml)
                      : Text(email.bodyPlain),
                ),
              ),
              const SizedBox(height: 16),
              attachmentsAsync.when(
                data: (attachments) => Column(
                  children: attachments
                      .map(
                        (attachment) => ListTile(
                          leading: Icon(
                            attachment.localPath.isNotEmpty
                                ? Icons.folder_open
                                : Icons.attach_file,
                          ),
                          title: Text(attachment.filename),
                          subtitle: Text(
                            attachment.localPath.isNotEmpty
                                ? '${attachment.mimeType} · ${context.l10n.cachedLocally}'
                                : attachment.mimeType,
                          ),
                          onTap: () async {
                            final repository = ref.read(mailRepositoryProvider);
                            final result = await repository.downloadAttachment(
                              email,
                              attachment,
                            );
                            if (result.data != null) {
                              ref.invalidate(attachmentsProvider(email));
                              await OpenFilex.open(result.data!);
                            }
                          },
                        ),
                      )
                      .toList(),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.reply_outlined),
                    label: Text(context.l10n.reply),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => ref
                        .read(inboxProvider.notifier)
                        .markRead(email, !email.isRead),
                    icon: const Icon(Icons.mark_email_unread_outlined),
                    label: Text(
                      email.isRead
                          ? context.l10n.markUnread
                          : context.l10n.markRead,
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () =>
                        ref.read(inboxProvider.notifier).deleteEmail(email),
                    icon: const Icon(Icons.delete_outline),
                    label: Text(context.l10n.delete),
                  ),
                ],
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) =>
            Center(child: Text(context.l10n.loadingFailed(error.toString()))),
      ),
    );
  }
}
