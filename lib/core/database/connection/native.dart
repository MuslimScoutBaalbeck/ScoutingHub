import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:scouting_hub/core/utils/constants/file_constants.dart';

Future<File> get databaseFile async {
  final appDir = await getApplicationSupportDirectory();

  return File(
    p.join(appDir.path, '${AppFileConstants.dbName}.sqlite'),
  );
}

Future<void> deleteDatabaseBeforeOpen() async {
  final file = await databaseFile;

  await _deleteIfExists(file);

  // SQLite may create sidecar files when WAL mode or shared memory is used.
  // Delete them too so the next open is a clean database.
  await _deleteIfExists(File('${file.path}-wal'));
  await _deleteIfExists(File('${file.path}-shm'));
  await _deleteIfExists(File('${file.path}-journal'));

  debugPrint('[DEV] Deleted local database: ${file.path}');
}

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {
  if (kDebugMode) {
    await VerifySelf(database).validateDatabaseSchema();
  }
}

Future<void> _deleteIfExists(File file) async {
  if (!await file.exists()) {
    return;
  }

  await file.delete();
}
