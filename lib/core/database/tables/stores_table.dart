import 'package:drift/drift.dart';

class Stores extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 120)();

  TextColumn get logoPath => text().nullable()();

  TextColumn get setupMode =>
      text().withDefault(const Constant('offlinePos'))();

  TextColumn get remoteId => text().nullable()();

  TextColumn get syncStatus =>
      text().withDefault(const Constant('localOnly'))();

  IntColumn get syncVersion => integer().withDefault(const Constant(0))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  TextColumn get phone => text().nullable()();

  TextColumn get email => text().nullable()();

  TextColumn get address => text().nullable()();

  TextColumn get taxNumber => text().nullable()();

  TextColumn get receiptFooter => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();
}
