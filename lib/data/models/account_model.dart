import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class AccountModel with _$AccountModel {
  const factory AccountModel({
    required int id,
    required String email,
    required String displayName,
    required String imapHost,
    required int imapPort,
    required bool imapSsl,
    required String smtpHost,
    required int smtpPort,
    required bool smtpSsl,
    required String passwordKey,
    required int color,
    required String signature,
    required DateTime createdAt,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) => _$AccountModelFromJson(json);
}
