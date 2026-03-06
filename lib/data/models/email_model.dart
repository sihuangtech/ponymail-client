import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_model.freezed.dart';
part 'email_model.g.dart';

@freezed
sealed class EmailAddressModel with _$EmailAddressModel {
  const factory EmailAddressModel({
    required String name,
    required String email,
  }) = _EmailAddressModel;

  factory EmailAddressModel.fromJson(Map<String, dynamic> json) =>
      _$EmailAddressModelFromJson(json);
}

@freezed
sealed class EmailModel with _$EmailModel {
  const factory EmailModel({
    required int id,
    required int accountId,
    int? remoteUid,
    required String messageId,
    required String mailbox,
    required String subject,
    required String fromName,
    required String fromEmail,
    required List<EmailAddressModel> to,
    required List<EmailAddressModel> cc,
    required List<EmailAddressModel> bcc,
    required DateTime date,
    required String preview,
    required String bodyPlain,
    required String bodyHtml,
    required bool isRead,
    required bool isStarred,
    required bool isDeleted,
    required bool isDraft,
    required List<String> labels,
    required String threadId,
    required bool hasAttachments,
  }) = _EmailModel;

  factory EmailModel.fromJson(Map<String, dynamic> json) =>
      _$EmailModelFromJson(json);
}
