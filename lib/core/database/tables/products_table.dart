import 'package:drift/drift.dart';

@DataClassName('ProductRow')
@TableIndex(name: 'idx_products_name', columns: {#name})
@TableIndex(name: 'idx_products_barcode', columns: {#barcode})
@TableIndex(name: 'idx_products_sku', columns: {#sku})
class Products extends Table {
  TextColumn get id => text()();

  TextColumn get remoteId => text().nullable()();

  TextColumn get name => text().withLength(min: 1, max: 160)();

  TextColumn get sku => text().nullable()();

  TextColumn get barcode => text().nullable()();

  TextColumn get description => text().nullable()();

  TextColumn get unitName => text().withDefault(const Constant('piece'))();

  IntColumn get costPriceCents => integer().withDefault(const Constant(0))();

  IntColumn get sellingPriceCents => integer().withDefault(const Constant(0))();

  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  TextColumn get syncStatus => text().withDefault(const Constant('pending'))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
