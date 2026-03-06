import 'dart:async';

import '../models/compose_request.dart';

typedef ScheduledSendCallback = Future<void> Function(ComposeRequest request);

class ScheduledSendService {
  final Map<int, Timer> _timers = {};
  int _seed = 0;

  Future<void> schedule(
    ComposeRequest request,
    ScheduledSendCallback callback,
  ) async {
    final when = request.scheduledAt;
    if (when == null || !when.isAfter(DateTime.now())) {
      await callback(request);
      return;
    }
    final id = ++_seed;
    _timers[id]?.cancel();
    _timers[id] = Timer(
      when.difference(DateTime.now()),
      () async {
        try {
          await callback(request);
        } finally {
          _timers.remove(id);
        }
      },
    );
  }

  void cancelAll() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();
  }
}
