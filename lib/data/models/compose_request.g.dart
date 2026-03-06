// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compose_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ComposeRequest _$ComposeRequestFromJson(Map<String, dynamic> json) =>
    _ComposeRequest(
      accountId: (json['accountId'] as num).toInt(),
      to: (json['to'] as List<dynamic>)
          .map((e) => EmailAddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cc: (json['cc'] as List<dynamic>)
          .map((e) => EmailAddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bcc: (json['bcc'] as List<dynamic>)
          .map((e) => EmailAddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      subject: json['subject'] as String,
      bodyPlain: json['bodyPlain'] as String,
      bodyHtml: json['bodyHtml'] as String,
      attachmentPaths: (json['attachmentPaths'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      scheduledAt: json['scheduledAt'] == null
          ? null
          : DateTime.parse(json['scheduledAt'] as String),
      replyToEmailId: (json['replyToEmailId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ComposeRequestToJson(_ComposeRequest instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'to': instance.to,
      'cc': instance.cc,
      'bcc': instance.bcc,
      'subject': instance.subject,
      'bodyPlain': instance.bodyPlain,
      'bodyHtml': instance.bodyHtml,
      'attachmentPaths': instance.attachmentPaths,
      'scheduledAt': instance.scheduledAt?.toIso8601String(),
      'replyToEmailId': instance.replyToEmailId,
    };
