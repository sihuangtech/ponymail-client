// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imapHostMeta = const VerificationMeta(
    'imapHost',
  );
  @override
  late final GeneratedColumn<String> imapHost = GeneratedColumn<String>(
    'imap_host',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imapPortMeta = const VerificationMeta(
    'imapPort',
  );
  @override
  late final GeneratedColumn<int> imapPort = GeneratedColumn<int>(
    'imap_port',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imapSslMeta = const VerificationMeta(
    'imapSsl',
  );
  @override
  late final GeneratedColumn<bool> imapSsl = GeneratedColumn<bool>(
    'imap_ssl',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("imap_ssl" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _smtpHostMeta = const VerificationMeta(
    'smtpHost',
  );
  @override
  late final GeneratedColumn<String> smtpHost = GeneratedColumn<String>(
    'smtp_host',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _smtpPortMeta = const VerificationMeta(
    'smtpPort',
  );
  @override
  late final GeneratedColumn<int> smtpPort = GeneratedColumn<int>(
    'smtp_port',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _smtpSslMeta = const VerificationMeta(
    'smtpSsl',
  );
  @override
  late final GeneratedColumn<bool> smtpSsl = GeneratedColumn<bool>(
    'smtp_ssl',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("smtp_ssl" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _passwordKeyMeta = const VerificationMeta(
    'passwordKey',
  );
  @override
  late final GeneratedColumn<String> passwordKey = GeneratedColumn<String>(
    'password_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _signatureMeta = const VerificationMeta(
    'signature',
  );
  @override
  late final GeneratedColumn<String> signature = GeneratedColumn<String>(
    'signature',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    email,
    displayName,
    imapHost,
    imapPort,
    imapSsl,
    smtpHost,
    smtpPort,
    smtpSsl,
    passwordKey,
    color,
    signature,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Account> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('imap_host')) {
      context.handle(
        _imapHostMeta,
        imapHost.isAcceptableOrUnknown(data['imap_host']!, _imapHostMeta),
      );
    } else if (isInserting) {
      context.missing(_imapHostMeta);
    }
    if (data.containsKey('imap_port')) {
      context.handle(
        _imapPortMeta,
        imapPort.isAcceptableOrUnknown(data['imap_port']!, _imapPortMeta),
      );
    } else if (isInserting) {
      context.missing(_imapPortMeta);
    }
    if (data.containsKey('imap_ssl')) {
      context.handle(
        _imapSslMeta,
        imapSsl.isAcceptableOrUnknown(data['imap_ssl']!, _imapSslMeta),
      );
    }
    if (data.containsKey('smtp_host')) {
      context.handle(
        _smtpHostMeta,
        smtpHost.isAcceptableOrUnknown(data['smtp_host']!, _smtpHostMeta),
      );
    } else if (isInserting) {
      context.missing(_smtpHostMeta);
    }
    if (data.containsKey('smtp_port')) {
      context.handle(
        _smtpPortMeta,
        smtpPort.isAcceptableOrUnknown(data['smtp_port']!, _smtpPortMeta),
      );
    } else if (isInserting) {
      context.missing(_smtpPortMeta);
    }
    if (data.containsKey('smtp_ssl')) {
      context.handle(
        _smtpSslMeta,
        smtpSsl.isAcceptableOrUnknown(data['smtp_ssl']!, _smtpSslMeta),
      );
    }
    if (data.containsKey('password_key')) {
      context.handle(
        _passwordKeyMeta,
        passwordKey.isAcceptableOrUnknown(
          data['password_key']!,
          _passwordKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passwordKeyMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('signature')) {
      context.handle(
        _signatureMeta,
        signature.isAcceptableOrUnknown(data['signature']!, _signatureMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      imapHost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}imap_host'],
      )!,
      imapPort: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}imap_port'],
      )!,
      imapSsl: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}imap_ssl'],
      )!,
      smtpHost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}smtp_host'],
      )!,
      smtpPort: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}smtp_port'],
      )!,
      smtpSsl: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}smtp_ssl'],
      )!,
      passwordKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_key'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      )!,
      signature: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}signature'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }
}

class Account extends DataClass implements Insertable<Account> {
  final int id;
  final String email;
  final String displayName;
  final String imapHost;
  final int imapPort;
  final bool imapSsl;
  final String smtpHost;
  final int smtpPort;
  final bool smtpSsl;
  final String passwordKey;
  final int color;
  final String signature;
  final DateTime createdAt;
  const Account({
    required this.id,
    required this.email,
    required this.displayName,
    required this.imapHost,
    required this.imapPort,
    required this.imapSsl,
    required this.smtpHost,
    required this.smtpPort,
    required this.smtpSsl,
    required this.passwordKey,
    required this.color,
    required this.signature,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    map['display_name'] = Variable<String>(displayName);
    map['imap_host'] = Variable<String>(imapHost);
    map['imap_port'] = Variable<int>(imapPort);
    map['imap_ssl'] = Variable<bool>(imapSsl);
    map['smtp_host'] = Variable<String>(smtpHost);
    map['smtp_port'] = Variable<int>(smtpPort);
    map['smtp_ssl'] = Variable<bool>(smtpSsl);
    map['password_key'] = Variable<String>(passwordKey);
    map['color'] = Variable<int>(color);
    map['signature'] = Variable<String>(signature);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      email: Value(email),
      displayName: Value(displayName),
      imapHost: Value(imapHost),
      imapPort: Value(imapPort),
      imapSsl: Value(imapSsl),
      smtpHost: Value(smtpHost),
      smtpPort: Value(smtpPort),
      smtpSsl: Value(smtpSsl),
      passwordKey: Value(passwordKey),
      color: Value(color),
      signature: Value(signature),
      createdAt: Value(createdAt),
    );
  }

