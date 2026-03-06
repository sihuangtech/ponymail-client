// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttachmentModel _$AttachmentModelFromJson(Map<String, dynamic> json) =>
    _AttachmentModel(
      id: (json['id'] as num).toInt(),
      emailId: (json['emailId'] as num).toInt(),
      filename: json['filename'] as String,
      mimeType: json['mimeType'] as String,
      size: (json['size'] as num).toInt(),
      localPath: json['localPath'] as String,
    );

Map<String, dynamic> _$AttachmentModelToJson(_AttachmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'emailId': instance.emailId,
      'filename': instance.filename,
      'mimeType': instance.mimeType,
      'size': instance.size,
      'localPath': instance.localPath,
    };
