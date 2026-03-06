// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compose_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ComposeRequest {

 int get accountId; List<EmailAddressModel> get to; List<EmailAddressModel> get cc; List<EmailAddressModel> get bcc; String get subject; String get bodyPlain; String get bodyHtml; List<String> get attachmentPaths; DateTime? get scheduledAt; int? get replyToEmailId;
/// Create a copy of ComposeRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComposeRequestCopyWith<ComposeRequest> get copyWith => _$ComposeRequestCopyWithImpl<ComposeRequest>(this as ComposeRequest, _$identity);

  /// Serializes this ComposeRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComposeRequest&&(identical(other.accountId, accountId) || other.accountId == accountId)&&const DeepCollectionEquality().equals(other.to, to)&&const DeepCollectionEquality().equals(other.cc, cc)&&const DeepCollectionEquality().equals(other.bcc, bcc)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.bodyPlain, bodyPlain) || other.bodyPlain == bodyPlain)&&(identical(other.bodyHtml, bodyHtml) || other.bodyHtml == bodyHtml)&&const DeepCollectionEquality().equals(other.attachmentPaths, attachmentPaths)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.replyToEmailId, replyToEmailId) || other.replyToEmailId == replyToEmailId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,const DeepCollectionEquality().hash(to),const DeepCollectionEquality().hash(cc),const DeepCollectionEquality().hash(bcc),subject,bodyPlain,bodyHtml,const DeepCollectionEquality().hash(attachmentPaths),scheduledAt,replyToEmailId);

@override
String toString() {
  return 'ComposeRequest(accountId: $accountId, to: $to, cc: $cc, bcc: $bcc, subject: $subject, bodyPlain: $bodyPlain, bodyHtml: $bodyHtml, attachmentPaths: $attachmentPaths, scheduledAt: $scheduledAt, replyToEmailId: $replyToEmailId)';
}


}

