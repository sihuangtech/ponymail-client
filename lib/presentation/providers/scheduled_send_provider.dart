import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/scheduled_send_task.dart';
import 'app_providers.dart';

class ScheduledSendNotifier extends AsyncNotifier<List<ScheduledSendTask>> {
  @override
  Future<List<ScheduledSendTask>> build() async {
    return ref.watch(scheduledSendServiceProvider).pendingTasks();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(scheduledSendServiceProvider).pendingTasks(),
    );
  }

  Future<void> cancel(String taskId) async {
    await ref.read(scheduledSendServiceProvider).cancel(taskId);
    await refresh();
  }
}

final scheduledSendProvider =
    AsyncNotifierProvider<ScheduledSendNotifier, List<ScheduledSendTask>>(
      ScheduledSendNotifier.new,
    );
