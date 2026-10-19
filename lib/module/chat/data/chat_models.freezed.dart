// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Message {

 String get id; String get conversationId; String? get senderId; bool get mine; String? get body; String? get mediaUrl; String? get mediaType;@JsonKey(name: 'mediaDurationMs') int? get durationMs; String? get broadcastId; String? get productId; String get status; bool get deleted; bool get edited; DateTime get createdAt; DateTime? get editedAt; DateTime? get readAt;
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCopyWith<Message> get copyWith => _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Message&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.mine, mine) || other.mine == mine)&&(identical(other.body, body) || other.body == body)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs)&&(identical(other.broadcastId, broadcastId) || other.broadcastId == broadcastId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.status, status) || other.status == status)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.edited, edited) || other.edited == edited)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.readAt, readAt) || other.readAt == readAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,conversationId,senderId,mine,body,mediaUrl,mediaType,durationMs,broadcastId,productId,status,deleted,edited,createdAt,editedAt,readAt);

@override
String toString() {
  return 'Message(id: $id, conversationId: $conversationId, senderId: $senderId, mine: $mine, body: $body, mediaUrl: $mediaUrl, mediaType: $mediaType, durationMs: $durationMs, broadcastId: $broadcastId, productId: $productId, status: $status, deleted: $deleted, edited: $edited, createdAt: $createdAt, editedAt: $editedAt, readAt: $readAt)';
}


}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res>  {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) = _$MessageCopyWithImpl;
@useResult
$Res call({
 String id, String conversationId, String? senderId, bool mine, String? body, String? mediaUrl, String? mediaType,@JsonKey(name: 'mediaDurationMs') int? durationMs, String? broadcastId, String? productId, String status, bool deleted, bool edited, DateTime createdAt, DateTime? editedAt, DateTime? readAt
});




}
/// @nodoc
class _$MessageCopyWithImpl<$Res>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? conversationId = null,Object? senderId = freezed,Object? mine = null,Object? body = freezed,Object? mediaUrl = freezed,Object? mediaType = freezed,Object? durationMs = freezed,Object? broadcastId = freezed,Object? productId = freezed,Object? status = null,Object? deleted = null,Object? edited = null,Object? createdAt = null,Object? editedAt = freezed,Object? readAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,mine: null == mine ? _self.mine : mine // ignore: cast_nullable_to_non_nullable
as bool,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,durationMs: freezed == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int?,broadcastId: freezed == broadcastId ? _self.broadcastId : broadcastId // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,edited: null == edited ? _self.edited : edited // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,editedAt: freezed == editedAt ? _self.editedAt : editedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Message].
extension MessagePatterns on Message {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Message value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Message value)  $default,){
final _that = this;
switch (_that) {
case _Message():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Message value)?  $default,){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String conversationId,  String? senderId,  bool mine,  String? body,  String? mediaUrl,  String? mediaType, @JsonKey(name: 'mediaDurationMs')  int? durationMs,  String? broadcastId,  String? productId,  String status,  bool deleted,  bool edited,  DateTime createdAt,  DateTime? editedAt,  DateTime? readAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.conversationId,_that.senderId,_that.mine,_that.body,_that.mediaUrl,_that.mediaType,_that.durationMs,_that.broadcastId,_that.productId,_that.status,_that.deleted,_that.edited,_that.createdAt,_that.editedAt,_that.readAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String conversationId,  String? senderId,  bool mine,  String? body,  String? mediaUrl,  String? mediaType, @JsonKey(name: 'mediaDurationMs')  int? durationMs,  String? broadcastId,  String? productId,  String status,  bool deleted,  bool edited,  DateTime createdAt,  DateTime? editedAt,  DateTime? readAt)  $default,) {final _that = this;
switch (_that) {
case _Message():
return $default(_that.id,_that.conversationId,_that.senderId,_that.mine,_that.body,_that.mediaUrl,_that.mediaType,_that.durationMs,_that.broadcastId,_that.productId,_that.status,_that.deleted,_that.edited,_that.createdAt,_that.editedAt,_that.readAt);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String conversationId,  String? senderId,  bool mine,  String? body,  String? mediaUrl,  String? mediaType, @JsonKey(name: 'mediaDurationMs')  int? durationMs,  String? broadcastId,  String? productId,  String status,  bool deleted,  bool edited,  DateTime createdAt,  DateTime? editedAt,  DateTime? readAt)?  $default,) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.conversationId,_that.senderId,_that.mine,_that.body,_that.mediaUrl,_that.mediaType,_that.durationMs,_that.broadcastId,_that.productId,_that.status,_that.deleted,_that.edited,_that.createdAt,_that.editedAt,_that.readAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Message implements Message {
  const _Message({required this.id, required this.conversationId, this.senderId, this.mine = false, this.body, this.mediaUrl, this.mediaType, @JsonKey(name: 'mediaDurationMs') this.durationMs, this.broadcastId, this.productId, required this.status, this.deleted = false, this.edited = false, required this.createdAt, this.editedAt, this.readAt});
  factory _Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

@override final  String id;
@override final  String conversationId;
@override final  String? senderId;
@override@JsonKey() final  bool mine;
@override final  String? body;
@override final  String? mediaUrl;
@override final  String? mediaType;
@override@JsonKey(name: 'mediaDurationMs') final  int? durationMs;
@override final  String? broadcastId;
@override final  String? productId;
@override final  String status;
@override@JsonKey() final  bool deleted;
@override@JsonKey() final  bool edited;
@override final  DateTime createdAt;
@override final  DateTime? editedAt;
@override final  DateTime? readAt;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageCopyWith<_Message> get copyWith => __$MessageCopyWithImpl<_Message>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Message&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.mine, mine) || other.mine == mine)&&(identical(other.body, body) || other.body == body)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs)&&(identical(other.broadcastId, broadcastId) || other.broadcastId == broadcastId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.status, status) || other.status == status)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.edited, edited) || other.edited == edited)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.readAt, readAt) || other.readAt == readAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,conversationId,senderId,mine,body,mediaUrl,mediaType,durationMs,broadcastId,productId,status,deleted,edited,createdAt,editedAt,readAt);

