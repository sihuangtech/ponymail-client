import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../models/cache_summary.dart';

class AttachmentCacheService {
  Future<Directory> cacheDirectory() async {
    final dir = await getApplicationDocumentsDirectory();
    final cacheDir = Directory(p.join(dir.path, 'attachment_cache'));
    if (!await cacheDir.exists()) {
      await cacheDir.create(recursive: true);
    }
    return cacheDir;
  }

  Future<String> buildPath(String filename) async {
    final dir = await cacheDirectory();
    final safeName = filename.replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '_');
    return p.join(dir.path, safeName);
  }

  Future<CacheSummary> summarize() async {
    final dir = await cacheDirectory();
    if (!await dir.exists()) {
      return const CacheSummary(fileCount: 0, totalBytes: 0);
    }
    var count = 0;
    var totalBytes = 0;
    await for (final entity in dir.list(recursive: true, followLinks: false)) {
      if (entity is File) {
        count += 1;
        totalBytes += await entity.length();
      }
    }
    return CacheSummary(fileCount: count, totalBytes: totalBytes);
  }

  Future<void> clear() async {
    final dir = await cacheDirectory();
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }
  }
}
