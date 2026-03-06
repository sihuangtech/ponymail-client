// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchResultModel _$SearchResultModelFromJson(Map<String, dynamic> json) =>
    _SearchResultModel(
      localResults: (json['localResults'] as List<dynamic>)
          .map((e) => EmailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      remoteResults: (json['remoteResults'] as List<dynamic>)
          .map((e) => EmailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResultModelToJson(_SearchResultModel instance) =>
    <String, dynamic>{
      'localResults': instance.localResults,
      'remoteResults': instance.remoteResults,
    };