/// @nodoc
abstract mixin class $ComposeRequestCopyWith<$Res>  {
  factory $ComposeRequestCopyWith(ComposeRequest value, $Res Function(ComposeRequest) _then) = _$ComposeRequestCopyWithImpl;
@useResult
$Res call({
 int accountId, List<EmailAddressModel> to, List<EmailAddressModel> cc, List<EmailAddressModel> bcc, String subject, String bodyPlain, String bodyHtml, List<String> attachmentPaths, DateTime? scheduledAt, int? replyToEmailId
});




}
/// @nodoc
class _$ComposeRequestCopyWithImpl<$Res>
    implements $ComposeRequestCopyWith<$Res> {
  _$ComposeRequestCopyWithImpl(this._self, this._then);

  final ComposeRequest _self;
  final $Res Function(ComposeRequest) _then;

/// Create a copy of ComposeRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? to = null,Object? cc = null,Object? bcc = null,Object? subject = null,Object? bodyPlain = null,Object? bodyHtml = null,Object? attachmentPaths = null,Object? scheduledAt = freezed,Object? replyToEmailId = freezed,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as List<EmailAddressModel>,cc: null == cc ? _self.cc : cc // ignore: cast_nullable_to_non_nullable
as List<EmailAddressModel>,bcc: null == bcc ? _self.bcc : bcc // ignore: cast_nullable_to_non_nullable
as List<EmailAddressModel>,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,bodyPlain: null == bodyPlain ? _self.bodyPlain : bodyPlain // ignore: cast_nullable_to_non_nullable
as String,bodyHtml: null == bodyHtml ? _self.bodyHtml : bodyHtml // ignore: cast_nullable_to_non_nullable
as String,attachmentPaths: null == attachmentPaths ? _self.attachmentPaths : attachmentPaths // ignore: cast_nullable_to_non_nullable
as List<String>,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,replyToEmailId: freezed == replyToEmailId ? _self.replyToEmailId : replyToEmailId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ComposeRequest].
extension ComposeRequestPatterns on ComposeRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComposeRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComposeRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComposeRequest value)  $default,){
final _that = this;
switch (_that) {
case _ComposeRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComposeRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ComposeRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int accountId,  List<EmailAddressModel> to,  List<EmailAddressModel> cc,  List<EmailAddressModel> bcc,  String subject,  String bodyPlain,  String bodyHtml,  List<String> attachmentPaths,  DateTime? scheduledAt,  int? replyToEmailId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComposeRequest() when $default != null:
return $default(_that.accountId,_that.to,_that.cc,_that.bcc,_that.subject,_that.bodyPlain,_that.bodyHtml,_that.attachmentPaths,_that.scheduledAt,_that.replyToEmailId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int accountId,  List<EmailAddressModel> to,  List<EmailAddressModel> cc,  List<EmailAddressModel> bcc,  String subject,  String bodyPlain,  String bodyHtml,  List<String> attachmentPaths,  DateTime? scheduledAt,  int? replyToEmailId)  $default,) {final _that = this;
switch (_that) {
case _ComposeRequest():
return $default(_that.accountId,_that.to,_that.cc,_that.bcc,_that.subject,_that.bodyPlain,_that.bodyHtml,_that.attachmentPaths,_that.scheduledAt,_that.replyToEmailId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int accountId,  List<EmailAddressModel> to,  List<EmailAddressModel> cc,  List<EmailAddressModel> bcc,  String subject,  String bodyPlain,  String bodyHtml,  List<String> attachmentPaths,  DateTime? scheduledAt,  int? replyToEmailId)?  $default,) {final _that = this;
switch (_that) {
case _ComposeRequest() when $default != null:
return $default(_that.accountId,_that.to,_that.cc,_that.bcc,_that.subject,_that.bodyPlain,_that.bodyHtml,_that.attachmentPaths,_that.scheduledAt,_that.replyToEmailId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ComposeRequest implements ComposeRequest {
  const _ComposeRequest({required this.accountId, required final  List<EmailAddressModel> to, required final  List<EmailAddressModel> cc, required final  List<EmailAddressModel> bcc, required this.subject, required this.bodyPlain, required this.bodyHtml, required final  List<String> attachmentPaths, this.scheduledAt, this.replyToEmailId}): _to = to,_cc = cc,_bcc = bcc,_attachmentPaths = attachmentPaths;
  factory _ComposeRequest.fromJson(Map<String, dynamic> json) => _$ComposeRequestFromJson(json);

@override final  int accountId;
 final  List<EmailAddressModel> _to;
@override List<EmailAddressModel> get to {
  if (_to is EqualUnmodifiableListView) return _to;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_to);
}

 final  List<EmailAddressModel> _cc;
@override List<EmailAddressModel> get cc {
  if (_cc is EqualUnmodifiableListView) return _cc;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cc);
}

 final  List<EmailAddressModel> _bcc;
@override List<EmailAddressModel> get bcc {
  if (_bcc is EqualUnmodifiableListView) return _bcc;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bcc);
}

@override final  String subject;
@override final  String bodyPlain;
@override final  String bodyHtml;
 final  List<String> _attachmentPaths;
@override List<String> get attachmentPaths {
  if (_attachmentPaths is EqualUnmodifiableListView) return _attachmentPaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachmentPaths);
}

@override final  DateTime? scheduledAt;
@override final  int? replyToEmailId;

/// Create a copy of ComposeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComposeRequestCopyWith<_ComposeRequest> get copyWith => __$ComposeRequestCopyWithImpl<_ComposeRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ComposeRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComposeRequest&&(identical(other.accountId, accountId) || other.accountId == accountId)&&const DeepCollectionEquality().equals(other._to, _to)&&const DeepCollectionEquality().equals(other._cc, _cc)&&const DeepCollectionEquality().equals(other._bcc, _bcc)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.bodyPlain, bodyPlain) || other.bodyPlain == bodyPlain)&&(identical(other.bodyHtml, bodyHtml) || other.bodyHtml == bodyHtml)&&const DeepCollectionEquality().equals(other._attachmentPaths, _attachmentPaths)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.replyToEmailId, replyToEmailId) || other.replyToEmailId == replyToEmailId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId,const DeepCollectionEquality().hash(_to),const DeepCollectionEquality().hash(_cc),const DeepCollectionEquality().hash(_bcc),subject,bodyPlain,bodyHtml,const DeepCollectionEquality().hash(_attachmentPaths),scheduledAt,replyToEmailId);

@override
String toString() {
  return 'ComposeRequest(accountId: $accountId, to: $to, cc: $cc, bcc: $bcc, subject: $subject, bodyPlain: $bodyPlain, bodyHtml: $bodyHtml, attachmentPaths: $attachmentPaths, scheduledAt: $scheduledAt, replyToEmailId: $replyToEmailId)';
}


}

/// @nodoc
abstract mixin class _$ComposeRequestCopyWith<$Res> implements $ComposeRequestCopyWith<$Res> {
  factory _$ComposeRequestCopyWith(_ComposeRequest value, $Res Function(_ComposeRequest) _then) = __$ComposeRequestCopyWithImpl;
@override @useResult
$Res call({
 int accountId, List<EmailAddressModel> to, List<EmailAddressModel> cc, List<EmailAddressModel> bcc, String subject, String bodyPlain, String bodyHtml, List<String> attachmentPaths, DateTime? scheduledAt, int? replyToEmailId
});




}
/// @nodoc
class __$ComposeRequestCopyWithImpl<$Res>
    implements _$ComposeRequestCopyWith<$Res> {
  __$ComposeRequestCopyWithImpl(this._self, this._then);

  final _ComposeRequest _self;
  final $Res Function(_ComposeRequest) _then;

/// Create a copy of ComposeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? to = null,Object? cc = null,Object? bcc = null,Object? subject = null,Object? bodyPlain = null,Object? bodyHtml = null,Object? attachmentPaths = null,Object? scheduledAt = freezed,Object? replyToEmailId = freezed,}) {
  return _then(_ComposeRequest(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,to: null == to ? _self._to : to // ignore: cast_nullable_to_non_nullable
as List<EmailAddressModel>,cc: null == cc ? _self._cc : cc // ignore: cast_nullable_to_non_nullable
as List<EmailAddressModel>,bcc: null == bcc ? _self._bcc : bcc // ignore: cast_nullable_to_non_nullable
as List<EmailAddressModel>,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,bodyPlain: null == bodyPlain ? _self.bodyPlain : bodyPlain // ignore: cast_nullable_to_non_nullable
as String,bodyHtml: null == bodyHtml ? _self.bodyHtml : bodyHtml // ignore: cast_nullable_to_non_nullable
as String,attachmentPaths: null == attachmentPaths ? _self._attachmentPaths : attachmentPaths // ignore: cast_nullable_to_non_nullable
as List<String>,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,replyToEmailId: freezed == replyToEmailId ? _self.replyToEmailId : replyToEmailId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
