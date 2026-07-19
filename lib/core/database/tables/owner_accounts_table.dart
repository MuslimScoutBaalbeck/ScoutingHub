import 'package:drift/drift.dart';

class OwnerAccounts extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 120)();

  TextColumn get email => text().unique()();

  TextColumn get remoteId => text().nullable()();

  TextColumn get syncStatus =>
      text().withDefault(const Constant('localOnly'))();

  IntColumn get syncVersion => integer().withDefault(const Constant(0))();

  DateTimeColumn get deletedAt => dateTime().nullable()();

  TextColumn get passwordHash => text()();

  TextColumn get passwordSalt => text()();

  TextColumn get pinHash => text()();

  TextColumn get pinSalt => text()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();
}
