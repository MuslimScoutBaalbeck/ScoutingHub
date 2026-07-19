import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_web.dart';
import 'package:flutter/foundation.dart';
import 'package:sqlite3/wasm.dart';

Future<void> deleteDatabaseBeforeOpen() async {
  debugPrint('[DEV] Database reset before open is not implemented for web.');
}

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {
  if (kDebugMode) {
    final sqlite = await WasmSqlite3.loadFromUrl(Uri.parse('/sqlite3.wasm'));
    sqlite.registerVirtualFileSystem(InMemoryFileSystem(), makeDefault: true);

    await VerifySelf(database).validateDatabaseSchema(sqlite3: sqlite);
  }
}
