// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountModel {

 int get id; String get email; String get displayName; String get imapHost; int get imapPort; bool get imapSsl; String get smtpHost; int get smtpPort; bool get smtpSsl; String get passwordKey; int get color; String get signature; DateTime get createdAt;
/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountModelCopyWith<AccountModel> get copyWith => _$AccountModelCopyWithImpl<AccountModel>(this as AccountModel, _$identity);

  /// Serializes this AccountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.imapHost, imapHost) || other.imapHost == imapHost)&&(identical(other.imapPort, imapPort) || other.imapPort == imapPort)&&(identical(other.imapSsl, imapSsl) || other.imapSsl == imapSsl)&&(identical(other.smtpHost, smtpHost) || other.smtpHost == smtpHost)&&(identical(other.smtpPort, smtpPort) || other.smtpPort == smtpPort)&&(identical(other.smtpSsl, smtpSsl) || other.smtpSsl == smtpSsl)&&(identical(other.passwordKey, passwordKey) || other.passwordKey == passwordKey)&&(identical(other.color, color) || other.color == color)&&(identical(other.signature, signature) || other.signature == signature)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,displayName,imapHost,imapPort,imapSsl,smtpHost,smtpPort,smtpSsl,passwordKey,color,signature,createdAt);

@override
String toString() {
  return 'AccountModel(id: $id, email: $email, displayName: $displayName, imapHost: $imapHost, imapPort: $imapPort, imapSsl: $imapSsl, smtpHost: $smtpHost, smtpPort: $smtpPort, smtpSsl: $smtpSsl, passwordKey: $passwordKey, color: $color, signature: $signature, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AccountModelCopyWith<$Res>  {
  factory $AccountModelCopyWith(AccountModel value, $Res Function(AccountModel) _then) = _$AccountModelCopyWithImpl;
@useResult
$Res call({
 int id, String email, String displayName, String imapHost, int imapPort, bool imapSsl, String smtpHost, int smtpPort, bool smtpSsl, String passwordKey, int color, String signature, DateTime createdAt
});




}
/// @nodoc
class _$AccountModelCopyWithImpl<$Res>
    implements $AccountModelCopyWith<$Res> {
  _$AccountModelCopyWithImpl(this._self, this._then);

  final AccountModel _self;
  final $Res Function(AccountModel) _then;

/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? displayName = null,Object? imapHost = null,Object? imapPort = null,Object? imapSsl = null,Object? smtpHost = null,Object? smtpPort = null,Object? smtpSsl = null,Object? passwordKey = null,Object? color = null,Object? signature = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,imapHost: null == imapHost ? _self.imapHost : imapHost // ignore: cast_nullable_to_non_nullable
as String,imapPort: null == imapPort ? _self.imapPort : imapPort // ignore: cast_nullable_to_non_nullable
as int,imapSsl: null == imapSsl ? _self.imapSsl : imapSsl // ignore: cast_nullable_to_non_nullable
as bool,smtpHost: null == smtpHost ? _self.smtpHost : smtpHost // ignore: cast_nullable_to_non_nullable
as String,smtpPort: null == smtpPort ? _self.smtpPort : smtpPort // ignore: cast_nullable_to_non_nullable
as int,smtpSsl: null == smtpSsl ? _self.smtpSsl : smtpSsl // ignore: cast_nullable_to_non_nullable
as bool,passwordKey: null == passwordKey ? _self.passwordKey : passwordKey // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int,signature: null == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountModel].
extension AccountModelPatterns on AccountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountModel value)  $default,){
final _that = this;
switch (_that) {
case _AccountModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountModel value)?  $default,){
final _that = this;
switch (_that) {
case _AccountModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String email,  String displayName,  String imapHost,  int imapPort,  bool imapSsl,  String smtpHost,  int smtpPort,  bool smtpSsl,  String passwordKey,  int color,  String signature,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountModel() when $default != null:
return $default(_that.id,_that.email,_that.displayName,_that.imapHost,_that.imapPort,_that.imapSsl,_that.smtpHost,_that.smtpPort,_that.smtpSsl,_that.passwordKey,_that.color,_that.signature,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String email,  String displayName,  String imapHost,  int imapPort,  bool imapSsl,  String smtpHost,  int smtpPort,  bool smtpSsl,  String passwordKey,  int color,  String signature,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _AccountModel():
return $default(_that.id,_that.email,_that.displayName,_that.imapHost,_that.imapPort,_that.imapSsl,_that.smtpHost,_that.smtpPort,_that.smtpSsl,_that.passwordKey,_that.color,_that.signature,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String email,  String displayName,  String imapHost,  int imapPort,  bool imapSsl,  String smtpHost,  int smtpPort,  bool smtpSsl,  String passwordKey,  int color,  String signature,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AccountModel() when $default != null:
return $default(_that.id,_that.email,_that.displayName,_that.imapHost,_that.imapPort,_that.imapSsl,_that.smtpHost,_that.smtpPort,_that.smtpSsl,_that.passwordKey,_that.color,_that.signature,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountModel implements AccountModel {
  const _AccountModel({required this.id, required this.email, required this.displayName, required this.imapHost, required this.imapPort, required this.imapSsl, required this.smtpHost, required this.smtpPort, required this.smtpSsl, required this.passwordKey, required this.color, required this.signature, required this.createdAt});
  factory _AccountModel.fromJson(Map<String, dynamic> json) => _$AccountModelFromJson(json);

@override final  int id;
@override final  String email;
@override final  String displayName;
@override final  String imapHost;
@override final  int imapPort;
@override final  bool imapSsl;
@override final  String smtpHost;
@override final  int smtpPort;
@override final  bool smtpSsl;
@override final  String passwordKey;
@override final  int color;
@override final  String signature;
@override final  DateTime createdAt;

/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountModelCopyWith<_AccountModel> get copyWith => __$AccountModelCopyWithImpl<_AccountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.imapHost, imapHost) || other.imapHost == imapHost)&&(identical(other.imapPort, imapPort) || other.imapPort == imapPort)&&(identical(other.imapSsl, imapSsl) || other.imapSsl == imapSsl)&&(identical(other.smtpHost, smtpHost) || other.smtpHost == smtpHost)&&(identical(other.smtpPort, smtpPort) || other.smtpPort == smtpPort)&&(identical(other.smtpSsl, smtpSsl) || other.smtpSsl == smtpSsl)&&(identical(other.passwordKey, passwordKey) || other.passwordKey == passwordKey)&&(identical(other.color, color) || other.color == color)&&(identical(other.signature, signature) || other.signature == signature)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,displayName,imapHost,imapPort,imapSsl,smtpHost,smtpPort,smtpSsl,passwordKey,color,signature,createdAt);

@override
String toString() {
  return 'AccountModel(id: $id, email: $email, displayName: $displayName, imapHost: $imapHost, imapPort: $imapPort, imapSsl: $imapSsl, smtpHost: $smtpHost, smtpPort: $smtpPort, smtpSsl: $smtpSsl, passwordKey: $passwordKey, color: $color, signature: $signature, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AccountModelCopyWith<$Res> implements $AccountModelCopyWith<$Res> {
  factory _$AccountModelCopyWith(_AccountModel value, $Res Function(_AccountModel) _then) = __$AccountModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String email, String displayName, String imapHost, int imapPort, bool imapSsl, String smtpHost, int smtpPort, bool smtpSsl, String passwordKey, int color, String signature, DateTime createdAt
});




}
/// @nodoc
class __$AccountModelCopyWithImpl<$Res>
    implements _$AccountModelCopyWith<$Res> {
  __$AccountModelCopyWithImpl(this._self, this._then);

  final _AccountModel _self;
  final $Res Function(_AccountModel) _then;

/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? displayName = null,Object? imapHost = null,Object? imapPort = null,Object? imapSsl = null,Object? smtpHost = null,Object? smtpPort = null,Object? smtpSsl = null,Object? passwordKey = null,Object? color = null,Object? signature = null,Object? createdAt = null,}) {
  return _then(_AccountModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,imapHost: null == imapHost ? _self.imapHost : imapHost // ignore: cast_nullable_to_non_nullable
as String,imapPort: null == imapPort ? _self.imapPort : imapPort // ignore: cast_nullable_to_non_nullable
as int,imapSsl: null == imapSsl ? _self.imapSsl : imapSsl // ignore: cast_nullable_to_non_nullable
as bool,smtpHost: null == smtpHost ? _self.smtpHost : smtpHost // ignore: cast_nullable_to_non_nullable
as String,smtpPort: null == smtpPort ? _self.smtpPort : smtpPort // ignore: cast_nullable_to_non_nullable
as int,smtpSsl: null == smtpSsl ? _self.smtpSsl : smtpSsl // ignore: cast_nullable_to_non_nullable
as bool,passwordKey: null == passwordKey ? _self.passwordKey : passwordKey // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int,signature: null == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
