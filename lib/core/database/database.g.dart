// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $StoresTable extends Stores with TableInfo<$StoresTable, Store> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 120,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _logoPathMeta = const VerificationMeta(
    'logoPath',
  );
  @override
  late final GeneratedColumn<String> logoPath = GeneratedColumn<String>(
    'logo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _setupModeMeta = const VerificationMeta(
    'setupMode',
  );
  @override
  late final GeneratedColumn<String> setupMode = GeneratedColumn<String>(
    'setup_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('offlinePos'),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('localOnly'),
  );
  static const VerificationMeta _syncVersionMeta = const VerificationMeta(
    'syncVersion',
  );
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
    'sync_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _taxNumberMeta = const VerificationMeta(
    'taxNumber',
  );
  @override
  late final GeneratedColumn<String> taxNumber = GeneratedColumn<String>(
    'tax_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _receiptFooterMeta = const VerificationMeta(
    'receiptFooter',
  );
  @override
  late final GeneratedColumn<String> receiptFooter = GeneratedColumn<String>(
    'receipt_footer',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    logoPath,
    setupMode,
    remoteId,
    syncStatus,
    syncVersion,
    deletedAt,
    phone,
    email,
    address,
    taxNumber,
    receiptFooter,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stores';
  @override
  VerificationContext validateIntegrity(
    Insertable<Store> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('logo_path')) {
      context.handle(
        _logoPathMeta,
        logoPath.isAcceptableOrUnknown(data['logo_path']!, _logoPathMeta),
      );
    }
    if (data.containsKey('setup_mode')) {
      context.handle(
        _setupModeMeta,
        setupMode.isAcceptableOrUnknown(data['setup_mode']!, _setupModeMeta),
      );
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('sync_version')) {
      context.handle(
        _syncVersionMeta,
        syncVersion.isAcceptableOrUnknown(
          data['sync_version']!,
          _syncVersionMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('tax_number')) {
      context.handle(
        _taxNumberMeta,
        taxNumber.isAcceptableOrUnknown(data['tax_number']!, _taxNumberMeta),
      );
    }
    if (data.containsKey('receipt_footer')) {
      context.handle(
        _receiptFooterMeta,
        receiptFooter.isAcceptableOrUnknown(
          data['receipt_footer']!,
          _receiptFooterMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Store map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Store(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      logoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_path'],
      ),
      setupMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}setup_mode'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      syncVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_version'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      taxNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tax_number'],
      ),
      receiptFooter: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}receipt_footer'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $StoresTable createAlias(String alias) {
    return $StoresTable(attachedDatabase, alias);
  }
}

class Store extends DataClass implements Insertable<Store> {
  final int id;
  final String name;
  final String? logoPath;
  final String setupMode;
  final String? remoteId;
  final String syncStatus;
  final int syncVersion;
  final DateTime? deletedAt;
  final String? phone;
  final String? email;
  final String? address;
  final String? taxNumber;
  final String? receiptFooter;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Store({
    required this.id,
    required this.name,
    this.logoPath,
    required this.setupMode,
    this.remoteId,
    required this.syncStatus,
    required this.syncVersion,
    this.deletedAt,
    this.phone,
    this.email,
    this.address,
    this.taxNumber,
    this.receiptFooter,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || logoPath != null) {
      map['logo_path'] = Variable<String>(logoPath);
    }
    map['setup_mode'] = Variable<String>(setupMode);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['sync_version'] = Variable<int>(syncVersion);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || taxNumber != null) {
      map['tax_number'] = Variable<String>(taxNumber);
    }
    if (!nullToAbsent || receiptFooter != null) {
      map['receipt_footer'] = Variable<String>(receiptFooter);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  StoresCompanion toCompanion(bool nullToAbsent) {
    return StoresCompanion(
      id: Value(id),
      name: Value(name),
      logoPath: logoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(logoPath),
      setupMode: Value(setupMode),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      syncStatus: Value(syncStatus),
      syncVersion: Value(syncVersion),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      taxNumber: taxNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(taxNumber),
      receiptFooter: receiptFooter == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptFooter),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Store.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Store(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      logoPath: serializer.fromJson<String?>(json['logoPath']),
      setupMode: serializer.fromJson<String>(json['setupMode']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      address: serializer.fromJson<String?>(json['address']),
      taxNumber: serializer.fromJson<String?>(json['taxNumber']),
      receiptFooter: serializer.fromJson<String?>(json['receiptFooter']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'logoPath': serializer.toJson<String?>(logoPath),
      'setupMode': serializer.toJson<String>(setupMode),
      'remoteId': serializer.toJson<String?>(remoteId),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'syncVersion': serializer.toJson<int>(syncVersion),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'address': serializer.toJson<String?>(address),
      'taxNumber': serializer.toJson<String?>(taxNumber),
      'receiptFooter': serializer.toJson<String?>(receiptFooter),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Store copyWith({
    int? id,
    String? name,
    Value<String?> logoPath = const Value.absent(),
    String? setupMode,
    Value<String?> remoteId = const Value.absent(),
    String? syncStatus,
    int? syncVersion,
    Value<DateTime?> deletedAt = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> taxNumber = const Value.absent(),
    Value<String?> receiptFooter = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Store(
    id: id ?? this.id,
    name: name ?? this.name,
    logoPath: logoPath.present ? logoPath.value : this.logoPath,
    setupMode: setupMode ?? this.setupMode,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    syncStatus: syncStatus ?? this.syncStatus,
    syncVersion: syncVersion ?? this.syncVersion,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    phone: phone.present ? phone.value : this.phone,
    email: email.present ? email.value : this.email,
    address: address.present ? address.value : this.address,
    taxNumber: taxNumber.present ? taxNumber.value : this.taxNumber,
    receiptFooter: receiptFooter.present
        ? receiptFooter.value
        : this.receiptFooter,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Store copyWithCompanion(StoresCompanion data) {
    return Store(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      logoPath: data.logoPath.present ? data.logoPath.value : this.logoPath,
      setupMode: data.setupMode.present ? data.setupMode.value : this.setupMode,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      syncVersion: data.syncVersion.present
          ? data.syncVersion.value
          : this.syncVersion,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      address: data.address.present ? data.address.value : this.address,
      taxNumber: data.taxNumber.present ? data.taxNumber.value : this.taxNumber,
      receiptFooter: data.receiptFooter.present
          ? data.receiptFooter.value
          : this.receiptFooter,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Store(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('logoPath: $logoPath, ')
          ..write('setupMode: $setupMode, ')
          ..write('remoteId: $remoteId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('taxNumber: $taxNumber, ')
          ..write('receiptFooter: $receiptFooter, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    logoPath,
    setupMode,
    remoteId,
    syncStatus,
    syncVersion,
    deletedAt,
    phone,
    email,
    address,
    taxNumber,
    receiptFooter,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Store &&
          other.id == this.id &&
          other.name == this.name &&
          other.logoPath == this.logoPath &&
          other.setupMode == this.setupMode &&
          other.remoteId == this.remoteId &&
          other.syncStatus == this.syncStatus &&
          other.syncVersion == this.syncVersion &&
          other.deletedAt == this.deletedAt &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.address == this.address &&
          other.taxNumber == this.taxNumber &&
          other.receiptFooter == this.receiptFooter &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class StoresCompanion extends UpdateCompanion<Store> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> logoPath;
  final Value<String> setupMode;
  final Value<String?> remoteId;
  final Value<String> syncStatus;
  final Value<int> syncVersion;
  final Value<DateTime?> deletedAt;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> address;
  final Value<String?> taxNumber;
  final Value<String?> receiptFooter;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const StoresCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.logoPath = const Value.absent(),
    this.setupMode = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.taxNumber = const Value.absent(),
    this.receiptFooter = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  StoresCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.logoPath = const Value.absent(),
    this.setupMode = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.taxNumber = const Value.absent(),
    this.receiptFooter = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Store> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? logoPath,
    Expression<String>? setupMode,
    Expression<String>? remoteId,
    Expression<String>? syncStatus,
    Expression<int>? syncVersion,
    Expression<DateTime>? deletedAt,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? address,
    Expression<String>? taxNumber,
    Expression<String>? receiptFooter,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (logoPath != null) 'logo_path': logoPath,
      if (setupMode != null) 'setup_mode': setupMode,
      if (remoteId != null) 'remote_id': remoteId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
      if (taxNumber != null) 'tax_number': taxNumber,
      if (receiptFooter != null) 'receipt_footer': receiptFooter,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  StoresCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? logoPath,
    Value<String>? setupMode,
    Value<String?>? remoteId,
    Value<String>? syncStatus,
    Value<int>? syncVersion,
    Value<DateTime?>? deletedAt,
    Value<String?>? phone,
    Value<String?>? email,
    Value<String?>? address,
    Value<String?>? taxNumber,
    Value<String?>? receiptFooter,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return StoresCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      logoPath: logoPath ?? this.logoPath,
      setupMode: setupMode ?? this.setupMode,
      remoteId: remoteId ?? this.remoteId,
      syncStatus: syncStatus ?? this.syncStatus,
      syncVersion: syncVersion ?? this.syncVersion,
      deletedAt: deletedAt ?? this.deletedAt,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      taxNumber: taxNumber ?? this.taxNumber,
      receiptFooter: receiptFooter ?? this.receiptFooter,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (logoPath.present) {
      map['logo_path'] = Variable<String>(logoPath.value);
    }
    if (setupMode.present) {
      map['setup_mode'] = Variable<String>(setupMode.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (taxNumber.present) {
      map['tax_number'] = Variable<String>(taxNumber.value);
    }
    if (receiptFooter.present) {
      map['receipt_footer'] = Variable<String>(receiptFooter.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoresCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('logoPath: $logoPath, ')
          ..write('setupMode: $setupMode, ')
          ..write('remoteId: $remoteId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('taxNumber: $taxNumber, ')
          ..write('receiptFooter: $receiptFooter, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $OwnerAccountsTable extends OwnerAccounts
    with TableInfo<$OwnerAccountsTable, OwnerAccount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OwnerAccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 120,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('localOnly'),
  );
  static const VerificationMeta _syncVersionMeta = const VerificationMeta(
    'syncVersion',
  );
  @override
  late final GeneratedColumn<int> syncVersion = GeneratedColumn<int>(
    'sync_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _passwordHashMeta = const VerificationMeta(
    'passwordHash',
  );
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
    'password_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordSaltMeta = const VerificationMeta(
    'passwordSalt',
  );
  @override
  late final GeneratedColumn<String> passwordSalt = GeneratedColumn<String>(
    'password_salt',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pinHashMeta = const VerificationMeta(
    'pinHash',
  );
  @override
  late final GeneratedColumn<String> pinHash = GeneratedColumn<String>(
    'pin_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pinSaltMeta = const VerificationMeta(
    'pinSalt',
  );
  @override
  late final GeneratedColumn<String> pinSalt = GeneratedColumn<String>(
    'pin_salt',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    email,
    remoteId,
    syncStatus,
    syncVersion,
    deletedAt,
    passwordHash,
    passwordSalt,
    pinHash,
    pinSalt,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'owner_accounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<OwnerAccount> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('sync_version')) {
      context.handle(
        _syncVersionMeta,
        syncVersion.isAcceptableOrUnknown(
          data['sync_version']!,
          _syncVersionMeta,
        ),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('password_hash')) {
      context.handle(
        _passwordHashMeta,
        passwordHash.isAcceptableOrUnknown(
          data['password_hash']!,
          _passwordHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('password_salt')) {
      context.handle(
        _passwordSaltMeta,
        passwordSalt.isAcceptableOrUnknown(
          data['password_salt']!,
          _passwordSaltMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passwordSaltMeta);
    }
    if (data.containsKey('pin_hash')) {
      context.handle(
        _pinHashMeta,
        pinHash.isAcceptableOrUnknown(data['pin_hash']!, _pinHashMeta),
      );
    } else if (isInserting) {
      context.missing(_pinHashMeta);
    }
    if (data.containsKey('pin_salt')) {
      context.handle(
        _pinSaltMeta,
        pinSalt.isAcceptableOrUnknown(data['pin_salt']!, _pinSaltMeta),
      );
    } else if (isInserting) {
      context.missing(_pinSaltMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OwnerAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OwnerAccount(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      syncVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_version'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      passwordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_hash'],
      )!,
      passwordSalt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_salt'],
      )!,
      pinHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pin_hash'],
      )!,
      pinSalt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pin_salt'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $OwnerAccountsTable createAlias(String alias) {
    return $OwnerAccountsTable(attachedDatabase, alias);
  }
}

class OwnerAccount extends DataClass implements Insertable<OwnerAccount> {
  final int id;
  final String name;
  final String email;
  final String? remoteId;
  final String syncStatus;
  final int syncVersion;
  final DateTime? deletedAt;
  final String passwordHash;
  final String passwordSalt;
  final String pinHash;
  final String pinSalt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const OwnerAccount({
    required this.id,
    required this.name,
    required this.email,
    this.remoteId,
    required this.syncStatus,
    required this.syncVersion,
    this.deletedAt,
    required this.passwordHash,
    required this.passwordSalt,
    required this.pinHash,
    required this.pinSalt,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['sync_version'] = Variable<int>(syncVersion);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['password_hash'] = Variable<String>(passwordHash);
    map['password_salt'] = Variable<String>(passwordSalt);
    map['pin_hash'] = Variable<String>(pinHash);
    map['pin_salt'] = Variable<String>(pinSalt);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  OwnerAccountsCompanion toCompanion(bool nullToAbsent) {
    return OwnerAccountsCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      syncStatus: Value(syncStatus),
      syncVersion: Value(syncVersion),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      passwordHash: Value(passwordHash),
      passwordSalt: Value(passwordSalt),
      pinHash: Value(pinHash),
      pinSalt: Value(pinSalt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory OwnerAccount.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OwnerAccount(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      syncVersion: serializer.fromJson<int>(json['syncVersion']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      passwordSalt: serializer.fromJson<String>(json['passwordSalt']),
      pinHash: serializer.fromJson<String>(json['pinHash']),
      pinSalt: serializer.fromJson<String>(json['pinSalt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'remoteId': serializer.toJson<String?>(remoteId),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'syncVersion': serializer.toJson<int>(syncVersion),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'passwordSalt': serializer.toJson<String>(passwordSalt),
      'pinHash': serializer.toJson<String>(pinHash),
      'pinSalt': serializer.toJson<String>(pinSalt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  OwnerAccount copyWith({
    int? id,
    String? name,
    String? email,
    Value<String?> remoteId = const Value.absent(),
    String? syncStatus,
    int? syncVersion,
    Value<DateTime?> deletedAt = const Value.absent(),
    String? passwordHash,
    String? passwordSalt,
    String? pinHash,
    String? pinSalt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => OwnerAccount(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    syncStatus: syncStatus ?? this.syncStatus,
    syncVersion: syncVersion ?? this.syncVersion,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    passwordHash: passwordHash ?? this.passwordHash,
    passwordSalt: passwordSalt ?? this.passwordSalt,
    pinHash: pinHash ?? this.pinHash,
    pinSalt: pinSalt ?? this.pinSalt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  OwnerAccount copyWithCompanion(OwnerAccountsCompanion data) {
    return OwnerAccount(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      syncVersion: data.syncVersion.present
          ? data.syncVersion.value
          : this.syncVersion,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      passwordSalt: data.passwordSalt.present
          ? data.passwordSalt.value
          : this.passwordSalt,
      pinHash: data.pinHash.present ? data.pinHash.value : this.pinHash,
      pinSalt: data.pinSalt.present ? data.pinSalt.value : this.pinSalt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OwnerAccount(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('remoteId: $remoteId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('passwordSalt: $passwordSalt, ')
          ..write('pinHash: $pinHash, ')
          ..write('pinSalt: $pinSalt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    email,
    remoteId,
    syncStatus,
    syncVersion,
    deletedAt,
    passwordHash,
    passwordSalt,
    pinHash,
    pinSalt,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OwnerAccount &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.remoteId == this.remoteId &&
          other.syncStatus == this.syncStatus &&
          other.syncVersion == this.syncVersion &&
          other.deletedAt == this.deletedAt &&
          other.passwordHash == this.passwordHash &&
          other.passwordSalt == this.passwordSalt &&
          other.pinHash == this.pinHash &&
          other.pinSalt == this.pinSalt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class OwnerAccountsCompanion extends UpdateCompanion<OwnerAccount> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String?> remoteId;
  final Value<String> syncStatus;
  final Value<int> syncVersion;
  final Value<DateTime?> deletedAt;
  final Value<String> passwordHash;
  final Value<String> passwordSalt;
  final Value<String> pinHash;
  final Value<String> pinSalt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const OwnerAccountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.passwordSalt = const Value.absent(),
    this.pinHash = const Value.absent(),
    this.pinSalt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  OwnerAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    this.remoteId = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.syncVersion = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required String passwordHash,
    required String passwordSalt,
    required String pinHash,
    required String pinSalt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : name = Value(name),
       email = Value(email),
       passwordHash = Value(passwordHash),
       passwordSalt = Value(passwordSalt),
       pinHash = Value(pinHash),
       pinSalt = Value(pinSalt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<OwnerAccount> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? remoteId,
    Expression<String>? syncStatus,
    Expression<int>? syncVersion,
    Expression<DateTime>? deletedAt,
    Expression<String>? passwordHash,
    Expression<String>? passwordSalt,
    Expression<String>? pinHash,
    Expression<String>? pinSalt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (remoteId != null) 'remote_id': remoteId,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (syncVersion != null) 'sync_version': syncVersion,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (passwordSalt != null) 'password_salt': passwordSalt,
      if (pinHash != null) 'pin_hash': pinHash,
      if (pinSalt != null) 'pin_salt': pinSalt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  OwnerAccountsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? email,
    Value<String?>? remoteId,
    Value<String>? syncStatus,
    Value<int>? syncVersion,
    Value<DateTime?>? deletedAt,
    Value<String>? passwordHash,
    Value<String>? passwordSalt,
    Value<String>? pinHash,
    Value<String>? pinSalt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return OwnerAccountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      remoteId: remoteId ?? this.remoteId,
      syncStatus: syncStatus ?? this.syncStatus,
      syncVersion: syncVersion ?? this.syncVersion,
      deletedAt: deletedAt ?? this.deletedAt,
      passwordHash: passwordHash ?? this.passwordHash,
      passwordSalt: passwordSalt ?? this.passwordSalt,
      pinHash: pinHash ?? this.pinHash,
      pinSalt: pinSalt ?? this.pinSalt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (syncVersion.present) {
      map['sync_version'] = Variable<int>(syncVersion.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (passwordSalt.present) {
      map['password_salt'] = Variable<String>(passwordSalt.value);
    }
    if (pinHash.present) {
      map['pin_hash'] = Variable<String>(pinHash.value);
    }
    if (pinSalt.present) {
      map['pin_salt'] = Variable<String>(pinSalt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OwnerAccountsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('remoteId: $remoteId, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('syncVersion: $syncVersion, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('passwordSalt: $passwordSalt, ')
          ..write('pinHash: $pinHash, ')
          ..write('pinSalt: $pinSalt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String value;
  final DateTime updatedAt;
  const AppSetting({
    required this.key,
    required this.value,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSetting copyWith({String? key, String? value, DateTime? updatedAt}) =>
      AppSetting(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value),
       updatedAt = Value(updatedAt);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products
    with TableInfo<$ProductsTable, ProductRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 160,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
    'sku',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitNameMeta = const VerificationMeta(
    'unitName',
  );
  @override
  late final GeneratedColumn<String> unitName = GeneratedColumn<String>(
    'unit_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('piece'),
  );
  static const VerificationMeta _costPriceCentsMeta = const VerificationMeta(
    'costPriceCents',
  );
  @override
  late final GeneratedColumn<int> costPriceCents = GeneratedColumn<int>(
    'cost_price_cents',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sellingPriceCentsMeta = const VerificationMeta(
    'sellingPriceCents',
  );
  @override
  late final GeneratedColumn<int> sellingPriceCents = GeneratedColumn<int>(
    'selling_price_cents',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    remoteId,
    name,
    sku,
    barcode,
    description,
    unitName,
    costPriceCents,
    sellingPriceCents,
    isActive,
    syncStatus,
    deletedAt,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sku')) {
      context.handle(
        _skuMeta,
        sku.isAcceptableOrUnknown(data['sku']!, _skuMeta),
      );
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('unit_name')) {
      context.handle(
        _unitNameMeta,
        unitName.isAcceptableOrUnknown(data['unit_name']!, _unitNameMeta),
      );
    }
    if (data.containsKey('cost_price_cents')) {
      context.handle(
        _costPriceCentsMeta,
        costPriceCents.isAcceptableOrUnknown(
          data['cost_price_cents']!,
          _costPriceCentsMeta,
        ),
      );
    }
    if (data.containsKey('selling_price_cents')) {
      context.handle(
        _sellingPriceCentsMeta,
        sellingPriceCents.isAcceptableOrUnknown(
          data['selling_price_cents']!,
          _sellingPriceCentsMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      sku: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sku'],
      ),
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      unitName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_name'],
      )!,
      costPriceCents: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cost_price_cents'],
      )!,
      sellingPriceCents: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}selling_price_cents'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class ProductRow extends DataClass implements Insertable<ProductRow> {
  final String id;
  final String? remoteId;
  final String name;
  final String? sku;
  final String? barcode;
  final String? description;
  final String unitName;
  final int costPriceCents;
  final int sellingPriceCents;
  final bool isActive;
  final String syncStatus;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ProductRow({
    required this.id,
    this.remoteId,
    required this.name,
    this.sku,
    this.barcode,
    this.description,
    required this.unitName,
    required this.costPriceCents,
    required this.sellingPriceCents,
    required this.isActive,
    required this.syncStatus,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || sku != null) {
      map['sku'] = Variable<String>(sku);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['unit_name'] = Variable<String>(unitName);
    map['cost_price_cents'] = Variable<int>(costPriceCents);
    map['selling_price_cents'] = Variable<int>(sellingPriceCents);
    map['is_active'] = Variable<bool>(isActive);
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      name: Value(name),
      sku: sku == null && nullToAbsent ? const Value.absent() : Value(sku),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      unitName: Value(unitName),
      costPriceCents: Value(costPriceCents),
      sellingPriceCents: Value(sellingPriceCents),
      isActive: Value(isActive),
      syncStatus: Value(syncStatus),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ProductRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductRow(
      id: serializer.fromJson<String>(json['id']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      name: serializer.fromJson<String>(json['name']),
      sku: serializer.fromJson<String?>(json['sku']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      description: serializer.fromJson<String?>(json['description']),
      unitName: serializer.fromJson<String>(json['unitName']),
      costPriceCents: serializer.fromJson<int>(json['costPriceCents']),
      sellingPriceCents: serializer.fromJson<int>(json['sellingPriceCents']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'remoteId': serializer.toJson<String?>(remoteId),
      'name': serializer.toJson<String>(name),
      'sku': serializer.toJson<String?>(sku),
      'barcode': serializer.toJson<String?>(barcode),
      'description': serializer.toJson<String?>(description),
      'unitName': serializer.toJson<String>(unitName),
      'costPriceCents': serializer.toJson<int>(costPriceCents),
      'sellingPriceCents': serializer.toJson<int>(sellingPriceCents),
      'isActive': serializer.toJson<bool>(isActive),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ProductRow copyWith({
    String? id,
    Value<String?> remoteId = const Value.absent(),
    String? name,
    Value<String?> sku = const Value.absent(),
    Value<String?> barcode = const Value.absent(),
    Value<String?> description = const Value.absent(),
    String? unitName,
    int? costPriceCents,
    int? sellingPriceCents,
    bool? isActive,
    String? syncStatus,
    Value<DateTime?> deletedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ProductRow(
    id: id ?? this.id,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    name: name ?? this.name,
    sku: sku.present ? sku.value : this.sku,
    barcode: barcode.present ? barcode.value : this.barcode,
    description: description.present ? description.value : this.description,
    unitName: unitName ?? this.unitName,
    costPriceCents: costPriceCents ?? this.costPriceCents,
    sellingPriceCents: sellingPriceCents ?? this.sellingPriceCents,
    isActive: isActive ?? this.isActive,
    syncStatus: syncStatus ?? this.syncStatus,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ProductRow copyWithCompanion(ProductsCompanion data) {
    return ProductRow(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      name: data.name.present ? data.name.value : this.name,
      sku: data.sku.present ? data.sku.value : this.sku,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      description: data.description.present
          ? data.description.value
          : this.description,
      unitName: data.unitName.present ? data.unitName.value : this.unitName,
      costPriceCents: data.costPriceCents.present
          ? data.costPriceCents.value
          : this.costPriceCents,
      sellingPriceCents: data.sellingPriceCents.present
          ? data.sellingPriceCents.value
          : this.sellingPriceCents,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductRow(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('name: $name, ')
          ..write('sku: $sku, ')
          ..write('barcode: $barcode, ')
          ..write('description: $description, ')
          ..write('unitName: $unitName, ')
          ..write('costPriceCents: $costPriceCents, ')
          ..write('sellingPriceCents: $sellingPriceCents, ')
          ..write('isActive: $isActive, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    remoteId,
    name,
    sku,
    barcode,
    description,
    unitName,
    costPriceCents,
    sellingPriceCents,
    isActive,
    syncStatus,
    deletedAt,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductRow &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.name == this.name &&
          other.sku == this.sku &&
          other.barcode == this.barcode &&
          other.description == this.description &&
          other.unitName == this.unitName &&
          other.costPriceCents == this.costPriceCents &&
          other.sellingPriceCents == this.sellingPriceCents &&
          other.isActive == this.isActive &&
          other.syncStatus == this.syncStatus &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProductsCompanion extends UpdateCompanion<ProductRow> {
  final Value<String> id;
  final Value<String?> remoteId;
  final Value<String> name;
  final Value<String?> sku;
  final Value<String?> barcode;
  final Value<String?> description;
  final Value<String> unitName;
  final Value<int> costPriceCents;
  final Value<int> sellingPriceCents;
  final Value<bool> isActive;
  final Value<String> syncStatus;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.name = const Value.absent(),
    this.sku = const Value.absent(),
    this.barcode = const Value.absent(),
    this.description = const Value.absent(),
    this.unitName = const Value.absent(),
    this.costPriceCents = const Value.absent(),
    this.sellingPriceCents = const Value.absent(),
    this.isActive = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    this.remoteId = const Value.absent(),
    required String name,
    this.sku = const Value.absent(),
    this.barcode = const Value.absent(),
    this.description = const Value.absent(),
    this.unitName = const Value.absent(),
    this.costPriceCents = const Value.absent(),
    this.sellingPriceCents = const Value.absent(),
    this.isActive = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ProductRow> custom({
    Expression<String>? id,
    Expression<String>? remoteId,
    Expression<String>? name,
    Expression<String>? sku,
    Expression<String>? barcode,
    Expression<String>? description,
    Expression<String>? unitName,
    Expression<int>? costPriceCents,
    Expression<int>? sellingPriceCents,
    Expression<bool>? isActive,
    Expression<String>? syncStatus,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (name != null) 'name': name,
      if (sku != null) 'sku': sku,
      if (barcode != null) 'barcode': barcode,
      if (description != null) 'description': description,
      if (unitName != null) 'unit_name': unitName,
      if (costPriceCents != null) 'cost_price_cents': costPriceCents,
      if (sellingPriceCents != null) 'selling_price_cents': sellingPriceCents,
      if (isActive != null) 'is_active': isActive,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith({
    Value<String>? id,
    Value<String?>? remoteId,
    Value<String>? name,
    Value<String?>? sku,
    Value<String?>? barcode,
    Value<String?>? description,
    Value<String>? unitName,
    Value<int>? costPriceCents,
    Value<int>? sellingPriceCents,
    Value<bool>? isActive,
    Value<String>? syncStatus,
    Value<DateTime?>? deletedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      barcode: barcode ?? this.barcode,
      description: description ?? this.description,
      unitName: unitName ?? this.unitName,
      costPriceCents: costPriceCents ?? this.costPriceCents,
      sellingPriceCents: sellingPriceCents ?? this.sellingPriceCents,
      isActive: isActive ?? this.isActive,
      syncStatus: syncStatus ?? this.syncStatus,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (unitName.present) {
      map['unit_name'] = Variable<String>(unitName.value);
    }
    if (costPriceCents.present) {
      map['cost_price_cents'] = Variable<int>(costPriceCents.value);
    }
    if (sellingPriceCents.present) {
      map['selling_price_cents'] = Variable<int>(sellingPriceCents.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('name: $name, ')
          ..write('sku: $sku, ')
          ..write('barcode: $barcode, ')
          ..write('description: $description, ')
          ..write('unitName: $unitName, ')
          ..write('costPriceCents: $costPriceCents, ')
          ..write('sellingPriceCents: $sellingPriceCents, ')
          ..write('isActive: $isActive, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StoresTable stores = $StoresTable(this);
  late final $OwnerAccountsTable ownerAccounts = $OwnerAccountsTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final Index idxProductsName = Index(
    'idx_products_name',
    'CREATE INDEX idx_products_name ON products (name)',
  );
  late final Index idxProductsBarcode = Index(
    'idx_products_barcode',
    'CREATE INDEX idx_products_barcode ON products (barcode)',
  );
  late final Index idxProductsSku = Index(
    'idx_products_sku',
    'CREATE INDEX idx_products_sku ON products (sku)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    stores,
    ownerAccounts,
    appSettings,
    products,
    idxProductsName,
    idxProductsBarcode,
    idxProductsSku,
  ];
}

typedef $$StoresTableCreateCompanionBuilder =
    StoresCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> logoPath,
      Value<String> setupMode,
      Value<String?> remoteId,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<DateTime?> deletedAt,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> address,
      Value<String?> taxNumber,
      Value<String?> receiptFooter,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$StoresTableUpdateCompanionBuilder =
    StoresCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> logoPath,
      Value<String> setupMode,
      Value<String?> remoteId,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<DateTime?> deletedAt,
      Value<String?> phone,
      Value<String?> email,
      Value<String?> address,
      Value<String?> taxNumber,
      Value<String?> receiptFooter,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$StoresTableFilterComposer
    extends Composer<_$AppDatabase, $StoresTable> {
  $$StoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get setupMode => $composableBuilder(
    column: $table.setupMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taxNumber => $composableBuilder(
    column: $table.taxNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receiptFooter => $composableBuilder(
    column: $table.receiptFooter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StoresTableOrderingComposer
    extends Composer<_$AppDatabase, $StoresTable> {
  $$StoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get setupMode => $composableBuilder(
    column: $table.setupMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taxNumber => $composableBuilder(
    column: $table.taxNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receiptFooter => $composableBuilder(
    column: $table.receiptFooter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StoresTableAnnotationComposer
    extends Composer<_$AppDatabase, $StoresTable> {
  $$StoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get logoPath =>
      $composableBuilder(column: $table.logoPath, builder: (column) => column);

  GeneratedColumn<String> get setupMode =>
      $composableBuilder(column: $table.setupMode, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get taxNumber =>
      $composableBuilder(column: $table.taxNumber, builder: (column) => column);

  GeneratedColumn<String> get receiptFooter => $composableBuilder(
    column: $table.receiptFooter,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$StoresTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StoresTable,
          Store,
          $$StoresTableFilterComposer,
          $$StoresTableOrderingComposer,
          $$StoresTableAnnotationComposer,
          $$StoresTableCreateCompanionBuilder,
          $$StoresTableUpdateCompanionBuilder,
          (Store, BaseReferences<_$AppDatabase, $StoresTable, Store>),
          Store,
          PrefetchHooks Function()
        > {
  $$StoresTableTableManager(_$AppDatabase db, $StoresTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> logoPath = const Value.absent(),
                Value<String> setupMode = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> taxNumber = const Value.absent(),
                Value<String?> receiptFooter = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => StoresCompanion(
                id: id,
                name: name,
                logoPath: logoPath,
                setupMode: setupMode,
                remoteId: remoteId,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                deletedAt: deletedAt,
                phone: phone,
                email: email,
                address: address,
                taxNumber: taxNumber,
                receiptFooter: receiptFooter,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> logoPath = const Value.absent(),
                Value<String> setupMode = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> taxNumber = const Value.absent(),
                Value<String?> receiptFooter = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => StoresCompanion.insert(
                id: id,
                name: name,
                logoPath: logoPath,
                setupMode: setupMode,
                remoteId: remoteId,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                deletedAt: deletedAt,
                phone: phone,
                email: email,
                address: address,
                taxNumber: taxNumber,
                receiptFooter: receiptFooter,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StoresTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StoresTable,
      Store,
      $$StoresTableFilterComposer,
      $$StoresTableOrderingComposer,
      $$StoresTableAnnotationComposer,
      $$StoresTableCreateCompanionBuilder,
      $$StoresTableUpdateCompanionBuilder,
      (Store, BaseReferences<_$AppDatabase, $StoresTable, Store>),
      Store,
      PrefetchHooks Function()
    >;
typedef $$OwnerAccountsTableCreateCompanionBuilder =
    OwnerAccountsCompanion Function({
      Value<int> id,
      required String name,
      required String email,
      Value<String?> remoteId,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<DateTime?> deletedAt,
      required String passwordHash,
      required String passwordSalt,
      required String pinHash,
      required String pinSalt,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$OwnerAccountsTableUpdateCompanionBuilder =
    OwnerAccountsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> email,
      Value<String?> remoteId,
      Value<String> syncStatus,
      Value<int> syncVersion,
      Value<DateTime?> deletedAt,
      Value<String> passwordHash,
      Value<String> passwordSalt,
      Value<String> pinHash,
      Value<String> pinSalt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$OwnerAccountsTableFilterComposer
    extends Composer<_$AppDatabase, $OwnerAccountsTable> {
  $$OwnerAccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passwordSalt => $composableBuilder(
    column: $table.passwordSalt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pinHash => $composableBuilder(
    column: $table.pinHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pinSalt => $composableBuilder(
    column: $table.pinSalt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OwnerAccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $OwnerAccountsTable> {
  $$OwnerAccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passwordSalt => $composableBuilder(
    column: $table.passwordSalt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pinHash => $composableBuilder(
    column: $table.pinHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pinSalt => $composableBuilder(
    column: $table.pinSalt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OwnerAccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OwnerAccountsTable> {
  $$OwnerAccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get syncVersion => $composableBuilder(
    column: $table.syncVersion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => column,
  );

  GeneratedColumn<String> get passwordSalt => $composableBuilder(
    column: $table.passwordSalt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pinHash =>
      $composableBuilder(column: $table.pinHash, builder: (column) => column);

  GeneratedColumn<String> get pinSalt =>
      $composableBuilder(column: $table.pinSalt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$OwnerAccountsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OwnerAccountsTable,
          OwnerAccount,
          $$OwnerAccountsTableFilterComposer,
          $$OwnerAccountsTableOrderingComposer,
          $$OwnerAccountsTableAnnotationComposer,
          $$OwnerAccountsTableCreateCompanionBuilder,
          $$OwnerAccountsTableUpdateCompanionBuilder,
          (
            OwnerAccount,
            BaseReferences<_$AppDatabase, $OwnerAccountsTable, OwnerAccount>,
          ),
          OwnerAccount,
          PrefetchHooks Function()
        > {
  $$OwnerAccountsTableTableManager(_$AppDatabase db, $OwnerAccountsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OwnerAccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OwnerAccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OwnerAccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<String> passwordHash = const Value.absent(),
                Value<String> passwordSalt = const Value.absent(),
                Value<String> pinHash = const Value.absent(),
                Value<String> pinSalt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => OwnerAccountsCompanion(
                id: id,
                name: name,
                email: email,
                remoteId: remoteId,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                deletedAt: deletedAt,
                passwordHash: passwordHash,
                passwordSalt: passwordSalt,
                pinHash: pinHash,
                pinSalt: pinSalt,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String email,
                Value<String?> remoteId = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> syncVersion = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required String passwordHash,
                required String passwordSalt,
                required String pinHash,
                required String pinSalt,
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => OwnerAccountsCompanion.insert(
                id: id,
                name: name,
                email: email,
                remoteId: remoteId,
                syncStatus: syncStatus,
                syncVersion: syncVersion,
                deletedAt: deletedAt,
                passwordHash: passwordHash,
                passwordSalt: passwordSalt,
                pinHash: pinHash,
                pinSalt: pinSalt,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OwnerAccountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OwnerAccountsTable,
      OwnerAccount,
      $$OwnerAccountsTableFilterComposer,
      $$OwnerAccountsTableOrderingComposer,
      $$OwnerAccountsTableAnnotationComposer,
      $$OwnerAccountsTableCreateCompanionBuilder,
      $$OwnerAccountsTableUpdateCompanionBuilder,
      (
        OwnerAccount,
        BaseReferences<_$AppDatabase, $OwnerAccountsTable, OwnerAccount>,
      ),
      OwnerAccount,
      PrefetchHooks Function()
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required String key,
      required String value,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      required String id,
      Value<String?> remoteId,
      required String name,
      Value<String?> sku,
      Value<String?> barcode,
      Value<String?> description,
      Value<String> unitName,
      Value<int> costPriceCents,
      Value<int> sellingPriceCents,
      Value<bool> isActive,
      Value<String> syncStatus,
      Value<DateTime?> deletedAt,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<String> id,
      Value<String?> remoteId,
      Value<String> name,
      Value<String?> sku,
      Value<String?> barcode,
      Value<String?> description,
      Value<String> unitName,
      Value<int> costPriceCents,
      Value<int> sellingPriceCents,
      Value<bool> isActive,
      Value<String> syncStatus,
      Value<DateTime?> deletedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitName => $composableBuilder(
    column: $table.unitName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get costPriceCents => $composableBuilder(
    column: $table.costPriceCents,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sellingPriceCents => $composableBuilder(
    column: $table.sellingPriceCents,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitName => $composableBuilder(
    column: $table.unitName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get costPriceCents => $composableBuilder(
    column: $table.costPriceCents,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sellingPriceCents => $composableBuilder(
    column: $table.sellingPriceCents,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unitName =>
      $composableBuilder(column: $table.unitName, builder: (column) => column);

  GeneratedColumn<int> get costPriceCents => $composableBuilder(
    column: $table.costPriceCents,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sellingPriceCents => $composableBuilder(
    column: $table.sellingPriceCents,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          ProductRow,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (
            ProductRow,
            BaseReferences<_$AppDatabase, $ProductsTable, ProductRow>,
          ),
          ProductRow,
          PrefetchHooks Function()
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> sku = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> unitName = const Value.absent(),
                Value<int> costPriceCents = const Value.absent(),
                Value<int> sellingPriceCents = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                remoteId: remoteId,
                name: name,
                sku: sku,
                barcode: barcode,
                description: description,
                unitName: unitName,
                costPriceCents: costPriceCents,
                sellingPriceCents: sellingPriceCents,
                isActive: isActive,
                syncStatus: syncStatus,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> remoteId = const Value.absent(),
                required String name,
                Value<String?> sku = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> unitName = const Value.absent(),
                Value<int> costPriceCents = const Value.absent(),
                Value<int> sellingPriceCents = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                remoteId: remoteId,
                name: name,
                sku: sku,
                barcode: barcode,
                description: description,
                unitName: unitName,
                costPriceCents: costPriceCents,
                sellingPriceCents: sellingPriceCents,
                isActive: isActive,
                syncStatus: syncStatus,
                deletedAt: deletedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      ProductRow,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (ProductRow, BaseReferences<_$AppDatabase, $ProductsTable, ProductRow>),
      ProductRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StoresTableTableManager get stores =>
      $$StoresTableTableManager(_db, _db.stores);
  $$OwnerAccountsTableTableManager get ownerAccounts =>
      $$OwnerAccountsTableTableManager(_db, _db.ownerAccounts);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
}
