import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:ponymail/data/models/compose_request.dart';
import 'package:ponymail/data/models/email_model.dart';
import 'package:ponymail/data/models/scheduled_send_task.dart';
import 'package:ponymail/data/services/scheduled_send_service.dart';
import 'package:ponymail/data/services/scheduled_send_store.dart';

class MemoryScheduledSendStore extends ScheduledSendStore {
  List<ScheduledSendTask> tasks = <ScheduledSendTask>[];

  @override
  Future<List<ScheduledSendTask>> loadTasks() async => [...tasks];

  @override
  Future<void> saveTasks(List<ScheduledSendTask> next) async {
    tasks = [...next];
  }
}

void main() {
  ComposeRequest buildRequest(DateTime when) {
    return ComposeRequest(
      accountId: 1,
      to: const [EmailAddressModel(name: 'A', email: 'a@example.com')],
      cc: const [],
      bcc: const [],
      subject: 'Subject',
      bodyPlain: 'plain',
      bodyHtml: '<p>plain</p>',
      attachmentPaths: const [],
      scheduledAt: when,
    );
  }

  test('schedule persists future tasks', () async {
    final store = MemoryScheduledSendStore();
    final service = ScheduledSendService(store);
    await service.initialize((_) async {});

    await service.schedule(
      buildRequest(DateTime.now().add(const Duration(minutes: 5))),
    );

    expect(store.tasks, hasLength(1));
    expect(store.tasks.single.request.subject, 'Subject');
  });

  test('initialize restores and delivers due tasks', () async {
    final store = MemoryScheduledSendStore();
    store.tasks = <ScheduledSendTask>[
      ScheduledSendTask(
        id: 'due-1',
        request: buildRequest(
          DateTime.now().subtract(const Duration(milliseconds: 10)),
        ),
        createdAt: DateTime.now(),
      ),
    ];
    final service = ScheduledSendService(store);
    final delivered = Completer<void>();

    await service.initialize((_) async {
      if (!delivered.isCompleted) {
        delivered.complete();
      }
    });
    await delivered.future.timeout(const Duration(seconds: 1));
    await Future<void>.delayed(const Duration(milliseconds: 20));

    expect(store.tasks, isEmpty);
  });
}
