import 'package:freezed_annotation/freezed_annotation.dart';

import 'email_model.dart';

part 'search_result_model.freezed.dart';
part 'search_result_model.g.dart';

@freezed
sealed class SearchResultModel with _$SearchResultModel {
  const factory SearchResultModel({
    required List<EmailModel> localResults,
    required List<EmailModel> remoteResults,
  }) = _SearchResultModel;

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResultModelFromJson(json);
}
