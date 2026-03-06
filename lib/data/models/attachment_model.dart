import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment_model.freezed.dart';
part 'attachment_model.g.dart';

@freezed
sealed class AttachmentModel with _$AttachmentModel {
  const factory AttachmentModel({
    required int id,
    required int emailId,
    required String filename,
    required String mimeType,
    required int size,
    required String localPath,
  }) = _AttachmentModel;

  factory AttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$AttachmentModelFromJson(json);
}
