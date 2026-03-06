// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountModel _$AccountModelFromJson(Map<String, dynamic> json) =>
    _AccountModel(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      imapHost: json['imapHost'] as String,
      imapPort: (json['imapPort'] as num).toInt(),
      imapSsl: json['imapSsl'] as bool,
      smtpHost: json['smtpHost'] as String,
      smtpPort: (json['smtpPort'] as num).toInt(),
      smtpSsl: json['smtpSsl'] as bool,
      passwordKey: json['passwordKey'] as String,
      color: (json['color'] as num).toInt(),
      signature: json['signature'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AccountModelToJson(_AccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'imapHost': instance.imapHost,
      'imapPort': instance.imapPort,
      'imapSsl': instance.imapSsl,
      'smtpHost': instance.smtpHost,
      'smtpPort': instance.smtpPort,
      'smtpSsl': instance.smtpSsl,
      'passwordKey': instance.passwordKey,
      'color': instance.color,
      'signature': instance.signature,
      'createdAt': instance.createdAt.toIso8601String(),
    };
