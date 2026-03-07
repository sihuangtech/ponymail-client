import 'dart:async';

import '../models/compose_request.dart';
import '../models/scheduled_send_task.dart';
import 'scheduled_send_store.dart';

typedef ScheduledSendCallback = Future<void> Function(ComposeRequest request);

class ScheduledSendService {
  ScheduledSendService(this._store);

  final ScheduledSendStore _store;
  final Map<String, Timer> _timers = {};
  List<ScheduledSendTask> _tasks = <ScheduledSendTask>[];
  ScheduledSendCallback? _callback;

  Future<void> initialize(
    ScheduledSendCallback callback, {
    bool restorePersistedTasks = true,
  }) async {
    _callback = callback;
    _tasks = await _store.loadTasks();
    if (!restorePersistedTasks) {
      return;
    }
    for (final task in _tasks) {
      _scheduleTimer(task);
    }
  }

  Future<List<ScheduledSendTask>> pendingTasks() async {
    if (_tasks.isEmpty) {
      _tasks = await _store.loadTasks();
    }
    final tasks = [..._tasks];
    tasks.sort(
      (left, right) =>
          left.request.scheduledAt!.compareTo(right.request.scheduledAt!),
    );
    return tasks;
  }

  Future<void> schedule(ComposeRequest request) async {
    final when = request.scheduledAt;
    final callback = _callback;
    if (callback == null) {
      throw StateError('ScheduledSendService is not initialized');
    }
    if (when == null || !when.isAfter(DateTime.now())) {
      await callback(request);
      return;
    }
    final task = ScheduledSendTask(
      id: '${DateTime.now().microsecondsSinceEpoch}-${request.accountId}',
      request: request,
      createdAt: DateTime.now(),
    );
    _tasks = [..._tasks, task];
    await _store.saveTasks(_tasks);
    _scheduleTimer(task);
  }

  Future<void> cancel(String taskId) async {
    _timers.remove(taskId)?.cancel();
    _tasks = _tasks.where((task) => task.id != taskId).toList();
    await _store.saveTasks(_tasks);
  }

  void cancelAll() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
  }

  void _scheduleTimer(ScheduledSendTask task) {
    final when = task.request.scheduledAt;
    final callback = _callback;
    if (when == null || callback == null) {
      return;
    }
    _timers[task.id]?.cancel();
    final delay = when.difference(DateTime.now());
    _timers[task.id] = Timer(
      delay.isNegative ? Duration.zero : delay,
      () async {
        await _deliver(task, callback);
      },
    );
  }

  Future<void> _deliver(
    ScheduledSendTask task,
    ScheduledSendCallback callback,
  ) async {
    try {
      await callback(task.request);
      _tasks = _tasks.where((item) => item.id != task.id).toList();
      await _store.saveTasks(_tasks);
    } catch (error) {
      final updated = task.copyWith(lastError: error.toString());
      _tasks = _tasks
          .map((item) => item.id == task.id ? updated : item)
          .toList();
      await _store.saveTasks(_tasks);
      _timers[task.id] = Timer(
        const Duration(minutes: 15),
        () async => _deliver(updated, callback),
      );
      return;
    } finally {
      if (!_tasks.any((item) => item.id == task.id)) {
        _timers.remove(task.id);
      }
    }
  }
}
