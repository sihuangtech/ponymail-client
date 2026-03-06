import 'package:freezed_annotation/freezed_annotation.dart';

import 'email_model.dart';

part 'compose_request.freezed.dart';
part 'compose_request.g.dart';

@freezed
sealed class ComposeRequest with _$ComposeRequest {
  const factory ComposeRequest({
    required int accountId,
    required List<EmailAddressModel> to,
    required List<EmailAddressModel> cc,
    required List<EmailAddressModel> bcc,
    required String subject,
    required String bodyPlain,
    required String bodyHtml,
    required List<String> attachmentPaths,
    DateTime? scheduledAt,
    int? replyToEmailId,
  }) = _ComposeRequest;

  factory ComposeRequest.fromJson(Map<String, dynamic> json) =>
      _$ComposeRequestFromJson(json);
}
