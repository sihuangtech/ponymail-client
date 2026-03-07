import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../models/app_preferences.dart';

class AppPreferencesService {
  Future<AppPreferences> load() async {
    try {
      final file = await _file;
      if (!await file.exists()) {
        return const AppPreferences();
      }
      final content = await file.readAsString();
      if (content.trim().isEmpty) {
        return const AppPreferences();
      }
      return AppPreferences.fromJson(
        Map<String, dynamic>.from(jsonDecode(content) as Map),
      );
    } catch (_) {
      return const AppPreferences();
    }
  }

  Future<AppPreferences> save(AppPreferences value) async {
    final file = await _file;
    await file.writeAsString(jsonEncode(value.toJson()), flush: true);
    return value;
  }

  Future<File> get _file async {
    final dir = await getApplicationDocumentsDirectory();
    return File(p.join(dir.path, 'app_preferences.json'));
  }
}
