// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmailAddressModel {

 String get name; String get email;
/// Create a copy of EmailAddressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailAddressModelCopyWith<EmailAddressModel> get copyWith => _$EmailAddressModelCopyWithImpl<EmailAddressModel>(this as EmailAddressModel, _$identity);

  /// Serializes this EmailAddressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailAddressModel&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email);

@override
String toString() {
  return 'EmailAddressModel(name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class $EmailAddressModelCopyWith<$Res>  {
  factory $EmailAddressModelCopyWith(EmailAddressModel value, $Res Function(EmailAddressModel) _then) = _$EmailAddressModelCopyWithImpl;
@useResult
$Res call({
 String name, String email
});




}
/// @nodoc
class _$EmailAddressModelCopyWithImpl<$Res>
    implements $EmailAddressModelCopyWith<$Res> {
  _$EmailAddressModelCopyWithImpl(this._self, this._then);

  final EmailAddressModel _self;
  final $Res Function(EmailAddressModel) _then;

/// Create a copy of EmailAddressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailAddressModel].
extension EmailAddressModelPatterns on EmailAddressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailAddressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailAddressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailAddressModel value)  $default,){
final _that = this;
switch (_that) {
case _EmailAddressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailAddressModel value)?  $default,){
final _that = this;
switch (_that) {
case _EmailAddressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailAddressModel() when $default != null:
return $default(_that.name,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email)  $default,) {final _that = this;
switch (_that) {
case _EmailAddressModel():
return $default(_that.name,_that.email);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email)?  $default,) {final _that = this;
switch (_that) {
case _EmailAddressModel() when $default != null:
return $default(_that.name,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmailAddressModel implements EmailAddressModel {
  const _EmailAddressModel({required this.name, required this.email});
  factory _EmailAddressModel.fromJson(Map<String, dynamic> json) => _$EmailAddressModelFromJson(json);

@override final  String name;
@override final  String email;

/// Create a copy of EmailAddressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailAddressModelCopyWith<_EmailAddressModel> get copyWith => __$EmailAddressModelCopyWithImpl<_EmailAddressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailAddressModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailAddressModel&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email);

@override
String toString() {
  return 'EmailAddressModel(name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class _$EmailAddressModelCopyWith<$Res> implements $EmailAddressModelCopyWith<$Res> {
  factory _$EmailAddressModelCopyWith(_EmailAddressModel value, $Res Function(_EmailAddressModel) _then) = __$EmailAddressModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String email
});




}
/// @nodoc
class __$EmailAddressModelCopyWithImpl<$Res>
    implements _$EmailAddressModelCopyWith<$Res> {
  __$EmailAddressModelCopyWithImpl(this._self, this._then);

  final _EmailAddressModel _self;
  final $Res Function(_EmailAddressModel) _then;

/// Create a copy of EmailAddressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,}) {
  return _then(_EmailAddressModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$EmailModel {

 int get id; int get accountId; int? get remoteUid; String get messageId; String get mailbox; String get subject; String get fromName; String get fromEmail; List<EmailAddressModel> get to; List<EmailAddressModel> get cc; List<EmailAddressModel> get bcc; DateTime get date; String get preview; String get bodyPlain; String get bodyHtml; bool get isRead; bool get isStarred; bool get isDeleted; bool get isDraft; List<String> get labels; String get threadId; bool get hasAttachments;
/// Create a copy of EmailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailModelCopyWith<EmailModel> get copyWith => _$EmailModelCopyWithImpl<EmailModel>(this as EmailModel, _$identity);

  /// Serializes this EmailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.remoteUid, remoteUid) || other.remoteUid == remoteUid)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.mailbox, mailbox) || other.mailbox == mailbox)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.fromEmail, fromEmail) || other.fromEmail == fromEmail)&&const DeepCollectionEquality().equals(other.to, to)&&const DeepCollectionEquality().equals(other.cc, cc)&&const DeepCollectionEquality().equals(other.bcc, bcc)&&(identical(other.date, date) || other.date == date)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.bodyPlain, bodyPlain) || other.bodyPlain == bodyPlain)&&(identical(other.bodyHtml, bodyHtml) || other.bodyHtml == bodyHtml)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isStarred, isStarred) || other.isStarred == isStarred)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isDraft, isDraft) || other.isDraft == isDraft)&&const DeepCollectionEquality().equals(other.labels, labels)&&(identical(other.threadId, threadId) || other.threadId == threadId)&&(identical(other.hasAttachments, hasAttachments) || other.hasAttachments == hasAttachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,accountId,remoteUid,messageId,mailbox,subject,fromName,fromEmail,const DeepCollectionEquality().hash(to),const DeepCollectionEquality().hash(cc),const DeepCollectionEquality().hash(bcc),date,preview,bodyPlain,bodyHtml,isRead,isStarred,isDeleted,isDraft,const DeepCollectionEquality().hash(labels),threadId,hasAttachments]);

@override
String toString() {
  return 'EmailModel(id: $id, accountId: $accountId, remoteUid: $remoteUid, messageId: $messageId, mailbox: $mailbox, subject: $subject, fromName: $fromName, fromEmail: $fromEmail, to: $to, cc: $cc, bcc: $bcc, date: $date, preview: $preview, bodyPlain: $bodyPlain, bodyHtml: $bodyHtml, isRead: $isRead, isStarred: $isStarred, isDeleted: $isDeleted, isDraft: $isDraft, labels: $labels, threadId: $threadId, hasAttachments: $hasAttachments)';
}


}

/// @nodoc
abstract mixin class $EmailModelCopyWith<$Res>  {
  factory $EmailModelCopyWith(EmailModel value, $Res Function(EmailModel) _then) = _$EmailModelCopyWithImpl;
@useResult
$Res call({
 int id, int accountId, int? remoteUid, String messageId, String mailbox, String subject, String fromName, String fromEmail, List<EmailAddressModel> to, List<EmailAddressModel> cc, List<EmailAddressModel> bcc, DateTime date, String preview, String bodyPlain, String bodyHtml, bool isRead, bool isStarred, bool isDeleted, bool isDraft, List<String> labels, String threadId, bool hasAttachments
});




}
/// @nodoc
class _$EmailModelCopyWithImpl<$Res>
    implements $EmailModelCopyWith<$Res> {
  _$EmailModelCopyWithImpl(this._self, this._then);

  final EmailModel _self;
  final $Res Function(EmailModel) _then;

/// Create a copy of EmailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accountId = null,Object? remoteUid = freezed,Object? messageId = null,Object? mailbox = null,Object? subject = null,Object? fromName = null,Object? fromEmail = null,Object? to = null,Object? cc = null,Object? bcc = null,Object? date = null,Object? preview = null,Object? bodyPlain = null,Object? bodyHtml = null,Object? isRead = null,Object? isStarred = null,Object? isDeleted = null,Object? isDraft = null,Object? labels = null,Object? threadId = null,Object? hasAttachments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,remoteUid: freezed == remoteUid ? _self.remoteUid : remoteUid // ignore: cast_nullable_to_non_nullable
as int?,messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,mailbox: null == mailbox ? _self.mailbox : mailbox // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,fromName: null == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String,fromEmail: null == fromEmail ? _self.fromEmail : fromEmail // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as List<EmailAddressModel>,cc: null == cc ? _self.cc : cc // ignore: cast_nullable_to_non_nullable
as List<EmailAddressModel>,bcc: null == bcc ? _self.bcc : bcc // ignore: cast_nullable_to_non_nullable
as List<EmailAddressModel>,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String,bodyPlain: null == bodyPlain ? _self.bodyPlain : bodyPlain // ignore: cast_nullable_to_non_nullable
as String,bodyHtml: null == bodyHtml ? _self.bodyHtml : bodyHtml // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isStarred: null == isStarred ? _self.isStarred : isStarred // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,isDraft: null == isDraft ? _self.isDraft : isDraft // ignore: cast_nullable_to_non_nullable
as bool,labels: null == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>,threadId: null == threadId ? _self.threadId : threadId // ignore: cast_nullable_to_non_nullable
as String,hasAttachments: null == hasAttachments ? _self.hasAttachments : hasAttachments // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailModel].
extension EmailModelPatterns on EmailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailModel value)  $default,){
final _that = this;
switch (_that) {
case _EmailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailModel value)?  $default,){
final _that = this;
switch (_that) {
case _EmailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int accountId,  int? remoteUid,  String messageId,  String mailbox,  String subject,  String fromName,  String fromEmail,  List<EmailAddressModel> to,  List<EmailAddressModel> cc,  List<EmailAddressModel> bcc,  DateTime date,  String preview,  String bodyPlain,  String bodyHtml,  bool isRead,  bool isStarred,  bool isDeleted,  bool isDraft,  List<String> labels,  String threadId,  bool hasAttachments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailModel() when $default != null:
return $default(_that.id,_that.accountId,_that.remoteUid,_that.messageId,_that.mailbox,_that.subject,_that.fromName,_that.fromEmail,_that.to,_that.cc,_that.bcc,_that.date,_that.preview,_that.bodyPlain,_that.bodyHtml,_that.isRead,_that.isStarred,_that.isDeleted,_that.isDraft,_that.labels,_that.threadId,_that.hasAttachments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int accountId,  int? remoteUid,  String messageId,  String mailbox,  String subject,  String fromName,  String fromEmail,  List<EmailAddressModel> to,  List<EmailAddressModel> cc,  List<EmailAddressModel> bcc,  DateTime date,  String preview,  String bodyPlain,  String bodyHtml,  bool isRead,  bool isStarred,  bool isDeleted,  bool isDraft,  List<String> labels,  String threadId,  bool hasAttachments)  $default,) {final _that = this;
switch (_that) {
case _EmailModel():
return $default(_that.id,_that.accountId,_that.remoteUid,_that.messageId,_that.mailbox,_that.subject,_that.fromName,_that.fromEmail,_that.to,_that.cc,_that.bcc,_that.date,_that.preview,_that.bodyPlain,_that.bodyHtml,_that.isRead,_that.isStarred,_that.isDeleted,_that.isDraft,_that.labels,_that.threadId,_that.hasAttachments);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int accountId,  int? remoteUid,  String messageId,  String mailbox,  String subject,  String fromName,  String fromEmail,  List<EmailAddressModel> to,  List<EmailAddressModel> cc,  List<EmailAddressModel> bcc,  DateTime date,  String preview,  String bodyPlain,  String bodyHtml,  bool isRead,  bool isStarred,  bool isDeleted,  bool isDraft,  List<String> labels,  String threadId,  bool hasAttachments)?  $default,) {final _that = this;
switch (_that) {
case _EmailModel() when $default != null:
return $default(_that.id,_that.accountId,_that.remoteUid,_that.messageId,_that.mailbox,_that.subject,_that.fromName,_that.fromEmail,_that.to,_that.cc,_that.bcc,_that.date,_that.preview,_that.bodyPlain,_that.bodyHtml,_that.isRead,_that.isStarred,_that.isDeleted,_that.isDraft,_that.labels,_that.threadId,_that.hasAttachments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmailModel implements EmailModel {
  const _EmailModel({required this.id, required this.accountId, this.remoteUid, required this.messageId, required this.mailbox, required this.subject, required this.fromName, required this.fromEmail, required final  List<EmailAddressModel> to, required final  List<EmailAddressModel> cc, required final  List<EmailAddressModel> bcc, required this.date, required this.preview, required this.bodyPlain, required this.bodyHtml, required this.isRead, required this.isStarred, required this.isDeleted, required this.isDraft, required final  List<String> labels, required this.threadId, required this.hasAttachments}): _to = to,_cc = cc,_bcc = bcc,_labels = labels;
  factory _EmailModel.fromJson(Map<String, dynamic> json) => _$EmailModelFromJson(json);

@override final  int id;
@override final  int accountId;
@override final  int? remoteUid;
@override final  String messageId;
@override final  String mailbox;
@override final  String subject;
@override final  String fromName;
@override final  String fromEmail;
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

@override final  DateTime date;
@override final  String preview;
@override final  String bodyPlain;
@override final  String bodyHtml;
@override final  bool isRead;
@override final  bool isStarred;
@override final  bool isDeleted;
@override final  bool isDraft;
 final  List<String> _labels;
@override List<String> get labels {
  if (_labels is EqualUnmodifiableListView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_labels);
}

@override final  String threadId;
@override final  bool hasAttachments;

/// Create a copy of EmailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailModelCopyWith<_EmailModel> get copyWith => __$EmailModelCopyWithImpl<_EmailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.remoteUid, remoteUid) || other.remoteUid == remoteUid)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.mailbox, mailbox) || other.mailbox == mailbox)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.fromName, fromName) || other.fromName == fromName)&&(identical(other.fromEmail, fromEmail) || other.fromEmail == fromEmail)&&const DeepCollectionEquality().equals(other._to, _to)&&const DeepCollectionEquality().equals(other._cc, _cc)&&const DeepCollectionEquality().equals(other._bcc, _bcc)&&(identical(other.date, date) || other.date == date)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.bodyPlain, bodyPlain) || other.bodyPlain == bodyPlain)&&(identical(other.bodyHtml, bodyHtml) || other.bodyHtml == bodyHtml)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isStarred, isStarred) || other.isStarred == isStarred)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.isDraft, isDraft) || other.isDraft == isDraft)&&const DeepCollectionEquality().equals(other._labels, _labels)&&(identical(other.threadId, threadId) || other.threadId == threadId)&&(identical(other.hasAttachments, hasAttachments) || other.hasAttachments == hasAttachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,accountId,remoteUid,messageId,mailbox,subject,fromName,fromEmail,const DeepCollectionEquality().hash(_to),const DeepCollectionEquality().hash(_cc),const DeepCollectionEquality().hash(_bcc),date,preview,bodyPlain,bodyHtml,isRead,isStarred,isDeleted,isDraft,const DeepCollectionEquality().hash(_labels),threadId,hasAttachments]);

@override
String toString() {
  return 'EmailModel(id: $id, accountId: $accountId, remoteUid: $remoteUid, messageId: $messageId, mailbox: $mailbox, subject: $subject, fromName: $fromName, fromEmail: $fromEmail, to: $to, cc: $cc, bcc: $bcc, date: $date, preview: $preview, bodyPlain: $bodyPlain, bodyHtml: $bodyHtml, isRead: $isRead, isStarred: $isStarred, isDeleted: $isDeleted, isDraft: $isDraft, labels: $labels, threadId: $threadId, hasAttachments: $hasAttachments)';
}


}

/// @nodoc
abstract mixin class _$EmailModelCopyWith<$Res> implements $EmailModelCopyWith<$Res> {
  factory _$EmailModelCopyWith(_EmailModel value, $Res Function(_EmailModel) _then) = __$EmailModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int accountId, int? remoteUid, String messageId, String mailbox, String subject, String fromName, String fromEmail, List<EmailAddressModel> to, List<EmailAddressModel> cc, List<EmailAddressModel> bcc, DateTime date, String preview, String bodyPlain, String bodyHtml, bool isRead, bool isStarred, bool isDeleted, bool isDraft, List<String> labels, String threadId, bool hasAttachments
});




}
/// @nodoc
class __$EmailModelCopyWithImpl<$Res>
    implements _$EmailModelCopyWith<$Res> {
  __$EmailModelCopyWithImpl(this._self, this._then);

  final _EmailModel _self;
  final $Res Function(_EmailModel) _then;

/// Create a copy of EmailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accountId = null,Object? remoteUid = freezed,Object? messageId = null,Object? mailbox = null,Object? subject = null,Object? fromName = null,Object? fromEmail = null,Object? to = null,Object? cc = null,Object? bcc = null,Object? date = null,Object? preview = null,Object? bodyPlain = null,Object? bodyHtml = null,Object? isRead = null,Object? isStarred = null,Object? isDeleted = null,Object? isDraft = null,Object? labels = null,Object? threadId = null,Object? hasAttachments = null,}) {
  return _then(_EmailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,remoteUid: freezed == remoteUid ? _self.remoteUid : remoteUid // ignore: cast_nullable_to_non_nullable
as int?,messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,mailbox: null == mailbox ? _self.mailbox : mailbox // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,fromName: null == fromName ? _self.fromName : fromName // ignore: cast_nullable_to_non_nullable
as String,fromEmail: null == fromEmail ? _self.fromEmail : fromEmail // ignore: cast_nullable_to_non_nullable
as String,to: null == to ? _self._to : to // ignore: cast_nullable_to_non_nullable
as List<EmailAddressModel>,cc: null == cc ? _self._cc : cc // ignore: cast_nullable_to_non_nullable
as List<EmailAddressModel>,bcc: null == bcc ? _self._bcc : bcc // ignore: cast_nullable_to_non_nullable
as List<EmailAddressModel>,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String,bodyPlain: null == bodyPlain ? _self.bodyPlain : bodyPlain // ignore: cast_nullable_to_non_nullable
as String,bodyHtml: null == bodyHtml ? _self.bodyHtml : bodyHtml // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isStarred: null == isStarred ? _self.isStarred : isStarred // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,isDraft: null == isDraft ? _self.isDraft : isDraft // ignore: cast_nullable_to_non_nullable
as bool,labels: null == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as List<String>,threadId: null == threadId ? _self.threadId : threadId // ignore: cast_nullable_to_non_nullable
as String,hasAttachments: null == hasAttachments ? _self.hasAttachments : hasAttachments // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