  factory Account.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      displayName: serializer.fromJson<String>(json['displayName']),
      imapHost: serializer.fromJson<String>(json['imapHost']),
      imapPort: serializer.fromJson<int>(json['imapPort']),
      imapSsl: serializer.fromJson<bool>(json['imapSsl']),
      smtpHost: serializer.fromJson<String>(json['smtpHost']),
      smtpPort: serializer.fromJson<int>(json['smtpPort']),
      smtpSsl: serializer.fromJson<bool>(json['smtpSsl']),
      passwordKey: serializer.fromJson<String>(json['passwordKey']),
      color: serializer.fromJson<int>(json['color']),
      signature: serializer.fromJson<String>(json['signature']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'displayName': serializer.toJson<String>(displayName),
      'imapHost': serializer.toJson<String>(imapHost),
      'imapPort': serializer.toJson<int>(imapPort),
      'imapSsl': serializer.toJson<bool>(imapSsl),
      'smtpHost': serializer.toJson<String>(smtpHost),
      'smtpPort': serializer.toJson<int>(smtpPort),
      'smtpSsl': serializer.toJson<bool>(smtpSsl),
      'passwordKey': serializer.toJson<String>(passwordKey),
      'color': serializer.toJson<int>(color),
      'signature': serializer.toJson<String>(signature),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Account copyWith({
    int? id,
    String? email,
    String? displayName,
    String? imapHost,
    int? imapPort,
    bool? imapSsl,
    String? smtpHost,
    int? smtpPort,
    bool? smtpSsl,
    String? passwordKey,
    int? color,
    String? signature,
    DateTime? createdAt,
  }) => Account(
    id: id ?? this.id,
    email: email ?? this.email,
    displayName: displayName ?? this.displayName,
    imapHost: imapHost ?? this.imapHost,
    imapPort: imapPort ?? this.imapPort,
    imapSsl: imapSsl ?? this.imapSsl,
    smtpHost: smtpHost ?? this.smtpHost,
    smtpPort: smtpPort ?? this.smtpPort,
    smtpSsl: smtpSsl ?? this.smtpSsl,
    passwordKey: passwordKey ?? this.passwordKey,
    color: color ?? this.color,
    signature: signature ?? this.signature,
    createdAt: createdAt ?? this.createdAt,
  );
  Account copyWithCompanion(AccountsCompanion data) {
    return Account(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      imapHost: data.imapHost.present ? data.imapHost.value : this.imapHost,
      imapPort: data.imapPort.present ? data.imapPort.value : this.imapPort,
      imapSsl: data.imapSsl.present ? data.imapSsl.value : this.imapSsl,
      smtpHost: data.smtpHost.present ? data.smtpHost.value : this.smtpHost,
      smtpPort: data.smtpPort.present ? data.smtpPort.value : this.smtpPort,
      smtpSsl: data.smtpSsl.present ? data.smtpSsl.value : this.smtpSsl,
      passwordKey: data.passwordKey.present
          ? data.passwordKey.value
          : this.passwordKey,
      color: data.color.present ? data.color.value : this.color,
      signature: data.signature.present ? data.signature.value : this.signature,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('imapHost: $imapHost, ')
          ..write('imapPort: $imapPort, ')
          ..write('imapSsl: $imapSsl, ')
          ..write('smtpHost: $smtpHost, ')
          ..write('smtpPort: $smtpPort, ')
          ..write('smtpSsl: $smtpSsl, ')
          ..write('passwordKey: $passwordKey, ')
          ..write('color: $color, ')
          ..write('signature: $signature, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    email,
    displayName,
    imapHost,
    imapPort,
    imapSsl,
    smtpHost,
    smtpPort,
    smtpSsl,
    passwordKey,
    color,
    signature,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.id == this.id &&
          other.email == this.email &&
          other.displayName == this.displayName &&
          other.imapHost == this.imapHost &&
          other.imapPort == this.imapPort &&
          other.imapSsl == this.imapSsl &&
          other.smtpHost == this.smtpHost &&
          other.smtpPort == this.smtpPort &&
          other.smtpSsl == this.smtpSsl &&
          other.passwordKey == this.passwordKey &&
          other.color == this.color &&
          other.signature == this.signature &&
          other.createdAt == this.createdAt);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> displayName;
  final Value<String> imapHost;
  final Value<int> imapPort;
  final Value<bool> imapSsl;
  final Value<String> smtpHost;
  final Value<int> smtpPort;
  final Value<bool> smtpSsl;
  final Value<String> passwordKey;
  final Value<int> color;
  final Value<String> signature;
  final Value<DateTime> createdAt;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.displayName = const Value.absent(),
    this.imapHost = const Value.absent(),
    this.imapPort = const Value.absent(),
    this.imapSsl = const Value.absent(),
    this.smtpHost = const Value.absent(),
    this.smtpPort = const Value.absent(),
    this.smtpSsl = const Value.absent(),
    this.passwordKey = const Value.absent(),
    this.color = const Value.absent(),
    this.signature = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    required String email,
    required String displayName,
    required String imapHost,
    required int imapPort,
    this.imapSsl = const Value.absent(),
    required String smtpHost,
    required int smtpPort,
    this.smtpSsl = const Value.absent(),
    required String passwordKey,
    required int color,
    this.signature = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : email = Value(email),
       displayName = Value(displayName),
       imapHost = Value(imapHost),
       imapPort = Value(imapPort),
       smtpHost = Value(smtpHost),
       smtpPort = Value(smtpPort),
       passwordKey = Value(passwordKey),
       color = Value(color);
  static Insertable<Account> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? displayName,
    Expression<String>? imapHost,
    Expression<int>? imapPort,
    Expression<bool>? imapSsl,
    Expression<String>? smtpHost,
    Expression<int>? smtpPort,
    Expression<bool>? smtpSsl,
    Expression<String>? passwordKey,
    Expression<int>? color,
    Expression<String>? signature,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (displayName != null) 'display_name': displayName,
      if (imapHost != null) 'imap_host': imapHost,
      if (imapPort != null) 'imap_port': imapPort,
      if (imapSsl != null) 'imap_ssl': imapSsl,
      if (smtpHost != null) 'smtp_host': smtpHost,
      if (smtpPort != null) 'smtp_port': smtpPort,
      if (smtpSsl != null) 'smtp_ssl': smtpSsl,
      if (passwordKey != null) 'password_key': passwordKey,
      if (color != null) 'color': color,
      if (signature != null) 'signature': signature,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AccountsCompanion copyWith({
    Value<int>? id,
    Value<String>? email,
    Value<String>? displayName,
    Value<String>? imapHost,
    Value<int>? imapPort,
    Value<bool>? imapSsl,
    Value<String>? smtpHost,
    Value<int>? smtpPort,
    Value<bool>? smtpSsl,
    Value<String>? passwordKey,
    Value<int>? color,
    Value<String>? signature,
    Value<DateTime>? createdAt,
  }) {
    return AccountsCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      imapHost: imapHost ?? this.imapHost,
      imapPort: imapPort ?? this.imapPort,
      imapSsl: imapSsl ?? this.imapSsl,
      smtpHost: smtpHost ?? this.smtpHost,
      smtpPort: smtpPort ?? this.smtpPort,
      smtpSsl: smtpSsl ?? this.smtpSsl,
      passwordKey: passwordKey ?? this.passwordKey,
      color: color ?? this.color,
      signature: signature ?? this.signature,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (imapHost.present) {
      map['imap_host'] = Variable<String>(imapHost.value);
    }
    if (imapPort.present) {
      map['imap_port'] = Variable<int>(imapPort.value);
    }
    if (imapSsl.present) {
      map['imap_ssl'] = Variable<bool>(imapSsl.value);
    }
    if (smtpHost.present) {
      map['smtp_host'] = Variable<String>(smtpHost.value);
    }
    if (smtpPort.present) {
      map['smtp_port'] = Variable<int>(smtpPort.value);
    }
    if (smtpSsl.present) {
      map['smtp_ssl'] = Variable<bool>(smtpSsl.value);
    }
    if (passwordKey.present) {
      map['password_key'] = Variable<String>(passwordKey.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (signature.present) {
      map['signature'] = Variable<String>(signature.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('displayName: $displayName, ')
          ..write('imapHost: $imapHost, ')
          ..write('imapPort: $imapPort, ')
          ..write('imapSsl: $imapSsl, ')
          ..write('smtpHost: $smtpHost, ')
          ..write('smtpPort: $smtpPort, ')
          ..write('smtpSsl: $smtpSsl, ')
          ..write('passwordKey: $passwordKey, ')
          ..write('color: $color, ')
          ..write('signature: $signature, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $EmailsTable extends Emails with TableInfo<$EmailsTable, Email> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmailsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteUidMeta = const VerificationMeta(
    'remoteUid',
  );
  @override
  late final GeneratedColumn<int> remoteUid = GeneratedColumn<int>(
    'remote_uid',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _messageIdMeta = const VerificationMeta(
    'messageId',
  );
  @override
  late final GeneratedColumn<String> messageId = GeneratedColumn<String>(
    'message_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mailboxMeta = const VerificationMeta(
    'mailbox',
  );
  @override
  late final GeneratedColumn<String> mailbox = GeneratedColumn<String>(
    'mailbox',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subjectMeta = const VerificationMeta(
    'subject',
  );
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
    'subject',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fromNameMeta = const VerificationMeta(
    'fromName',
  );
  @override
  late final GeneratedColumn<String> fromName = GeneratedColumn<String>(
    'from_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fromEmailMeta = const VerificationMeta(
    'fromEmail',
  );
  @override
  late final GeneratedColumn<String> fromEmail = GeneratedColumn<String>(
    'from_email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toListMeta = const VerificationMeta('toList');
  @override
  late final GeneratedColumn<String> toList = GeneratedColumn<String>(
    'to_list',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ccListMeta = const VerificationMeta('ccList');
  @override
  late final GeneratedColumn<String> ccList = GeneratedColumn<String>(
    'cc_list',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _bccListMeta = const VerificationMeta(
    'bccList',
  );
  @override
  late final GeneratedColumn<String> bccList = GeneratedColumn<String>(
    'bcc_list',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _previewMeta = const VerificationMeta(
    'preview',
  );
  @override
  late final GeneratedColumn<String> preview = GeneratedColumn<String>(
    'preview',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _bodyPlainMeta = const VerificationMeta(
    'bodyPlain',
  );
  @override
  late final GeneratedColumn<String> bodyPlain = GeneratedColumn<String>(
    'body_plain',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _bodyHtmlMeta = const VerificationMeta(
    'bodyHtml',
  );
  @override
  late final GeneratedColumn<String> bodyHtml = GeneratedColumn<String>(
    'body_html',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
    'is_read',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_read" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isStarredMeta = const VerificationMeta(
    'isStarred',
  );
  @override
  late final GeneratedColumn<bool> isStarred = GeneratedColumn<bool>(
    'is_starred',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_starred" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isDraftMeta = const VerificationMeta(
    'isDraft',
  );
  @override
  late final GeneratedColumn<bool> isDraft = GeneratedColumn<bool>(
    'is_draft',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_draft" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _labelsMeta = const VerificationMeta('labels');
  @override
  late final GeneratedColumn<String> labels = GeneratedColumn<String>(
    'labels',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _threadIdMeta = const VerificationMeta(
    'threadId',
  );
  @override
  late final GeneratedColumn<String> threadId = GeneratedColumn<String>(
    'thread_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _hasAttachmentsMeta = const VerificationMeta(
    'hasAttachments',
  );
  @override
  late final GeneratedColumn<bool> hasAttachments = GeneratedColumn<bool>(
    'has_attachments',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_attachments" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    remoteUid,
    messageId,
    mailbox,
    subject,
    fromName,
    fromEmail,
    toList,
    ccList,
    bccList,
    date,
    preview,
    bodyPlain,
    bodyHtml,
    isRead,
    isStarred,
    isDeleted,
    isDraft,
    labels,
    threadId,
    hasAttachments,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'emails';
  @override
  VerificationContext validateIntegrity(
    Insertable<Email> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('remote_uid')) {
      context.handle(
        _remoteUidMeta,
        remoteUid.isAcceptableOrUnknown(data['remote_uid']!, _remoteUidMeta),
      );
    }
    if (data.containsKey('message_id')) {
      context.handle(
        _messageIdMeta,
        messageId.isAcceptableOrUnknown(data['message_id']!, _messageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messageIdMeta);
    }
    if (data.containsKey('mailbox')) {
      context.handle(
        _mailboxMeta,
        mailbox.isAcceptableOrUnknown(data['mailbox']!, _mailboxMeta),
      );
    } else if (isInserting) {
      context.missing(_mailboxMeta);
    }
    if (data.containsKey('subject')) {
      context.handle(
        _subjectMeta,
        subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('from_name')) {
      context.handle(
        _fromNameMeta,
        fromName.isAcceptableOrUnknown(data['from_name']!, _fromNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fromNameMeta);
    }
    if (data.containsKey('from_email')) {
      context.handle(
        _fromEmailMeta,
        fromEmail.isAcceptableOrUnknown(data['from_email']!, _fromEmailMeta),
      );
    } else if (isInserting) {
      context.missing(_fromEmailMeta);
    }
    if (data.containsKey('to_list')) {
      context.handle(
        _toListMeta,
        toList.isAcceptableOrUnknown(data['to_list']!, _toListMeta),
      );
    } else if (isInserting) {
      context.missing(_toListMeta);
    }
    if (data.containsKey('cc_list')) {
      context.handle(
        _ccListMeta,
        ccList.isAcceptableOrUnknown(data['cc_list']!, _ccListMeta),
      );
    }
    if (data.containsKey('bcc_list')) {
      context.handle(
        _bccListMeta,
        bccList.isAcceptableOrUnknown(data['bcc_list']!, _bccListMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('preview')) {
      context.handle(
        _previewMeta,
        preview.isAcceptableOrUnknown(data['preview']!, _previewMeta),
      );
    }
    if (data.containsKey('body_plain')) {
      context.handle(
        _bodyPlainMeta,
        bodyPlain.isAcceptableOrUnknown(data['body_plain']!, _bodyPlainMeta),
      );
    }
    if (data.containsKey('body_html')) {
      context.handle(
        _bodyHtmlMeta,
        bodyHtml.isAcceptableOrUnknown(data['body_html']!, _bodyHtmlMeta),
      );
    }
    if (data.containsKey('is_read')) {
      context.handle(
        _isReadMeta,
        isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta),
      );
    }
    if (data.containsKey('is_starred')) {
      context.handle(
        _isStarredMeta,
        isStarred.isAcceptableOrUnknown(data['is_starred']!, _isStarredMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('is_draft')) {
      context.handle(
        _isDraftMeta,
        isDraft.isAcceptableOrUnknown(data['is_draft']!, _isDraftMeta),
      );
    }
    if (data.containsKey('labels')) {
      context.handle(
        _labelsMeta,
        labels.isAcceptableOrUnknown(data['labels']!, _labelsMeta),
      );
    }
    if (data.containsKey('thread_id')) {
      context.handle(
        _threadIdMeta,
        threadId.isAcceptableOrUnknown(data['thread_id']!, _threadIdMeta),
      );
    }
    if (data.containsKey('has_attachments')) {
      context.handle(
        _hasAttachmentsMeta,
        hasAttachments.isAcceptableOrUnknown(
          data['has_attachments']!,
          _hasAttachmentsMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Email map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Email(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      remoteUid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_uid'],
      ),
      messageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message_id'],
      )!,
      mailbox: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mailbox'],
      )!,
      subject: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject'],
      )!,
      fromName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}from_name'],
      )!,
      fromEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}from_email'],
      )!,
      toList: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}to_list'],
      )!,
      ccList: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cc_list'],
      )!,
      bccList: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bcc_list'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      preview: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}preview'],
      )!,
      bodyPlain: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body_plain'],
      )!,
      bodyHtml: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body_html'],
      )!,
      isRead: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_read'],
      )!,
      isStarred: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_starred'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      isDraft: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_draft'],
      )!,
      labels: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}labels'],
      )!,
      threadId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thread_id'],
      )!,
      hasAttachments: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_attachments'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $EmailsTable createAlias(String alias) {
    return $EmailsTable(attachedDatabase, alias);
  }
}

class Email extends DataClass implements Insertable<Email> {
  final int id;
  final int accountId;
  final int? remoteUid;
  final String messageId;
  final String mailbox;
  final String subject;
  final String fromName;
  final String fromEmail;
  final String toList;
  final String ccList;
  final String bccList;
  final DateTime date;
  final String preview;
  final String bodyPlain;
  final String bodyHtml;
  final bool isRead;
  final bool isStarred;
  final bool isDeleted;
  final bool isDraft;
  final String labels;
  final String threadId;
  final bool hasAttachments;
  final DateTime createdAt;
  const Email({
    required this.id,
    required this.accountId,
    this.remoteUid,
    required this.messageId,
    required this.mailbox,
    required this.subject,
    required this.fromName,
    required this.fromEmail,
    required this.toList,
    required this.ccList,
    required this.bccList,
    required this.date,
    required this.preview,
    required this.bodyPlain,
    required this.bodyHtml,
    required this.isRead,
    required this.isStarred,
    required this.isDeleted,
    required this.isDraft,
    required this.labels,
    required this.threadId,
    required this.hasAttachments,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_id'] = Variable<int>(accountId);
    if (!nullToAbsent || remoteUid != null) {
      map['remote_uid'] = Variable<int>(remoteUid);
    }
    map['message_id'] = Variable<String>(messageId);
    map['mailbox'] = Variable<String>(mailbox);
    map['subject'] = Variable<String>(subject);
    map['from_name'] = Variable<String>(fromName);
    map['from_email'] = Variable<String>(fromEmail);
    map['to_list'] = Variable<String>(toList);
    map['cc_list'] = Variable<String>(ccList);
    map['bcc_list'] = Variable<String>(bccList);
    map['date'] = Variable<DateTime>(date);
    map['preview'] = Variable<String>(preview);
    map['body_plain'] = Variable<String>(bodyPlain);
    map['body_html'] = Variable<String>(bodyHtml);
    map['is_read'] = Variable<bool>(isRead);
    map['is_starred'] = Variable<bool>(isStarred);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['is_draft'] = Variable<bool>(isDraft);
    map['labels'] = Variable<String>(labels);
    map['thread_id'] = Variable<String>(threadId);
    map['has_attachments'] = Variable<bool>(hasAttachments);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  EmailsCompanion toCompanion(bool nullToAbsent) {
    return EmailsCompanion(
      id: Value(id),
      accountId: Value(accountId),
      remoteUid: remoteUid == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteUid),
      messageId: Value(messageId),
      mailbox: Value(mailbox),
      subject: Value(subject),
      fromName: Value(fromName),
      fromEmail: Value(fromEmail),
      toList: Value(toList),
      ccList: Value(ccList),
      bccList: Value(bccList),
      date: Value(date),
      preview: Value(preview),
      bodyPlain: Value(bodyPlain),
      bodyHtml: Value(bodyHtml),
      isRead: Value(isRead),
      isStarred: Value(isStarred),
      isDeleted: Value(isDeleted),
      isDraft: Value(isDraft),
      labels: Value(labels),
      threadId: Value(threadId),
      hasAttachments: Value(hasAttachments),
      createdAt: Value(createdAt),
    );
  }

  factory Email.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Email(
      id: serializer.fromJson<int>(json['id']),
      accountId: serializer.fromJson<int>(json['accountId']),
      remoteUid: serializer.fromJson<int?>(json['remoteUid']),
      messageId: serializer.fromJson<String>(json['messageId']),
      mailbox: serializer.fromJson<String>(json['mailbox']),
      subject: serializer.fromJson<String>(json['subject']),
      fromName: serializer.fromJson<String>(json['fromName']),
      fromEmail: serializer.fromJson<String>(json['fromEmail']),
      toList: serializer.fromJson<String>(json['toList']),
      ccList: serializer.fromJson<String>(json['ccList']),
      bccList: serializer.fromJson<String>(json['bccList']),
      date: serializer.fromJson<DateTime>(json['date']),
      preview: serializer.fromJson<String>(json['preview']),
      bodyPlain: serializer.fromJson<String>(json['bodyPlain']),
      bodyHtml: serializer.fromJson<String>(json['bodyHtml']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      isStarred: serializer.fromJson<bool>(json['isStarred']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      isDraft: serializer.fromJson<bool>(json['isDraft']),
      labels: serializer.fromJson<String>(json['labels']),
      threadId: serializer.fromJson<String>(json['threadId']),
      hasAttachments: serializer.fromJson<bool>(json['hasAttachments']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountId': serializer.toJson<int>(accountId),
      'remoteUid': serializer.toJson<int?>(remoteUid),
      'messageId': serializer.toJson<String>(messageId),
      'mailbox': serializer.toJson<String>(mailbox),
      'subject': serializer.toJson<String>(subject),
      'fromName': serializer.toJson<String>(fromName),
      'fromEmail': serializer.toJson<String>(fromEmail),
      'toList': serializer.toJson<String>(toList),
      'ccList': serializer.toJson<String>(ccList),
      'bccList': serializer.toJson<String>(bccList),
      'date': serializer.toJson<DateTime>(date),
      'preview': serializer.toJson<String>(preview),
      'bodyPlain': serializer.toJson<String>(bodyPlain),
      'bodyHtml': serializer.toJson<String>(bodyHtml),
      'isRead': serializer.toJson<bool>(isRead),
      'isStarred': serializer.toJson<bool>(isStarred),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'isDraft': serializer.toJson<bool>(isDraft),
      'labels': serializer.toJson<String>(labels),
      'threadId': serializer.toJson<String>(threadId),
      'hasAttachments': serializer.toJson<bool>(hasAttachments),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Email copyWith({
    int? id,
    int? accountId,
    Value<int?> remoteUid = const Value.absent(),
    String? messageId,
    String? mailbox,
    String? subject,
    String? fromName,
    String? fromEmail,
    String? toList,
    String? ccList,
    String? bccList,
    DateTime? date,
    String? preview,
    String? bodyPlain,
    String? bodyHtml,
    bool? isRead,
    bool? isStarred,
    bool? isDeleted,
    bool? isDraft,
    String? labels,
    String? threadId,
    bool? hasAttachments,
    DateTime? createdAt,
  }) => Email(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    remoteUid: remoteUid.present ? remoteUid.value : this.remoteUid,
    messageId: messageId ?? this.messageId,
    mailbox: mailbox ?? this.mailbox,
    subject: subject ?? this.subject,
    fromName: fromName ?? this.fromName,
    fromEmail: fromEmail ?? this.fromEmail,
    toList: toList ?? this.toList,
    ccList: ccList ?? this.ccList,
    bccList: bccList ?? this.bccList,
    date: date ?? this.date,
    preview: preview ?? this.preview,
    bodyPlain: bodyPlain ?? this.bodyPlain,
    bodyHtml: bodyHtml ?? this.bodyHtml,
    isRead: isRead ?? this.isRead,
    isStarred: isStarred ?? this.isStarred,
    isDeleted: isDeleted ?? this.isDeleted,
    isDraft: isDraft ?? this.isDraft,
    labels: labels ?? this.labels,
    threadId: threadId ?? this.threadId,
    hasAttachments: hasAttachments ?? this.hasAttachments,
    createdAt: createdAt ?? this.createdAt,
  );
  Email copyWithCompanion(EmailsCompanion data) {
    return Email(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      remoteUid: data.remoteUid.present ? data.remoteUid.value : this.remoteUid,
      messageId: data.messageId.present ? data.messageId.value : this.messageId,
      mailbox: data.mailbox.present ? data.mailbox.value : this.mailbox,
      subject: data.subject.present ? data.subject.value : this.subject,
      fromName: data.fromName.present ? data.fromName.value : this.fromName,
      fromEmail: data.fromEmail.present ? data.fromEmail.value : this.fromEmail,
      toList: data.toList.present ? data.toList.value : this.toList,
      ccList: data.ccList.present ? data.ccList.value : this.ccList,
      bccList: data.bccList.present ? data.bccList.value : this.bccList,
      date: data.date.present ? data.date.value : this.date,
      preview: data.preview.present ? data.preview.value : this.preview,
      bodyPlain: data.bodyPlain.present ? data.bodyPlain.value : this.bodyPlain,
      bodyHtml: data.bodyHtml.present ? data.bodyHtml.value : this.bodyHtml,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
      isStarred: data.isStarred.present ? data.isStarred.value : this.isStarred,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      isDraft: data.isDraft.present ? data.isDraft.value : this.isDraft,
      labels: data.labels.present ? data.labels.value : this.labels,
      threadId: data.threadId.present ? data.threadId.value : this.threadId,
      hasAttachments: data.hasAttachments.present
          ? data.hasAttachments.value
          : this.hasAttachments,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Email(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('remoteUid: $remoteUid, ')
          ..write('messageId: $messageId, ')
          ..write('mailbox: $mailbox, ')
          ..write('subject: $subject, ')
          ..write('fromName: $fromName, ')
          ..write('fromEmail: $fromEmail, ')
          ..write('toList: $toList, ')
          ..write('ccList: $ccList, ')
          ..write('bccList: $bccList, ')
          ..write('date: $date, ')
          ..write('preview: $preview, ')
          ..write('bodyPlain: $bodyPlain, ')
          ..write('bodyHtml: $bodyHtml, ')
          ..write('isRead: $isRead, ')
          ..write('isStarred: $isStarred, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('isDraft: $isDraft, ')
          ..write('labels: $labels, ')
          ..write('threadId: $threadId, ')
          ..write('hasAttachments: $hasAttachments, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    accountId,
    remoteUid,
    messageId,
    mailbox,
    subject,
    fromName,
    fromEmail,
    toList,
    ccList,
    bccList,
    date,
    preview,
    bodyPlain,
    bodyHtml,
    isRead,
    isStarred,
    isDeleted,
    isDraft,
    labels,
    threadId,
    hasAttachments,
    createdAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Email &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.remoteUid == this.remoteUid &&
          other.messageId == this.messageId &&
          other.mailbox == this.mailbox &&
          other.subject == this.subject &&
          other.fromName == this.fromName &&
          other.fromEmail == this.fromEmail &&
          other.toList == this.toList &&
          other.ccList == this.ccList &&
          other.bccList == this.bccList &&
          other.date == this.date &&
          other.preview == this.preview &&
          other.bodyPlain == this.bodyPlain &&
          other.bodyHtml == this.bodyHtml &&
          other.isRead == this.isRead &&
          other.isStarred == this.isStarred &&
          other.isDeleted == this.isDeleted &&
          other.isDraft == this.isDraft &&
          other.labels == this.labels &&
          other.threadId == this.threadId &&
          other.hasAttachments == this.hasAttachments &&
          other.createdAt == this.createdAt);
}

class EmailsCompanion extends UpdateCompanion<Email> {
  final Value<int> id;
  final Value<int> accountId;
  final Value<int?> remoteUid;
  final Value<String> messageId;
  final Value<String> mailbox;
  final Value<String> subject;
  final Value<String> fromName;
  final Value<String> fromEmail;
  final Value<String> toList;
  final Value<String> ccList;
  final Value<String> bccList;
  final Value<DateTime> date;
  final Value<String> preview;
  final Value<String> bodyPlain;
  final Value<String> bodyHtml;
  final Value<bool> isRead;
  final Value<bool> isStarred;
  final Value<bool> isDeleted;
  final Value<bool> isDraft;
  final Value<String> labels;
  final Value<String> threadId;
  final Value<bool> hasAttachments;
  final Value<DateTime> createdAt;
  const EmailsCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.remoteUid = const Value.absent(),
    this.messageId = const Value.absent(),
    this.mailbox = const Value.absent(),
    this.subject = const Value.absent(),
    this.fromName = const Value.absent(),
    this.fromEmail = const Value.absent(),
    this.toList = const Value.absent(),
    this.ccList = const Value.absent(),
    this.bccList = const Value.absent(),
    this.date = const Value.absent(),
    this.preview = const Value.absent(),
    this.bodyPlain = const Value.absent(),
    this.bodyHtml = const Value.absent(),
    this.isRead = const Value.absent(),
    this.isStarred = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.isDraft = const Value.absent(),
    this.labels = const Value.absent(),
    this.threadId = const Value.absent(),
    this.hasAttachments = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  EmailsCompanion.insert({
    this.id = const Value.absent(),
    required int accountId,
    this.remoteUid = const Value.absent(),
    required String messageId,
    required String mailbox,
    required String subject,
    required String fromName,
    required String fromEmail,
    required String toList,
    this.ccList = const Value.absent(),
    this.bccList = const Value.absent(),
    required DateTime date,
    this.preview = const Value.absent(),
    this.bodyPlain = const Value.absent(),
    this.bodyHtml = const Value.absent(),
    this.isRead = const Value.absent(),
    this.isStarred = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.isDraft = const Value.absent(),
    this.labels = const Value.absent(),
    this.threadId = const Value.absent(),
    this.hasAttachments = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : accountId = Value(accountId),
       messageId = Value(messageId),
       mailbox = Value(mailbox),
       subject = Value(subject),
       fromName = Value(fromName),
       fromEmail = Value(fromEmail),
       toList = Value(toList),
       date = Value(date);
  static Insertable<Email> custom({
    Expression<int>? id,
    Expression<int>? accountId,
    Expression<int>? remoteUid,
    Expression<String>? messageId,
    Expression<String>? mailbox,
    Expression<String>? subject,
    Expression<String>? fromName,
    Expression<String>? fromEmail,
    Expression<String>? toList,
    Expression<String>? ccList,
    Expression<String>? bccList,
    Expression<DateTime>? date,
    Expression<String>? preview,
    Expression<String>? bodyPlain,
    Expression<String>? bodyHtml,
    Expression<bool>? isRead,
    Expression<bool>? isStarred,
    Expression<bool>? isDeleted,
    Expression<bool>? isDraft,
    Expression<String>? labels,
    Expression<String>? threadId,
    Expression<bool>? hasAttachments,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (remoteUid != null) 'remote_uid': remoteUid,
      if (messageId != null) 'message_id': messageId,
      if (mailbox != null) 'mailbox': mailbox,
      if (subject != null) 'subject': subject,
      if (fromName != null) 'from_name': fromName,
      if (fromEmail != null) 'from_email': fromEmail,
      if (toList != null) 'to_list': toList,
      if (ccList != null) 'cc_list': ccList,
      if (bccList != null) 'bcc_list': bccList,
      if (date != null) 'date': date,
      if (preview != null) 'preview': preview,
      if (bodyPlain != null) 'body_plain': bodyPlain,
      if (bodyHtml != null) 'body_html': bodyHtml,
      if (isRead != null) 'is_read': isRead,
      if (isStarred != null) 'is_starred': isStarred,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (isDraft != null) 'is_draft': isDraft,
      if (labels != null) 'labels': labels,
      if (threadId != null) 'thread_id': threadId,
      if (hasAttachments != null) 'has_attachments': hasAttachments,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  EmailsCompanion copyWith({
    Value<int>? id,
    Value<int>? accountId,
    Value<int?>? remoteUid,
    Value<String>? messageId,
    Value<String>? mailbox,
    Value<String>? subject,
    Value<String>? fromName,
    Value<String>? fromEmail,
    Value<String>? toList,
    Value<String>? ccList,
    Value<String>? bccList,
    Value<DateTime>? date,
    Value<String>? preview,
    Value<String>? bodyPlain,
    Value<String>? bodyHtml,
    Value<bool>? isRead,
    Value<bool>? isStarred,
    Value<bool>? isDeleted,
    Value<bool>? isDraft,
    Value<String>? labels,
    Value<String>? threadId,
    Value<bool>? hasAttachments,
    Value<DateTime>? createdAt,
  }) {
    return EmailsCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      remoteUid: remoteUid ?? this.remoteUid,
      messageId: messageId ?? this.messageId,
      mailbox: mailbox ?? this.mailbox,
      subject: subject ?? this.subject,
      fromName: fromName ?? this.fromName,
      fromEmail: fromEmail ?? this.fromEmail,
      toList: toList ?? this.toList,
      ccList: ccList ?? this.ccList,
      bccList: bccList ?? this.bccList,
      date: date ?? this.date,
      preview: preview ?? this.preview,
      bodyPlain: bodyPlain ?? this.bodyPlain,
      bodyHtml: bodyHtml ?? this.bodyHtml,
      isRead: isRead ?? this.isRead,
      isStarred: isStarred ?? this.isStarred,
      isDeleted: isDeleted ?? this.isDeleted,
      isDraft: isDraft ?? this.isDraft,
      labels: labels ?? this.labels,
      threadId: threadId ?? this.threadId,
      hasAttachments: hasAttachments ?? this.hasAttachments,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (remoteUid.present) {
      map['remote_uid'] = Variable<int>(remoteUid.value);
    }
    if (messageId.present) {
      map['message_id'] = Variable<String>(messageId.value);
    }
    if (mailbox.present) {
      map['mailbox'] = Variable<String>(mailbox.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (fromName.present) {
      map['from_name'] = Variable<String>(fromName.value);
    }
    if (fromEmail.present) {
      map['from_email'] = Variable<String>(fromEmail.value);
    }
    if (toList.present) {
      map['to_list'] = Variable<String>(toList.value);
    }
    if (ccList.present) {
      map['cc_list'] = Variable<String>(ccList.value);
    }
    if (bccList.present) {
      map['bcc_list'] = Variable<String>(bccList.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (preview.present) {
      map['preview'] = Variable<String>(preview.value);
    }
    if (bodyPlain.present) {
      map['body_plain'] = Variable<String>(bodyPlain.value);
    }
    if (bodyHtml.present) {
      map['body_html'] = Variable<String>(bodyHtml.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (isStarred.present) {
      map['is_starred'] = Variable<bool>(isStarred.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (isDraft.present) {
      map['is_draft'] = Variable<bool>(isDraft.value);
    }
    if (labels.present) {
      map['labels'] = Variable<String>(labels.value);
    }
    if (threadId.present) {
      map['thread_id'] = Variable<String>(threadId.value);
    }
    if (hasAttachments.present) {
      map['has_attachments'] = Variable<bool>(hasAttachments.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmailsCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('remoteUid: $remoteUid, ')
          ..write('messageId: $messageId, ')
          ..write('mailbox: $mailbox, ')
          ..write('subject: $subject, ')
          ..write('fromName: $fromName, ')
          ..write('fromEmail: $fromEmail, ')
          ..write('toList: $toList, ')
          ..write('ccList: $ccList, ')
          ..write('bccList: $bccList, ')
          ..write('date: $date, ')
          ..write('preview: $preview, ')
          ..write('bodyPlain: $bodyPlain, ')
          ..write('bodyHtml: $bodyHtml, ')
          ..write('isRead: $isRead, ')
          ..write('isStarred: $isStarred, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('isDraft: $isDraft, ')
          ..write('labels: $labels, ')
          ..write('threadId: $threadId, ')
          ..write('hasAttachments: $hasAttachments, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AttachmentsTable extends Attachments
    with TableInfo<$AttachmentsTable, Attachment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttachmentsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _emailIdMeta = const VerificationMeta(
    'emailId',
  );
  @override
  late final GeneratedColumn<int> emailId = GeneratedColumn<int>(
    'email_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filenameMeta = const VerificationMeta(
    'filename',
  );
  @override
  late final GeneratedColumn<String> filename = GeneratedColumn<String>(
    'filename',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mimeTypeMeta = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<int> size = GeneratedColumn<int>(
    'size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localPathMeta = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteFetchIdMeta = const VerificationMeta(
    'remoteFetchId',
  );
  @override
  late final GeneratedColumn<String> remoteFetchId = GeneratedColumn<String>(
    'remote_fetch_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    emailId,
    filename,
    mimeType,
    size,
    localPath,
    remoteFetchId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Attachment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email_id')) {
      context.handle(
        _emailIdMeta,
        emailId.isAcceptableOrUnknown(data['email_id']!, _emailIdMeta),
      );
    } else if (isInserting) {
      context.missing(_emailIdMeta);
    }
    if (data.containsKey('filename')) {
      context.handle(
        _filenameMeta,
        filename.isAcceptableOrUnknown(data['filename']!, _filenameMeta),
      );
    } else if (isInserting) {
      context.missing(_filenameMeta);
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _mimeTypeMeta,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_mimeTypeMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
        _sizeMeta,
        size.isAcceptableOrUnknown(data['size']!, _sizeMeta),
      );
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    if (data.containsKey('remote_fetch_id')) {
      context.handle(
        _remoteFetchIdMeta,
        remoteFetchId.isAcceptableOrUnknown(
          data['remote_fetch_id']!,
          _remoteFetchIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Attachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Attachment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      emailId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}email_id'],
      )!,
      filename: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}filename'],
      )!,
      mimeType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mime_type'],
      )!,
      size: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}size'],
      )!,
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      )!,
      remoteFetchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_fetch_id'],
      ),
    );
  }

  @override
  $AttachmentsTable createAlias(String alias) {
    return $AttachmentsTable(attachedDatabase, alias);
  }
}

class Attachment extends DataClass implements Insertable<Attachment> {
  final int id;
  final int emailId;
  final String filename;
  final String mimeType;
  final int size;
  final String localPath;
  final String? remoteFetchId;
  const Attachment({
    required this.id,
    required this.emailId,
    required this.filename,
    required this.mimeType,
    required this.size,
    required this.localPath,
    this.remoteFetchId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email_id'] = Variable<int>(emailId);
    map['filename'] = Variable<String>(filename);
    map['mime_type'] = Variable<String>(mimeType);
    map['size'] = Variable<int>(size);
    map['local_path'] = Variable<String>(localPath);
    if (!nullToAbsent || remoteFetchId != null) {
      map['remote_fetch_id'] = Variable<String>(remoteFetchId);
    }
    return map;
  }

  AttachmentsCompanion toCompanion(bool nullToAbsent) {
    return AttachmentsCompanion(
      id: Value(id),
      emailId: Value(emailId),
      filename: Value(filename),
      mimeType: Value(mimeType),
      size: Value(size),
      localPath: Value(localPath),
      remoteFetchId: remoteFetchId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteFetchId),
    );
  }

  factory Attachment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Attachment(
      id: serializer.fromJson<int>(json['id']),
      emailId: serializer.fromJson<int>(json['emailId']),
      filename: serializer.fromJson<String>(json['filename']),
      mimeType: serializer.fromJson<String>(json['mimeType']),
      size: serializer.fromJson<int>(json['size']),
      localPath: serializer.fromJson<String>(json['localPath']),
      remoteFetchId: serializer.fromJson<String?>(json['remoteFetchId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'emailId': serializer.toJson<int>(emailId),
      'filename': serializer.toJson<String>(filename),
      'mimeType': serializer.toJson<String>(mimeType),
      'size': serializer.toJson<int>(size),
      'localPath': serializer.toJson<String>(localPath),
      'remoteFetchId': serializer.toJson<String?>(remoteFetchId),
    };
  }

  Attachment copyWith({
    int? id,
    int? emailId,
    String? filename,
    String? mimeType,
    int? size,
    String? localPath,
    Value<String?> remoteFetchId = const Value.absent(),
  }) => Attachment(
    id: id ?? this.id,
    emailId: emailId ?? this.emailId,
    filename: filename ?? this.filename,
    mimeType: mimeType ?? this.mimeType,
    size: size ?? this.size,
    localPath: localPath ?? this.localPath,
    remoteFetchId: remoteFetchId.present
        ? remoteFetchId.value
        : this.remoteFetchId,
  );
  Attachment copyWithCompanion(AttachmentsCompanion data) {
    return Attachment(
      id: data.id.present ? data.id.value : this.id,
      emailId: data.emailId.present ? data.emailId.value : this.emailId,
      filename: data.filename.present ? data.filename.value : this.filename,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      size: data.size.present ? data.size.value : this.size,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      remoteFetchId: data.remoteFetchId.present
          ? data.remoteFetchId.value
          : this.remoteFetchId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Attachment(')
          ..write('id: $id, ')
          ..write('emailId: $emailId, ')
          ..write('filename: $filename, ')
          ..write('mimeType: $mimeType, ')
          ..write('size: $size, ')
          ..write('localPath: $localPath, ')
          ..write('remoteFetchId: $remoteFetchId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    emailId,
    filename,
    mimeType,
    size,
    localPath,
    remoteFetchId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Attachment &&
          other.id == this.id &&
          other.emailId == this.emailId &&
          other.filename == this.filename &&
          other.mimeType == this.mimeType &&
          other.size == this.size &&
          other.localPath == this.localPath &&
          other.remoteFetchId == this.remoteFetchId);
}

class AttachmentsCompanion extends UpdateCompanion<Attachment> {
  final Value<int> id;
  final Value<int> emailId;
  final Value<String> filename;
  final Value<String> mimeType;
  final Value<int> size;
  final Value<String> localPath;
  final Value<String?> remoteFetchId;
  const AttachmentsCompanion({
    this.id = const Value.absent(),
    this.emailId = const Value.absent(),
    this.filename = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.size = const Value.absent(),
    this.localPath = const Value.absent(),
    this.remoteFetchId = const Value.absent(),
  });
  AttachmentsCompanion.insert({
    this.id = const Value.absent(),
    required int emailId,
    required String filename,
    required String mimeType,
    required int size,
    required String localPath,
    this.remoteFetchId = const Value.absent(),
  }) : emailId = Value(emailId),
       filename = Value(filename),
       mimeType = Value(mimeType),
       size = Value(size),
       localPath = Value(localPath);
  static Insertable<Attachment> custom({
    Expression<int>? id,
    Expression<int>? emailId,
    Expression<String>? filename,
    Expression<String>? mimeType,
    Expression<int>? size,
    Expression<String>? localPath,
    Expression<String>? remoteFetchId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (emailId != null) 'email_id': emailId,
      if (filename != null) 'filename': filename,
      if (mimeType != null) 'mime_type': mimeType,
      if (size != null) 'size': size,
      if (localPath != null) 'local_path': localPath,
      if (remoteFetchId != null) 'remote_fetch_id': remoteFetchId,
    });
  }

  AttachmentsCompanion copyWith({
    Value<int>? id,
    Value<int>? emailId,
    Value<String>? filename,
    Value<String>? mimeType,
    Value<int>? size,
    Value<String>? localPath,
    Value<String?>? remoteFetchId,
  }) {
    return AttachmentsCompanion(
      id: id ?? this.id,
      emailId: emailId ?? this.emailId,
      filename: filename ?? this.filename,
      mimeType: mimeType ?? this.mimeType,
      size: size ?? this.size,
      localPath: localPath ?? this.localPath,
      remoteFetchId: remoteFetchId ?? this.remoteFetchId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (emailId.present) {
      map['email_id'] = Variable<int>(emailId.value);
    }
    if (filename.present) {
      map['filename'] = Variable<String>(filename.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (remoteFetchId.present) {
      map['remote_fetch_id'] = Variable<String>(remoteFetchId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('emailId: $emailId, ')
          ..write('filename: $filename, ')
          ..write('mimeType: $mimeType, ')
          ..write('size: $size, ')
          ..write('localPath: $localPath, ')
          ..write('remoteFetchId: $remoteFetchId')
          ..write(')'))
        .toString();
  }
}

class $MailboxesTable extends Mailboxes
    with TableInfo<$MailboxesTable, Mailboxe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MailboxesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unreadCountMeta = const VerificationMeta(
    'unreadCount',
  );
  @override
  late final GeneratedColumn<int> unreadCount = GeneratedColumn<int>(
    'unread_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    name,
    path,
    type,
    unreadCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mailboxes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Mailboxe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('unread_count')) {
      context.handle(
        _unreadCountMeta,
        unreadCount.isAcceptableOrUnknown(
          data['unread_count']!,
          _unreadCountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Mailboxe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Mailboxe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      unreadCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unread_count'],
      )!,
    );
  }

  @override
  $MailboxesTable createAlias(String alias) {
    return $MailboxesTable(attachedDatabase, alias);
  }
}

class Mailboxe extends DataClass implements Insertable<Mailboxe> {
  final int id;
  final int accountId;
  final String name;
  final String path;
  final String type;
  final int unreadCount;
  const Mailboxe({
    required this.id,
    required this.accountId,
    required this.name,
    required this.path,
    required this.type,
    required this.unreadCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_id'] = Variable<int>(accountId);
    map['name'] = Variable<String>(name);
    map['path'] = Variable<String>(path);
    map['type'] = Variable<String>(type);
    map['unread_count'] = Variable<int>(unreadCount);
    return map;
  }

  MailboxesCompanion toCompanion(bool nullToAbsent) {
    return MailboxesCompanion(
      id: Value(id),
      accountId: Value(accountId),
      name: Value(name),
      path: Value(path),
      type: Value(type),
      unreadCount: Value(unreadCount),
    );
  }

  factory Mailboxe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Mailboxe(
      id: serializer.fromJson<int>(json['id']),
      accountId: serializer.fromJson<int>(json['accountId']),
      name: serializer.fromJson<String>(json['name']),
      path: serializer.fromJson<String>(json['path']),
      type: serializer.fromJson<String>(json['type']),
      unreadCount: serializer.fromJson<int>(json['unreadCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountId': serializer.toJson<int>(accountId),
      'name': serializer.toJson<String>(name),
      'path': serializer.toJson<String>(path),
      'type': serializer.toJson<String>(type),
      'unreadCount': serializer.toJson<int>(unreadCount),
    };
  }

  Mailboxe copyWith({
    int? id,
    int? accountId,
    String? name,
    String? path,
    String? type,
    int? unreadCount,
  }) => Mailboxe(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    name: name ?? this.name,
    path: path ?? this.path,
    type: type ?? this.type,
    unreadCount: unreadCount ?? this.unreadCount,
  );
  Mailboxe copyWithCompanion(MailboxesCompanion data) {
    return Mailboxe(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      name: data.name.present ? data.name.value : this.name,
      path: data.path.present ? data.path.value : this.path,
      type: data.type.present ? data.type.value : this.type,
      unreadCount: data.unreadCount.present
          ? data.unreadCount.value
          : this.unreadCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Mailboxe(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('name: $name, ')
          ..write('path: $path, ')
          ..write('type: $type, ')
          ..write('unreadCount: $unreadCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, accountId, name, path, type, unreadCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Mailboxe &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.name == this.name &&
          other.path == this.path &&
          other.type == this.type &&
          other.unreadCount == this.unreadCount);
}

class MailboxesCompanion extends UpdateCompanion<Mailboxe> {
  final Value<int> id;
  final Value<int> accountId;
  final Value<String> name;
  final Value<String> path;
  final Value<String> type;
  final Value<int> unreadCount;
  const MailboxesCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.name = const Value.absent(),
    this.path = const Value.absent(),
    this.type = const Value.absent(),
    this.unreadCount = const Value.absent(),
  });
  MailboxesCompanion.insert({
    this.id = const Value.absent(),
    required int accountId,
    required String name,
    required String path,
    required String type,
    this.unreadCount = const Value.absent(),
  }) : accountId = Value(accountId),
       name = Value(name),
       path = Value(path),
       type = Value(type);
  static Insertable<Mailboxe> custom({
    Expression<int>? id,
    Expression<int>? accountId,
    Expression<String>? name,
    Expression<String>? path,
    Expression<String>? type,
    Expression<int>? unreadCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (name != null) 'name': name,
      if (path != null) 'path': path,
      if (type != null) 'type': type,
      if (unreadCount != null) 'unread_count': unreadCount,
    });
  }

  MailboxesCompanion copyWith({
    Value<int>? id,
    Value<int>? accountId,
    Value<String>? name,
    Value<String>? path,
    Value<String>? type,
    Value<int>? unreadCount,
  }) {
    return MailboxesCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      name: name ?? this.name,
      path: path ?? this.path,
      type: type ?? this.type,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (unreadCount.present) {
      map['unread_count'] = Variable<int>(unreadCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MailboxesCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('name: $name, ')
          ..write('path: $path, ')
          ..write('type: $type, ')
          ..write('unreadCount: $unreadCount')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $EmailsTable emails = $EmailsTable(this);
  late final $AttachmentsTable attachments = $AttachmentsTable(this);
  late final $MailboxesTable mailboxes = $MailboxesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    accounts,
    emails,
    attachments,
    mailboxes,
  ];
}

typedef $$AccountsTableCreateCompanionBuilder =
    AccountsCompanion Function({
      Value<int> id,
      required String email,
      required String displayName,
      required String imapHost,
      required int imapPort,
      Value<bool> imapSsl,
      required String smtpHost,
      required int smtpPort,
      Value<bool> smtpSsl,
      required String passwordKey,
      required int color,
      Value<String> signature,
      Value<DateTime> createdAt,
    });
typedef $$AccountsTableUpdateCompanionBuilder =
    AccountsCompanion Function({
      Value<int> id,
      Value<String> email,
      Value<String> displayName,
      Value<String> imapHost,
      Value<int> imapPort,
      Value<bool> imapSsl,
      Value<String> smtpHost,
      Value<int> smtpPort,
      Value<bool> smtpSsl,
      Value<String> passwordKey,
      Value<int> color,
      Value<String> signature,
      Value<DateTime> createdAt,
    });

class $$AccountsTableFilterComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableFilterComposer({
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

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imapHost => $composableBuilder(
    column: $table.imapHost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get imapPort => $composableBuilder(
    column: $table.imapPort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get imapSsl => $composableBuilder(
    column: $table.imapSsl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get smtpHost => $composableBuilder(
    column: $table.smtpHost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get smtpPort => $composableBuilder(
    column: $table.smtpPort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get smtpSsl => $composableBuilder(
    column: $table.smtpSsl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passwordKey => $composableBuilder(
    column: $table.passwordKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get signature => $composableBuilder(
    column: $table.signature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableOrderingComposer({
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

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imapHost => $composableBuilder(
    column: $table.imapHost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get imapPort => $composableBuilder(
    column: $table.imapPort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get imapSsl => $composableBuilder(
    column: $table.imapSsl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get smtpHost => $composableBuilder(
    column: $table.smtpHost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get smtpPort => $composableBuilder(
    column: $table.smtpPort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get smtpSsl => $composableBuilder(
    column: $table.smtpSsl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passwordKey => $composableBuilder(
    column: $table.passwordKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get signature => $composableBuilder(
    column: $table.signature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imapHost =>
      $composableBuilder(column: $table.imapHost, builder: (column) => column);

  GeneratedColumn<int> get imapPort =>
      $composableBuilder(column: $table.imapPort, builder: (column) => column);

  GeneratedColumn<bool> get imapSsl =>
      $composableBuilder(column: $table.imapSsl, builder: (column) => column);

  GeneratedColumn<String> get smtpHost =>
      $composableBuilder(column: $table.smtpHost, builder: (column) => column);

  GeneratedColumn<int> get smtpPort =>
      $composableBuilder(column: $table.smtpPort, builder: (column) => column);

  GeneratedColumn<bool> get smtpSsl =>
      $composableBuilder(column: $table.smtpSsl, builder: (column) => column);

  GeneratedColumn<String> get passwordKey => $composableBuilder(
    column: $table.passwordKey,
    builder: (column) => column,
  );

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get signature =>
      $composableBuilder(column: $table.signature, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AccountsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountsTable,
          Account,
          $$AccountsTableFilterComposer,
          $$AccountsTableOrderingComposer,
          $$AccountsTableAnnotationComposer,
          $$AccountsTableCreateCompanionBuilder,
          $$AccountsTableUpdateCompanionBuilder,
          (Account, BaseReferences<_$AppDatabase, $AccountsTable, Account>),
          Account,
          PrefetchHooks Function()
        > {
  $$AccountsTableTableManager(_$AppDatabase db, $AccountsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String> imapHost = const Value.absent(),
                Value<int> imapPort = const Value.absent(),
                Value<bool> imapSsl = const Value.absent(),
                Value<String> smtpHost = const Value.absent(),
                Value<int> smtpPort = const Value.absent(),
                Value<bool> smtpSsl = const Value.absent(),
                Value<String> passwordKey = const Value.absent(),
                Value<int> color = const Value.absent(),
                Value<String> signature = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AccountsCompanion(
                id: id,
                email: email,
                displayName: displayName,
                imapHost: imapHost,
                imapPort: imapPort,
                imapSsl: imapSsl,
                smtpHost: smtpHost,
                smtpPort: smtpPort,
                smtpSsl: smtpSsl,
                passwordKey: passwordKey,
                color: color,
                signature: signature,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String email,
                required String displayName,
                required String imapHost,
                required int imapPort,
                Value<bool> imapSsl = const Value.absent(),
                required String smtpHost,
                required int smtpPort,
                Value<bool> smtpSsl = const Value.absent(),
                required String passwordKey,
                required int color,
                Value<String> signature = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AccountsCompanion.insert(
                id: id,
                email: email,
                displayName: displayName,
                imapHost: imapHost,
                imapPort: imapPort,
                imapSsl: imapSsl,
                smtpHost: smtpHost,
                smtpPort: smtpPort,
                smtpSsl: smtpSsl,
                passwordKey: passwordKey,
                color: color,
                signature: signature,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AccountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountsTable,
      Account,
      $$AccountsTableFilterComposer,
      $$AccountsTableOrderingComposer,
      $$AccountsTableAnnotationComposer,
      $$AccountsTableCreateCompanionBuilder,
      $$AccountsTableUpdateCompanionBuilder,
      (Account, BaseReferences<_$AppDatabase, $AccountsTable, Account>),
      Account,
      PrefetchHooks Function()
    >;
typedef $$EmailsTableCreateCompanionBuilder =
    EmailsCompanion Function({
      Value<int> id,
      required int accountId,
      Value<int?> remoteUid,
      required String messageId,
      required String mailbox,
      required String subject,
      required String fromName,
      required String fromEmail,
      required String toList,
      Value<String> ccList,
      Value<String> bccList,
      required DateTime date,
      Value<String> preview,
      Value<String> bodyPlain,
      Value<String> bodyHtml,
      Value<bool> isRead,
      Value<bool> isStarred,
      Value<bool> isDeleted,
      Value<bool> isDraft,
      Value<String> labels,
      Value<String> threadId,
      Value<bool> hasAttachments,
      Value<DateTime> createdAt,
    });
typedef $$EmailsTableUpdateCompanionBuilder =
    EmailsCompanion Function({
      Value<int> id,
      Value<int> accountId,
      Value<int?> remoteUid,
      Value<String> messageId,
      Value<String> mailbox,
      Value<String> subject,
      Value<String> fromName,
      Value<String> fromEmail,
      Value<String> toList,
      Value<String> ccList,
      Value<String> bccList,
      Value<DateTime> date,
      Value<String> preview,
      Value<String> bodyPlain,
      Value<String> bodyHtml,
      Value<bool> isRead,
      Value<bool> isStarred,
      Value<bool> isDeleted,
      Value<bool> isDraft,
      Value<String> labels,
      Value<String> threadId,
      Value<bool> hasAttachments,
      Value<DateTime> createdAt,
    });

class $$EmailsTableFilterComposer
    extends Composer<_$AppDatabase, $EmailsTable> {
  $$EmailsTableFilterComposer({
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

  ColumnFilters<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteUid => $composableBuilder(
    column: $table.remoteUid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get messageId => $composableBuilder(
    column: $table.messageId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mailbox => $composableBuilder(
    column: $table.mailbox,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subject => $composableBuilder(
    column: $table.subject,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fromName => $composableBuilder(
    column: $table.fromName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fromEmail => $composableBuilder(
    column: $table.fromEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toList => $composableBuilder(
    column: $table.toList,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ccList => $composableBuilder(
    column: $table.ccList,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bccList => $composableBuilder(
    column: $table.bccList,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get preview => $composableBuilder(
    column: $table.preview,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bodyPlain => $composableBuilder(
    column: $table.bodyPlain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bodyHtml => $composableBuilder(
    column: $table.bodyHtml,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isStarred => $composableBuilder(
    column: $table.isStarred,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDraft => $composableBuilder(
    column: $table.isDraft,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get labels => $composableBuilder(
    column: $table.labels,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get threadId => $composableBuilder(
    column: $table.threadId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasAttachments => $composableBuilder(
    column: $table.hasAttachments,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EmailsTableOrderingComposer
    extends Composer<_$AppDatabase, $EmailsTable> {
  $$EmailsTableOrderingComposer({
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

  ColumnOrderings<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteUid => $composableBuilder(
    column: $table.remoteUid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get messageId => $composableBuilder(
    column: $table.messageId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mailbox => $composableBuilder(
    column: $table.mailbox,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subject => $composableBuilder(
    column: $table.subject,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fromName => $composableBuilder(
    column: $table.fromName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fromEmail => $composableBuilder(
    column: $table.fromEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toList => $composableBuilder(
    column: $table.toList,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ccList => $composableBuilder(
    column: $table.ccList,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bccList => $composableBuilder(
    column: $table.bccList,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get preview => $composableBuilder(
    column: $table.preview,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bodyPlain => $composableBuilder(
    column: $table.bodyPlain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bodyHtml => $composableBuilder(
    column: $table.bodyHtml,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isStarred => $composableBuilder(
    column: $table.isStarred,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDraft => $composableBuilder(
    column: $table.isDraft,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get labels => $composableBuilder(
    column: $table.labels,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get threadId => $composableBuilder(
    column: $table.threadId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasAttachments => $composableBuilder(
    column: $table.hasAttachments,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EmailsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmailsTable> {
  $$EmailsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get remoteUid =>
      $composableBuilder(column: $table.remoteUid, builder: (column) => column);

  GeneratedColumn<String> get messageId =>
      $composableBuilder(column: $table.messageId, builder: (column) => column);

  GeneratedColumn<String> get mailbox =>
      $composableBuilder(column: $table.mailbox, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<String> get fromName =>
      $composableBuilder(column: $table.fromName, builder: (column) => column);

  GeneratedColumn<String> get fromEmail =>
      $composableBuilder(column: $table.fromEmail, builder: (column) => column);

  GeneratedColumn<String> get toList =>
      $composableBuilder(column: $table.toList, builder: (column) => column);

  GeneratedColumn<String> get ccList =>
      $composableBuilder(column: $table.ccList, builder: (column) => column);

  GeneratedColumn<String> get bccList =>
      $composableBuilder(column: $table.bccList, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get preview =>
      $composableBuilder(column: $table.preview, builder: (column) => column);

  GeneratedColumn<String> get bodyPlain =>
      $composableBuilder(column: $table.bodyPlain, builder: (column) => column);

  GeneratedColumn<String> get bodyHtml =>
      $composableBuilder(column: $table.bodyHtml, builder: (column) => column);

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);

  GeneratedColumn<bool> get isStarred =>
      $composableBuilder(column: $table.isStarred, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<bool> get isDraft =>
      $composableBuilder(column: $table.isDraft, builder: (column) => column);

  GeneratedColumn<String> get labels =>
      $composableBuilder(column: $table.labels, builder: (column) => column);

  GeneratedColumn<String> get threadId =>
      $composableBuilder(column: $table.threadId, builder: (column) => column);

  GeneratedColumn<bool> get hasAttachments => $composableBuilder(
    column: $table.hasAttachments,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$EmailsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EmailsTable,
          Email,
          $$EmailsTableFilterComposer,
          $$EmailsTableOrderingComposer,
          $$EmailsTableAnnotationComposer,
          $$EmailsTableCreateCompanionBuilder,
          $$EmailsTableUpdateCompanionBuilder,
          (Email, BaseReferences<_$AppDatabase, $EmailsTable, Email>),
          Email,
          PrefetchHooks Function()
        > {
  $$EmailsTableTableManager(_$AppDatabase db, $EmailsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmailsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmailsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmailsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<int?> remoteUid = const Value.absent(),
                Value<String> messageId = const Value.absent(),
                Value<String> mailbox = const Value.absent(),
                Value<String> subject = const Value.absent(),
                Value<String> fromName = const Value.absent(),
                Value<String> fromEmail = const Value.absent(),
                Value<String> toList = const Value.absent(),
                Value<String> ccList = const Value.absent(),
                Value<String> bccList = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> preview = const Value.absent(),
                Value<String> bodyPlain = const Value.absent(),
                Value<String> bodyHtml = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
                Value<bool> isStarred = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<bool> isDraft = const Value.absent(),
                Value<String> labels = const Value.absent(),
                Value<String> threadId = const Value.absent(),
                Value<bool> hasAttachments = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => EmailsCompanion(
                id: id,
                accountId: accountId,
                remoteUid: remoteUid,
                messageId: messageId,
                mailbox: mailbox,
                subject: subject,
                fromName: fromName,
                fromEmail: fromEmail,
                toList: toList,
                ccList: ccList,
                bccList: bccList,
                date: date,
                preview: preview,
                bodyPlain: bodyPlain,
                bodyHtml: bodyHtml,
                isRead: isRead,
                isStarred: isStarred,
                isDeleted: isDeleted,
                isDraft: isDraft,
                labels: labels,
                threadId: threadId,
                hasAttachments: hasAttachments,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int accountId,
                Value<int?> remoteUid = const Value.absent(),
                required String messageId,
                required String mailbox,
                required String subject,
                required String fromName,
                required String fromEmail,
                required String toList,
                Value<String> ccList = const Value.absent(),
                Value<String> bccList = const Value.absent(),
                required DateTime date,
                Value<String> preview = const Value.absent(),
                Value<String> bodyPlain = const Value.absent(),
                Value<String> bodyHtml = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
                Value<bool> isStarred = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<bool> isDraft = const Value.absent(),
                Value<String> labels = const Value.absent(),
                Value<String> threadId = const Value.absent(),
                Value<bool> hasAttachments = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => EmailsCompanion.insert(
                id: id,
                accountId: accountId,
                remoteUid: remoteUid,
                messageId: messageId,
                mailbox: mailbox,
                subject: subject,
                fromName: fromName,
                fromEmail: fromEmail,
                toList: toList,
                ccList: ccList,
                bccList: bccList,
                date: date,
                preview: preview,
                bodyPlain: bodyPlain,
                bodyHtml: bodyHtml,
                isRead: isRead,
                isStarred: isStarred,
                isDeleted: isDeleted,
                isDraft: isDraft,
                labels: labels,
                threadId: threadId,
                hasAttachments: hasAttachments,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EmailsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EmailsTable,
      Email,
      $$EmailsTableFilterComposer,
      $$EmailsTableOrderingComposer,
      $$EmailsTableAnnotationComposer,
      $$EmailsTableCreateCompanionBuilder,
      $$EmailsTableUpdateCompanionBuilder,
      (Email, BaseReferences<_$AppDatabase, $EmailsTable, Email>),
      Email,
      PrefetchHooks Function()
    >;
typedef $$AttachmentsTableCreateCompanionBuilder =
    AttachmentsCompanion Function({
      Value<int> id,
      required int emailId,
      required String filename,
      required String mimeType,
      required int size,
      required String localPath,
      Value<String?> remoteFetchId,
    });
typedef $$AttachmentsTableUpdateCompanionBuilder =
    AttachmentsCompanion Function({
      Value<int> id,
      Value<int> emailId,
      Value<String> filename,
      Value<String> mimeType,
      Value<int> size,
      Value<String> localPath,
      Value<String?> remoteFetchId,
    });

class $$AttachmentsTableFilterComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableFilterComposer({
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

  ColumnFilters<int> get emailId => $composableBuilder(
    column: $table.emailId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteFetchId => $composableBuilder(
    column: $table.remoteFetchId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AttachmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableOrderingComposer({
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

  ColumnOrderings<int> get emailId => $composableBuilder(
    column: $table.emailId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteFetchId => $composableBuilder(
    column: $table.remoteFetchId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AttachmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get emailId =>
      $composableBuilder(column: $table.emailId, builder: (column) => column);

  GeneratedColumn<String> get filename =>
      $composableBuilder(column: $table.filename, builder: (column) => column);

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<int> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get remoteFetchId => $composableBuilder(
    column: $table.remoteFetchId,
    builder: (column) => column,
  );
}

class $$AttachmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AttachmentsTable,
          Attachment,
          $$AttachmentsTableFilterComposer,
          $$AttachmentsTableOrderingComposer,
          $$AttachmentsTableAnnotationComposer,
          $$AttachmentsTableCreateCompanionBuilder,
          $$AttachmentsTableUpdateCompanionBuilder,
          (
            Attachment,
            BaseReferences<_$AppDatabase, $AttachmentsTable, Attachment>,
          ),
          Attachment,
          PrefetchHooks Function()
        > {
  $$AttachmentsTableTableManager(_$AppDatabase db, $AttachmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttachmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> emailId = const Value.absent(),
                Value<String> filename = const Value.absent(),
                Value<String> mimeType = const Value.absent(),
                Value<int> size = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<String?> remoteFetchId = const Value.absent(),
              }) => AttachmentsCompanion(
                id: id,
                emailId: emailId,
                filename: filename,
                mimeType: mimeType,
                size: size,
                localPath: localPath,
                remoteFetchId: remoteFetchId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int emailId,
                required String filename,
                required String mimeType,
                required int size,
                required String localPath,
                Value<String?> remoteFetchId = const Value.absent(),
              }) => AttachmentsCompanion.insert(
                id: id,
                emailId: emailId,
                filename: filename,
                mimeType: mimeType,
                size: size,
                localPath: localPath,
                remoteFetchId: remoteFetchId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AttachmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AttachmentsTable,
      Attachment,
      $$AttachmentsTableFilterComposer,
      $$AttachmentsTableOrderingComposer,
      $$AttachmentsTableAnnotationComposer,
      $$AttachmentsTableCreateCompanionBuilder,
      $$AttachmentsTableUpdateCompanionBuilder,
      (
        Attachment,
        BaseReferences<_$AppDatabase, $AttachmentsTable, Attachment>,
      ),
      Attachment,
      PrefetchHooks Function()
    >;
typedef $$MailboxesTableCreateCompanionBuilder =
    MailboxesCompanion Function({
      Value<int> id,
      required int accountId,
      required String name,
      required String path,
      required String type,
      Value<int> unreadCount,
    });
typedef $$MailboxesTableUpdateCompanionBuilder =
    MailboxesCompanion Function({
      Value<int> id,
      Value<int> accountId,
      Value<String> name,
      Value<String> path,
      Value<String> type,
      Value<int> unreadCount,
    });

class $$MailboxesTableFilterComposer
    extends Composer<_$AppDatabase, $MailboxesTable> {
  $$MailboxesTableFilterComposer({
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

  ColumnFilters<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unreadCount => $composableBuilder(
    column: $table.unreadCount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MailboxesTableOrderingComposer
    extends Composer<_$AppDatabase, $MailboxesTable> {
  $$MailboxesTableOrderingComposer({
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

  ColumnOrderings<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unreadCount => $composableBuilder(
    column: $table.unreadCount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MailboxesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MailboxesTable> {
  $$MailboxesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get unreadCount => $composableBuilder(
    column: $table.unreadCount,
    builder: (column) => column,
  );
}

class $$MailboxesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MailboxesTable,
          Mailboxe,
          $$MailboxesTableFilterComposer,
          $$MailboxesTableOrderingComposer,
          $$MailboxesTableAnnotationComposer,
          $$MailboxesTableCreateCompanionBuilder,
          $$MailboxesTableUpdateCompanionBuilder,
          (Mailboxe, BaseReferences<_$AppDatabase, $MailboxesTable, Mailboxe>),
          Mailboxe,
          PrefetchHooks Function()
        > {
  $$MailboxesTableTableManager(_$AppDatabase db, $MailboxesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MailboxesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MailboxesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MailboxesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> path = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> unreadCount = const Value.absent(),
              }) => MailboxesCompanion(
                id: id,
                accountId: accountId,
                name: name,
                path: path,
                type: type,
                unreadCount: unreadCount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int accountId,
                required String name,
                required String path,
                required String type,
                Value<int> unreadCount = const Value.absent(),
              }) => MailboxesCompanion.insert(
                id: id,
                accountId: accountId,
                name: name,
                path: path,
                type: type,
                unreadCount: unreadCount,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MailboxesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MailboxesTable,
      Mailboxe,
      $$MailboxesTableFilterComposer,
      $$MailboxesTableOrderingComposer,
      $$MailboxesTableAnnotationComposer,
      $$MailboxesTableCreateCompanionBuilder,
      $$MailboxesTableUpdateCompanionBuilder,
      (Mailboxe, BaseReferences<_$AppDatabase, $MailboxesTable, Mailboxe>),
      Mailboxe,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db, _db.accounts);
  $$EmailsTableTableManager get emails =>
      $$EmailsTableTableManager(_db, _db.emails);
  $$AttachmentsTableTableManager get attachments =>
      $$AttachmentsTableTableManager(_db, _db.attachments);
  $$MailboxesTableTableManager get mailboxes =>
      $$MailboxesTableTableManager(_db, _db.mailboxes);
}
