// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attachment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttachmentModel {

 int get id; int get emailId; String get filename; String get mimeType; int get size; String get localPath;
/// Create a copy of AttachmentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttachmentModelCopyWith<AttachmentModel> get copyWith => _$AttachmentModelCopyWithImpl<AttachmentModel>(this as AttachmentModel, _$identity);

  /// Serializes this AttachmentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttachmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.emailId, emailId) || other.emailId == emailId)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size)&&(identical(other.localPath, localPath) || other.localPath == localPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,emailId,filename,mimeType,size,localPath);

@override
String toString() {
  return 'AttachmentModel(id: $id, emailId: $emailId, filename: $filename, mimeType: $mimeType, size: $size, localPath: $localPath)';
}


}

/// @nodoc
abstract mixin class $AttachmentModelCopyWith<$Res>  {
  factory $AttachmentModelCopyWith(AttachmentModel value, $Res Function(AttachmentModel) _then) = _$AttachmentModelCopyWithImpl;
@useResult
$Res call({
 int id, int emailId, String filename, String mimeType, int size, String localPath
});




}
/// @nodoc
class _$AttachmentModelCopyWithImpl<$Res>
    implements $AttachmentModelCopyWith<$Res> {
  _$AttachmentModelCopyWithImpl(this._self, this._then);

  final AttachmentModel _self;
  final $Res Function(AttachmentModel) _then;

/// Create a copy of AttachmentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? emailId = null,Object? filename = null,Object? mimeType = null,Object? size = null,Object? localPath = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,emailId: null == emailId ? _self.emailId : emailId // ignore: cast_nullable_to_non_nullable
as int,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AttachmentModel].
extension AttachmentModelPatterns on AttachmentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttachmentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttachmentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttachmentModel value)  $default,){
final _that = this;
switch (_that) {
case _AttachmentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttachmentModel value)?  $default,){
final _that = this;
switch (_that) {
case _AttachmentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int emailId,  String filename,  String mimeType,  int size,  String localPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttachmentModel() when $default != null:
return $default(_that.id,_that.emailId,_that.filename,_that.mimeType,_that.size,_that.localPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int emailId,  String filename,  String mimeType,  int size,  String localPath)  $default,) {final _that = this;
switch (_that) {
case _AttachmentModel():
return $default(_that.id,_that.emailId,_that.filename,_that.mimeType,_that.size,_that.localPath);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int emailId,  String filename,  String mimeType,  int size,  String localPath)?  $default,) {final _that = this;
switch (_that) {
case _AttachmentModel() when $default != null:
return $default(_that.id,_that.emailId,_that.filename,_that.mimeType,_that.size,_that.localPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttachmentModel implements AttachmentModel {
  const _AttachmentModel({required this.id, required this.emailId, required this.filename, required this.mimeType, required this.size, required this.localPath});
  factory _AttachmentModel.fromJson(Map<String, dynamic> json) => _$AttachmentModelFromJson(json);

@override final  int id;
@override final  int emailId;
@override final  String filename;
@override final  String mimeType;
@override final  int size;
@override final  String localPath;

/// Create a copy of AttachmentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttachmentModelCopyWith<_AttachmentModel> get copyWith => __$AttachmentModelCopyWithImpl<_AttachmentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttachmentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttachmentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.emailId, emailId) || other.emailId == emailId)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size)&&(identical(other.localPath, localPath) || other.localPath == localPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,emailId,filename,mimeType,size,localPath);

@override
String toString() {
  return 'AttachmentModel(id: $id, emailId: $emailId, filename: $filename, mimeType: $mimeType, size: $size, localPath: $localPath)';
}


}

/// @nodoc
abstract mixin class _$AttachmentModelCopyWith<$Res> implements $AttachmentModelCopyWith<$Res> {
  factory _$AttachmentModelCopyWith(_AttachmentModel value, $Res Function(_AttachmentModel) _then) = __$AttachmentModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int emailId, String filename, String mimeType, int size, String localPath
});




}
/// @nodoc
class __$AttachmentModelCopyWithImpl<$Res>
    implements _$AttachmentModelCopyWith<$Res> {
  __$AttachmentModelCopyWithImpl(this._self, this._then);

  final _AttachmentModel _self;
  final $Res Function(_AttachmentModel) _then;

/// Create a copy of AttachmentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? emailId = null,Object? filename = null,Object? mimeType = null,Object? size = null,Object? localPath = null,}) {
  return _then(_AttachmentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,emailId: null == emailId ? _self.emailId : emailId // ignore: cast_nullable_to_non_nullable
as int,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
