// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchResultModel {

 List<EmailModel> get localResults; List<EmailModel> get remoteResults;
/// Create a copy of SearchResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultModelCopyWith<SearchResultModel> get copyWith => _$SearchResultModelCopyWithImpl<SearchResultModel>(this as SearchResultModel, _$identity);

  /// Serializes this SearchResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResultModel&&const DeepCollectionEquality().equals(other.localResults, localResults)&&const DeepCollectionEquality().equals(other.remoteResults, remoteResults));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(localResults),const DeepCollectionEquality().hash(remoteResults));

@override
String toString() {
  return 'SearchResultModel(localResults: $localResults, remoteResults: $remoteResults)';
}


}

/// @nodoc
abstract mixin class $SearchResultModelCopyWith<$Res>  {
  factory $SearchResultModelCopyWith(SearchResultModel value, $Res Function(SearchResultModel) _then) = _$SearchResultModelCopyWithImpl;
@useResult
$Res call({
 List<EmailModel> localResults, List<EmailModel> remoteResults
});




}
/// @nodoc
class _$SearchResultModelCopyWithImpl<$Res>
    implements $SearchResultModelCopyWith<$Res> {
  _$SearchResultModelCopyWithImpl(this._self, this._then);

  final SearchResultModel _self;
  final $Res Function(SearchResultModel) _then;

/// Create a copy of SearchResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localResults = null,Object? remoteResults = null,}) {
  return _then(_self.copyWith(
localResults: null == localResults ? _self.localResults : localResults // ignore: cast_nullable_to_non_nullable
as List<EmailModel>,remoteResults: null == remoteResults ? _self.remoteResults : remoteResults // ignore: cast_nullable_to_non_nullable
as List<EmailModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchResultModel].
extension SearchResultModelPatterns on SearchResultModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResultModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResultModel value)  $default,){
final _that = this;
switch (_that) {
case _SearchResultModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResultModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EmailModel> localResults,  List<EmailModel> remoteResults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResultModel() when $default != null:
return $default(_that.localResults,_that.remoteResults);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EmailModel> localResults,  List<EmailModel> remoteResults)  $default,) {final _that = this;
switch (_that) {
case _SearchResultModel():
return $default(_that.localResults,_that.remoteResults);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EmailModel> localResults,  List<EmailModel> remoteResults)?  $default,) {final _that = this;
switch (_that) {
case _SearchResultModel() when $default != null:
return $default(_that.localResults,_that.remoteResults);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchResultModel implements SearchResultModel {
  const _SearchResultModel({required final  List<EmailModel> localResults, required final  List<EmailModel> remoteResults}): _localResults = localResults,_remoteResults = remoteResults;
  factory _SearchResultModel.fromJson(Map<String, dynamic> json) => _$SearchResultModelFromJson(json);

 final  List<EmailModel> _localResults;
@override List<EmailModel> get localResults {
  if (_localResults is EqualUnmodifiableListView) return _localResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_localResults);
}

 final  List<EmailModel> _remoteResults;
@override List<EmailModel> get remoteResults {
  if (_remoteResults is EqualUnmodifiableListView) return _remoteResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_remoteResults);
}


/// Create a copy of SearchResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultModelCopyWith<_SearchResultModel> get copyWith => __$SearchResultModelCopyWithImpl<_SearchResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResultModel&&const DeepCollectionEquality().equals(other._localResults, _localResults)&&const DeepCollectionEquality().equals(other._remoteResults, _remoteResults));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_localResults),const DeepCollectionEquality().hash(_remoteResults));

@override
String toString() {
  return 'SearchResultModel(localResults: $localResults, remoteResults: $remoteResults)';
}


}

/// @nodoc
abstract mixin class _$SearchResultModelCopyWith<$Res> implements $SearchResultModelCopyWith<$Res> {
  factory _$SearchResultModelCopyWith(_SearchResultModel value, $Res Function(_SearchResultModel) _then) = __$SearchResultModelCopyWithImpl;
@override @useResult
$Res call({
 List<EmailModel> localResults, List<EmailModel> remoteResults
});




}
/// @nodoc
class __$SearchResultModelCopyWithImpl<$Res>
    implements _$SearchResultModelCopyWith<$Res> {
  __$SearchResultModelCopyWithImpl(this._self, this._then);

  final _SearchResultModel _self;
  final $Res Function(_SearchResultModel) _then;

/// Create a copy of SearchResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localResults = null,Object? remoteResults = null,}) {
  return _then(_SearchResultModel(
localResults: null == localResults ? _self._localResults : localResults // ignore: cast_nullable_to_non_nullable
as List<EmailModel>,remoteResults: null == remoteResults ? _self._remoteResults : remoteResults // ignore: cast_nullable_to_non_nullable
as List<EmailModel>,
  ));
}


}

// dart format on
