// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmailAddressModel _$EmailAddressModelFromJson(Map<String, dynamic> json) =>
    _EmailAddressModel(
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$EmailAddressModelToJson(_EmailAddressModel instance) =>
    <String, dynamic>{'name': instance.name, 'email': instance.email};

_EmailModel _$EmailModelFromJson(Map<String, dynamic> json) => _EmailModel(
  id: (json['id'] as num).toInt(),
  accountId: (json['accountId'] as num).toInt(),
  messageId: json['messageId'] as String,
  mailbox: json['mailbox'] as String,
  subject: json['subject'] as String,
  fromName: json['fromName'] as String,
  fromEmail: json['fromEmail'] as String,
  to: (json['to'] as List<dynamic>)
      .map((e) => EmailAddressModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  cc: (json['cc'] as List<dynamic>)
      .map((e) => EmailAddressModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  date: DateTime.parse(json['date'] as String),
  preview: json['preview'] as String,
  bodyPlain: json['bodyPlain'] as String,
  bodyHtml: json['bodyHtml'] as String,
  isRead: json['isRead'] as bool,
  isStarred: json['isStarred'] as bool,
  isDeleted: json['isDeleted'] as bool,
  labels: (json['labels'] as List<dynamic>).map((e) => e as String).toList(),
  threadId: json['threadId'] as String,
  hasAttachments: json['hasAttachments'] as bool,
);

Map<String, dynamic> _$EmailModelToJson(_EmailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'messageId': instance.messageId,
      'mailbox': instance.mailbox,
      'subject': instance.subject,
      'fromName': instance.fromName,
      'fromEmail': instance.fromEmail,
      'to': instance.to,
      'cc': instance.cc,
      'date': instance.date.toIso8601String(),
      'preview': instance.preview,
      'bodyPlain': instance.bodyPlain,
      'bodyHtml': instance.bodyHtml,
      'isRead': instance.isRead,
      'isStarred': instance.isStarred,
      'isDeleted': instance.isDeleted,
      'labels': instance.labels,
      'threadId': instance.threadId,
      'hasAttachments': instance.hasAttachments,
    };
