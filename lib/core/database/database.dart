import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scouting_hub/core/database/connection/connection.dart' as impl;
import 'package:scouting_hub/core/database/tables/app_settings_table.dart';
import 'package:scouting_hub/core/database/tables/owner_accounts_table.dart';
import 'package:scouting_hub/core/database/tables/products_table.dart';
import 'package:scouting_hub/core/database/tables/stores_table.dart';
import 'package:scouting_hub/core/utils/constants/file_constants.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Stores, OwnerAccounts, AppSettings, Products],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e])
    : super(
        e ??
            driftDatabase(
              name: AppFileConstants.dbName,
              native: const DriftNativeOptions(
                databaseDirectory: getApplicationSupportDirectory,
              ),
              web: DriftWebOptions(
                sqlite3Wasm: Uri.parse('sqlite3.wasm'),
                driftWorker: Uri.parse('drift_worker.js'),
                onResult: (result) {
                  if (result.missingFeatures.isNotEmpty) {
                    debugPrint(
                      'Using ${result.chosenImplementation} due to '
                      'unsupported browser features: '
                      '${result.missingFeatures}',
                    );
                  }
                },
              ),
            ),
      );

  AppDatabase.forTesting(DatabaseConnection super.e);

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
        await _ensureProductIndexes();
      },
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          await m.addColumn(stores, stores.logoPath);
          await m.addColumn(stores, stores.email);
          await m.addColumn(stores, stores.address);
          await m.addColumn(stores, stores.taxNumber);
          await m.addColumn(stores, stores.receiptFooter);
        }

        if (from < 3) {
          await m.createTable(products);
        }

        if (from < 4) {
          await m.addColumn(stores, stores.setupMode);
          await m.addColumn(stores, stores.remoteId);
          await m.addColumn(stores, stores.syncStatus);
          await m.addColumn(stores, stores.syncVersion);
          await m.addColumn(stores, stores.deletedAt);
          await m.addColumn(ownerAccounts, ownerAccounts.remoteId);
          await m.addColumn(ownerAccounts, ownerAccounts.syncStatus);
          await m.addColumn(ownerAccounts, ownerAccounts.syncVersion);
          await m.addColumn(ownerAccounts, ownerAccounts.deletedAt);
        }

        await _ensureProductIndexes();
        await _ensureSetupIndexes();
      },
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');

        await _ensureProductIndexes();
        await _ensureSetupIndexes();

        await impl.validateDatabaseSchema(this);
      },
    );
  }

  Future<void> _ensureProductIndexes() async {
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_products_name ON products (name)',
    );

    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_products_barcode ON products (barcode)',
    );

    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_products_sku ON products (sku)',
    );
  }

  Future<void> _ensureSetupIndexes() async {
    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_stores_setup_mode '
      'ON stores (setup_mode)',
    );

    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_stores_sync_status '
      'ON stores (sync_status)',
    );

    await customStatement(
      'CREATE INDEX IF NOT EXISTS idx_owner_accounts_sync_status '
      'ON owner_accounts (sync_status)',
    );
  }
}
