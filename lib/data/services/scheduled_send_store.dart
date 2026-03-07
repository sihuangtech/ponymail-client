import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../models/scheduled_send_task.dart';

class ScheduledSendStore {
  Future<List<ScheduledSendTask>> loadTasks() async {
    try {
      final file = await _file;
      if (!await file.exists()) {
        return const <ScheduledSendTask>[];
      }
      final content = await file.readAsString();
      if (content.trim().isEmpty) {
        return const <ScheduledSendTask>[];
      }
      final values = List<Map<String, dynamic>>.from(
        jsonDecode(content) as List,
      );
      return values.map(ScheduledSendTask.fromJson).toList()..sort(
        (left, right) =>
            left.request.scheduledAt!.compareTo(right.request.scheduledAt!),
      );
    } catch (_) {
      return const <ScheduledSendTask>[];
    }
  }

  Future<void> saveTasks(List<ScheduledSendTask> tasks) async {
    final file = await _file;
    final payload = tasks.map((task) => task.toJson()).toList();
    await file.writeAsString(jsonEncode(payload), flush: true);
  }

  Future<File> get _file async {
    final dir = await getApplicationDocumentsDirectory();
    return File(p.join(dir.path, 'scheduled_sends.json'));
  }
}
