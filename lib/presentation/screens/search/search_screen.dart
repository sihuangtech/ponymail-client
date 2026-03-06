import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/build_context_x.dart';
import '../../providers/inbox_provider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultAsync = ref.watch(searchResultProvider);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.search)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SearchBar(
              hintText: context.l10n.searchHint,
              leading: const Icon(Icons.search_rounded),
              onChanged: (value) =>
                  ref.read(searchQueryProvider.notifier).state = value,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: resultAsync.when(
                data: (result) => ListView(
                  children: [
                    ...result.localResults.map(
                      (item) => ListTile(
                        leading: const Icon(Icons.storage_rounded),
                        title: Text(item.subject),
                        subtitle: Text(item.fromEmail),
                      ),
                    ),
                    ...result.remoteResults.map(
                      (item) => ListTile(
                        leading: const Icon(Icons.cloud_sync_outlined),
                        title: Text(item.subject),
                        subtitle: Text(item.fromEmail),
                      ),
                    ),
                  ],
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Center(
                  child: Text(context.l10n.loadingFailed(error.toString())),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