@override
String toString() {
  return 'Message(id: $id, conversationId: $conversationId, senderId: $senderId, mine: $mine, body: $body, mediaUrl: $mediaUrl, mediaType: $mediaType, durationMs: $durationMs, broadcastId: $broadcastId, productId: $productId, status: $status, deleted: $deleted, edited: $edited, createdAt: $createdAt, editedAt: $editedAt, readAt: $readAt)';
}


}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) = __$MessageCopyWithImpl;
@override @useResult
$Res call({
 String id, String conversationId, String? senderId, bool mine, String? body, String? mediaUrl, String? mediaType,@JsonKey(name: 'mediaDurationMs') int? durationMs, String? broadcastId, String? productId, String status, bool deleted, bool edited, DateTime createdAt, DateTime? editedAt, DateTime? readAt
});




}
/// @nodoc
class __$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? conversationId = null,Object? senderId = freezed,Object? mine = null,Object? body = freezed,Object? mediaUrl = freezed,Object? mediaType = freezed,Object? durationMs = freezed,Object? broadcastId = freezed,Object? productId = freezed,Object? status = null,Object? deleted = null,Object? edited = null,Object? createdAt = null,Object? editedAt = freezed,Object? readAt = freezed,}) {
  return _then(_Message(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,mine: null == mine ? _self.mine : mine // ignore: cast_nullable_to_non_nullable
as bool,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,durationMs: freezed == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int?,broadcastId: freezed == broadcastId ? _self.broadcastId : broadcastId // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,edited: null == edited ? _self.edited : edited // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,editedAt: freezed == editedAt ? _self.editedAt : editedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Conversation {

 String get id; String get peerUserId; String? get peerName; String? get peerAvatarUrl; String? get peerPhone; String? get lastMessagePreview; bool get lastMessageMine; DateTime? get lastMessageAt; int get unreadCount; String get status;
/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationCopyWith<Conversation> get copyWith => _$ConversationCopyWithImpl<Conversation>(this as Conversation, _$identity);

  /// Serializes this Conversation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Conversation&&(identical(other.id, id) || other.id == id)&&(identical(other.peerUserId, peerUserId) || other.peerUserId == peerUserId)&&(identical(other.peerName, peerName) || other.peerName == peerName)&&(identical(other.peerAvatarUrl, peerAvatarUrl) || other.peerAvatarUrl == peerAvatarUrl)&&(identical(other.peerPhone, peerPhone) || other.peerPhone == peerPhone)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.lastMessageMine, lastMessageMine) || other.lastMessageMine == lastMessageMine)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,peerUserId,peerName,peerAvatarUrl,peerPhone,lastMessagePreview,lastMessageMine,lastMessageAt,unreadCount,status);

@override
String toString() {
  return 'Conversation(id: $id, peerUserId: $peerUserId, peerName: $peerName, peerAvatarUrl: $peerAvatarUrl, peerPhone: $peerPhone, lastMessagePreview: $lastMessagePreview, lastMessageMine: $lastMessageMine, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount, status: $status)';
}


}

/// @nodoc
abstract mixin class $ConversationCopyWith<$Res>  {
  factory $ConversationCopyWith(Conversation value, $Res Function(Conversation) _then) = _$ConversationCopyWithImpl;
@useResult
$Res call({
 String id, String peerUserId, String? peerName, String? peerAvatarUrl, String? peerPhone, String? lastMessagePreview, bool lastMessageMine, DateTime? lastMessageAt, int unreadCount, String status
});




}
/// @nodoc
class _$ConversationCopyWithImpl<$Res>
    implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._self, this._then);

