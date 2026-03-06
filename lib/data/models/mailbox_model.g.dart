// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mailbox_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MailboxModel _$MailboxModelFromJson(Map<String, dynamic> json) =>
    _MailboxModel(
      id: (json['id'] as num).toInt(),
      accountId: (json['accountId'] as num).toInt(),
      name: json['name'] as String,
      path: json['path'] as String,
      type: json['type'] as String,
      unreadCount: (json['unreadCount'] as num).toInt(),
    );

Map<String, dynamic> _$MailboxModelToJson(_MailboxModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'name': instance.name,
      'path': instance.path,
      'type': instance.type,
      'unreadCount': instance.unreadCount,
    };
