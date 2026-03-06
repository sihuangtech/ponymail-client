import 'package:freezed_annotation/freezed_annotation.dart';

part 'mailbox_model.freezed.dart';
part 'mailbox_model.g.dart';

@freezed
sealed class MailboxModel with _$MailboxModel {
  const factory MailboxModel({
    required int id,
    required int accountId,
    required String name,
    required String path,
    required String type,
    required int unreadCount,
  }) = _MailboxModel;

  factory MailboxModel.fromJson(Map<String, dynamic> json) =>
      _$MailboxModelFromJson(json);
}