  final Conversation _self;
  final $Res Function(Conversation) _then;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? peerUserId = null,Object? peerName = freezed,Object? peerAvatarUrl = freezed,Object? peerPhone = freezed,Object? lastMessagePreview = freezed,Object? lastMessageMine = null,Object? lastMessageAt = freezed,Object? unreadCount = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,peerUserId: null == peerUserId ? _self.peerUserId : peerUserId // ignore: cast_nullable_to_non_nullable
as String,peerName: freezed == peerName ? _self.peerName : peerName // ignore: cast_nullable_to_non_nullable
as String?,peerAvatarUrl: freezed == peerAvatarUrl ? _self.peerAvatarUrl : peerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,peerPhone: freezed == peerPhone ? _self.peerPhone : peerPhone // ignore: cast_nullable_to_non_nullable
as String?,lastMessagePreview: freezed == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String?,lastMessageMine: null == lastMessageMine ? _self.lastMessageMine : lastMessageMine // ignore: cast_nullable_to_non_nullable
as bool,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Conversation].
extension ConversationPatterns on Conversation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Conversation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Conversation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Conversation value)  $default,){
final _that = this;
switch (_that) {
case _Conversation():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Conversation value)?  $default,){
final _that = this;
switch (_that) {
case _Conversation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String peerUserId,  String? peerName,  String? peerAvatarUrl,  String? peerPhone,  String? lastMessagePreview,  bool lastMessageMine,  DateTime? lastMessageAt,  int unreadCount,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Conversation() when $default != null:
return $default(_that.id,_that.peerUserId,_that.peerName,_that.peerAvatarUrl,_that.peerPhone,_that.lastMessagePreview,_that.lastMessageMine,_that.lastMessageAt,_that.unreadCount,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String peerUserId,  String? peerName,  String? peerAvatarUrl,  String? peerPhone,  String? lastMessagePreview,  bool lastMessageMine,  DateTime? lastMessageAt,  int unreadCount,  String status)  $default,) {final _that = this;
switch (_that) {
case _Conversation():
return $default(_that.id,_that.peerUserId,_that.peerName,_that.peerAvatarUrl,_that.peerPhone,_that.lastMessagePreview,_that.lastMessageMine,_that.lastMessageAt,_that.unreadCount,_that.status);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String peerUserId,  String? peerName,  String? peerAvatarUrl,  String? peerPhone,  String? lastMessagePreview,  bool lastMessageMine,  DateTime? lastMessageAt,  int unreadCount,  String status)?  $default,) {final _that = this;
switch (_that) {
case _Conversation() when $default != null:
return $default(_that.id,_that.peerUserId,_that.peerName,_that.peerAvatarUrl,_that.peerPhone,_that.lastMessagePreview,_that.lastMessageMine,_that.lastMessageAt,_that.unreadCount,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Conversation implements Conversation {
  const _Conversation({required this.id, required this.peerUserId, this.peerName, this.peerAvatarUrl, this.peerPhone, this.lastMessagePreview, this.lastMessageMine = false, this.lastMessageAt, this.unreadCount = 0, required this.status});
  factory _Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);

@override final  String id;
@override final  String peerUserId;
@override final  String? peerName;
@override final  String? peerAvatarUrl;
@override final  String? peerPhone;
@override final  String? lastMessagePreview;
@override@JsonKey() final  bool lastMessageMine;
@override final  DateTime? lastMessageAt;
@override@JsonKey() final  int unreadCount;
@override final  String status;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationCopyWith<_Conversation> get copyWith => __$ConversationCopyWithImpl<_Conversation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Conversation&&(identical(other.id, id) || other.id == id)&&(identical(other.peerUserId, peerUserId) || other.peerUserId == peerUserId)&&(identical(other.peerName, peerName) || other.peerName == peerName)&&(identical(other.peerAvatarUrl, peerAvatarUrl) || other.peerAvatarUrl == peerAvatarUrl)&&(identical(other.peerPhone, peerPhone) || other.peerPhone == peerPhone)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.lastMessageMine, lastMessageMine) || other.lastMessageMine == lastMessageMine)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,peerUserId,peerName,peerAvatarUrl,peerPhone,lastMessagePreview,lastMessageMine,lastMessageAt,unreadCount,status);

@override
String toString() {
  return 'Conversation(id: $id, peerUserId: $peerUserId, peerName: $peerName, peerAvatarUrl: $peerAvatarUrl, peerPhone: $peerPhone, lastMessagePreview: $lastMessagePreview, lastMessageMine: $lastMessageMine, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ConversationCopyWith<$Res> implements $ConversationCopyWith<$Res> {
  factory _$ConversationCopyWith(_Conversation value, $Res Function(_Conversation) _then) = __$ConversationCopyWithImpl;
@override @useResult
$Res call({
 String id, String peerUserId, String? peerName, String? peerAvatarUrl, String? peerPhone, String? lastMessagePreview, bool lastMessageMine, DateTime? lastMessageAt, int unreadCount, String status
});




}
/// @nodoc
class __$ConversationCopyWithImpl<$Res>
    implements _$ConversationCopyWith<$Res> {
  __$ConversationCopyWithImpl(this._self, this._then);

  final _Conversation _self;
  final $Res Function(_Conversation) _then;

/// Create a copy of Conversation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? peerUserId = null,Object? peerName = freezed,Object? peerAvatarUrl = freezed,Object? peerPhone = freezed,Object? lastMessagePreview = freezed,Object? lastMessageMine = null,Object? lastMessageAt = freezed,Object? unreadCount = null,Object? status = null,}) {
  return _then(_Conversation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,peerUserId: null == peerUserId ? _self.peerUserId : peerUserId // ignore: cast_nullable_to_non_nullable
as String,peerName: freezed == peerName ? _self.peerName : peerName // ignore: cast_nullable_to_non_nullable
as String?,peerAvatarUrl: freezed == peerAvatarUrl ? _self.peerAvatarUrl : peerAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,peerPhone: freezed == peerPhone ? _self.peerPhone : peerPhone // ignore: cast_nullable_to_non_nullable
as String?,lastMessagePreview: freezed == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String?,lastMessageMine: null == lastMessageMine ? _self.lastMessageMine : lastMessageMine // ignore: cast_nullable_to_non_nullable
as bool,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ConversationPage {

 List<Conversation> get content; int get page; int get size; int get totalElements; int get totalPages;
/// Create a copy of ConversationPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationPageCopyWith<ConversationPage> get copyWith => _$ConversationPageCopyWithImpl<ConversationPage>(this as ConversationPage, _$identity);

  /// Serializes this ConversationPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationPage&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),page,size,totalElements,totalPages);

@override
String toString() {
  return 'ConversationPage(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $ConversationPageCopyWith<$Res>  {
  factory $ConversationPageCopyWith(ConversationPage value, $Res Function(ConversationPage) _then) = _$ConversationPageCopyWithImpl;
@useResult
$Res call({
 List<Conversation> content, int page, int size, int totalElements, int totalPages
});




}
/// @nodoc
class _$ConversationPageCopyWithImpl<$Res>
    implements $ConversationPageCopyWith<$Res> {
  _$ConversationPageCopyWithImpl(this._self, this._then);

  final ConversationPage _self;
  final $Res Function(ConversationPage) _then;

/// Create a copy of ConversationPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<Conversation>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationPage].
extension ConversationPagePatterns on ConversationPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationPage value)  $default,){
final _that = this;
switch (_that) {
case _ConversationPage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationPage value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Conversation> content,  int page,  int size,  int totalElements,  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationPage() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Conversation> content,  int page,  int size,  int totalElements,  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _ConversationPage():
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Conversation> content,  int page,  int size,  int totalElements,  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _ConversationPage() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationPage implements ConversationPage {
  const _ConversationPage({final  List<Conversation> content = const <Conversation>[], this.page = 0, this.size = 0, this.totalElements = 0, this.totalPages = 0}): _content = content;
  factory _ConversationPage.fromJson(Map<String, dynamic> json) => _$ConversationPageFromJson(json);

 final  List<Conversation> _content;
@override@JsonKey() List<Conversation> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int size;
@override@JsonKey() final  int totalElements;
@override@JsonKey() final  int totalPages;

/// Create a copy of ConversationPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationPageCopyWith<_ConversationPage> get copyWith => __$ConversationPageCopyWithImpl<_ConversationPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationPage&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),page,size,totalElements,totalPages);

@override
String toString() {
  return 'ConversationPage(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$ConversationPageCopyWith<$Res> implements $ConversationPageCopyWith<$Res> {
  factory _$ConversationPageCopyWith(_ConversationPage value, $Res Function(_ConversationPage) _then) = __$ConversationPageCopyWithImpl;
@override @useResult
$Res call({
 List<Conversation> content, int page, int size, int totalElements, int totalPages
});




}
/// @nodoc
class __$ConversationPageCopyWithImpl<$Res>
    implements _$ConversationPageCopyWith<$Res> {
  __$ConversationPageCopyWithImpl(this._self, this._then);

  final _ConversationPage _self;
  final $Res Function(_ConversationPage) _then;

/// Create a copy of ConversationPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,}) {
  return _then(_ConversationPage(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<Conversation>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MessagePage {

 List<Message> get content; int get page; int get size; int get totalElements; int get totalPages;
/// Create a copy of MessagePage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessagePageCopyWith<MessagePage> get copyWith => _$MessagePageCopyWithImpl<MessagePage>(this as MessagePage, _$identity);

  /// Serializes this MessagePage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagePage&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),page,size,totalElements,totalPages);

@override
String toString() {
  return 'MessagePage(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $MessagePageCopyWith<$Res>  {
  factory $MessagePageCopyWith(MessagePage value, $Res Function(MessagePage) _then) = _$MessagePageCopyWithImpl;
@useResult
$Res call({
 List<Message> content, int page, int size, int totalElements, int totalPages
});




}
/// @nodoc
class _$MessagePageCopyWithImpl<$Res>
    implements $MessagePageCopyWith<$Res> {
  _$MessagePageCopyWithImpl(this._self, this._then);

  final MessagePage _self;
  final $Res Function(MessagePage) _then;

/// Create a copy of MessagePage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<Message>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MessagePage].
extension MessagePagePatterns on MessagePage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessagePage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessagePage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessagePage value)  $default,){
final _that = this;
switch (_that) {
case _MessagePage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessagePage value)?  $default,){
final _that = this;
switch (_that) {
case _MessagePage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Message> content,  int page,  int size,  int totalElements,  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessagePage() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Message> content,  int page,  int size,  int totalElements,  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _MessagePage():
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Message> content,  int page,  int size,  int totalElements,  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _MessagePage() when $default != null:
return $default(_that.content,_that.page,_that.size,_that.totalElements,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessagePage implements MessagePage {
  const _MessagePage({final  List<Message> content = const <Message>[], this.page = 0, this.size = 0, this.totalElements = 0, this.totalPages = 0}): _content = content;
  factory _MessagePage.fromJson(Map<String, dynamic> json) => _$MessagePageFromJson(json);

 final  List<Message> _content;
@override@JsonKey() List<Message> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  int size;
@override@JsonKey() final  int totalElements;
@override@JsonKey() final  int totalPages;

/// Create a copy of MessagePage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessagePageCopyWith<_MessagePage> get copyWith => __$MessagePageCopyWithImpl<_MessagePage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessagePageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessagePage&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),page,size,totalElements,totalPages);

@override
String toString() {
  return 'MessagePage(content: $content, page: $page, size: $size, totalElements: $totalElements, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$MessagePageCopyWith<$Res> implements $MessagePageCopyWith<$Res> {
  factory _$MessagePageCopyWith(_MessagePage value, $Res Function(_MessagePage) _then) = __$MessagePageCopyWithImpl;
@override @useResult
$Res call({
 List<Message> content, int page, int size, int totalElements, int totalPages
});




}
/// @nodoc
class __$MessagePageCopyWithImpl<$Res>
    implements _$MessagePageCopyWith<$Res> {
  __$MessagePageCopyWithImpl(this._self, this._then);

  final _MessagePage _self;
  final $Res Function(_MessagePage) _then;

/// Create a copy of MessagePage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? page = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,}) {
  return _then(_MessagePage(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<Message>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
