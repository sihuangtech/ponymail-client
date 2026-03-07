import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/cache_summary.dart';
import 'app_providers.dart';

class AttachmentCacheNotifier extends AsyncNotifier<CacheSummary> {
  @override
  Future<CacheSummary> build() async {
    final result = await ref
        .watch(mailRepositoryProvider)
        .getAttachmentCacheSummary();
    if (!result.isSuccess || result.data == null) {
      throw Exception(result.failure?.message ?? 'cache summary failed');
    }
    return result.data!;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(build);
  }

  Future<String?> clear() async {
    final result = await ref
        .read(mailRepositoryProvider)
        .clearAttachmentCache();
    if (!result.isSuccess) {
      return result.failure?.message;
    }
    await refresh();
    return null;
  }
}

final attachmentCacheProvider =
    AsyncNotifierProvider<AttachmentCacheNotifier, CacheSummary>(
      AttachmentCacheNotifier.new,
    );
