// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mailbox_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MailboxModel {

 int get id; int get accountId; String get name; String get path; String get type; int get unreadCount;
/// Create a copy of MailboxModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MailboxModelCopyWith<MailboxModel> get copyWith => _$MailboxModelCopyWithImpl<MailboxModel>(this as MailboxModel, _$identity);

  /// Serializes this MailboxModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MailboxModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.name, name) || other.name == name)&&(identical(other.path, path) || other.path == path)&&(identical(other.type, type) || other.type == type)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,name,path,type,unreadCount);

@override
String toString() {
  return 'MailboxModel(id: $id, accountId: $accountId, name: $name, path: $path, type: $type, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class $MailboxModelCopyWith<$Res>  {
  factory $MailboxModelCopyWith(MailboxModel value, $Res Function(MailboxModel) _then) = _$MailboxModelCopyWithImpl;
@useResult
$Res call({
 int id, int accountId, String name, String path, String type, int unreadCount
});




}
/// @nodoc
class _$MailboxModelCopyWithImpl<$Res>
    implements $MailboxModelCopyWith<$Res> {
  _$MailboxModelCopyWithImpl(this._self, this._then);

  final MailboxModel _self;
  final $Res Function(MailboxModel) _then;

/// Create a copy of MailboxModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accountId = null,Object? name = null,Object? path = null,Object? type = null,Object? unreadCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MailboxModel].
extension MailboxModelPatterns on MailboxModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MailboxModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MailboxModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MailboxModel value)  $default,){
final _that = this;
switch (_that) {
case _MailboxModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MailboxModel value)?  $default,){
final _that = this;
switch (_that) {
case _MailboxModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int accountId,  String name,  String path,  String type,  int unreadCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MailboxModel() when $default != null:
return $default(_that.id,_that.accountId,_that.name,_that.path,_that.type,_that.unreadCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int accountId,  String name,  String path,  String type,  int unreadCount)  $default,) {final _that = this;
switch (_that) {
case _MailboxModel():
return $default(_that.id,_that.accountId,_that.name,_that.path,_that.type,_that.unreadCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int accountId,  String name,  String path,  String type,  int unreadCount)?  $default,) {final _that = this;
switch (_that) {
case _MailboxModel() when $default != null:
return $default(_that.id,_that.accountId,_that.name,_that.path,_that.type,_that.unreadCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MailboxModel implements MailboxModel {
  const _MailboxModel({required this.id, required this.accountId, required this.name, required this.path, required this.type, required this.unreadCount});
  factory _MailboxModel.fromJson(Map<String, dynamic> json) => _$MailboxModelFromJson(json);

@override final  int id;
@override final  int accountId;
@override final  String name;
@override final  String path;
@override final  String type;
@override final  int unreadCount;

/// Create a copy of MailboxModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MailboxModelCopyWith<_MailboxModel> get copyWith => __$MailboxModelCopyWithImpl<_MailboxModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MailboxModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MailboxModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.name, name) || other.name == name)&&(identical(other.path, path) || other.path == path)&&(identical(other.type, type) || other.type == type)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,name,path,type,unreadCount);

@override
String toString() {
  return 'MailboxModel(id: $id, accountId: $accountId, name: $name, path: $path, type: $type, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class _$MailboxModelCopyWith<$Res> implements $MailboxModelCopyWith<$Res> {
  factory _$MailboxModelCopyWith(_MailboxModel value, $Res Function(_MailboxModel) _then) = __$MailboxModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int accountId, String name, String path, String type, int unreadCount
});




}
/// @nodoc
class __$MailboxModelCopyWithImpl<$Res>
    implements _$MailboxModelCopyWith<$Res> {
  __$MailboxModelCopyWithImpl(this._self, this._then);

  final _MailboxModel _self;
  final $Res Function(_MailboxModel) _then;

/// Create a copy of MailboxModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accountId = null,Object? name = null,Object? path = null,Object? type = null,Object? unreadCount = null,}) {
  return _then(_MailboxModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
