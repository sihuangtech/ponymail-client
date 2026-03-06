import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../providers/inbox_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inbox = ref.watch(inboxProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('收件箱'),
        actions: [
          IconButton(onPressed: () => context.push('/search'), icon: const Icon(Icons.search)),
          IconButton(onPressed: () => context.push('/compose'), icon: const Icon(Icons.edit_outlined)),
          IconButton(onPressed: () => context.push('/settings'), icon: const Icon(Icons.settings_outlined)),
        ],
      ),
      body: inbox.when(
        data: (mails) => RefreshIndicator(
          onRefresh: () => ref.read(inboxProvider.notifier).refreshInbox(),
          child: ListView.builder(
            itemCount: mails.length,
            itemBuilder: (_, i) {
              final email = mails[i];
              return ListTile(
                leading: CircleAvatar(child: Text(email.fromName.isEmpty ? '?' : email.fromName[0].toUpperCase())),
                title: Text(email.subject, style: TextStyle(fontWeight: email.isRead ? FontWeight.normal : FontWeight.bold)),
                subtitle: Text(email.preview, maxLines: 1, overflow: TextOverflow.ellipsis),
                trailing: Text(DateFormat('MM-dd HH:mm').format(email.date)),
                onTap: () => context.push('/email/${email.id}'),
              );
            },
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('加载失败: $e')),
      ),
    );
  }
}
