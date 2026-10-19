// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  id: json['id'] as String,
  conversationId: json['conversationId'] as String,
  senderId: json['senderId'] as String?,
  mine: json['mine'] as bool? ?? false,
  body: json['body'] as String?,
  mediaUrl: json['mediaUrl'] as String?,
  mediaType: json['mediaType'] as String?,
  durationMs: (json['mediaDurationMs'] as num?)?.toInt(),
  broadcastId: json['broadcastId'] as String?,
  productId: json['productId'] as String?,
  status: json['status'] as String,
  deleted: json['deleted'] as bool? ?? false,
  edited: json['edited'] as bool? ?? false,
  createdAt: DateTime.parse(json['createdAt'] as String),
  editedAt: json['editedAt'] == null
      ? null
      : DateTime.parse(json['editedAt'] as String),
  readAt: json['readAt'] == null
      ? null
      : DateTime.parse(json['readAt'] as String),
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'id': instance.id,
  'conversationId': instance.conversationId,
  'senderId': instance.senderId,
  'mine': instance.mine,
  'body': instance.body,
  'mediaUrl': instance.mediaUrl,
  'mediaType': instance.mediaType,
  'mediaDurationMs': instance.durationMs,
  'broadcastId': instance.broadcastId,
  'productId': instance.productId,
  'status': instance.status,
  'deleted': instance.deleted,
  'edited': instance.edited,
  'createdAt': instance.createdAt.toIso8601String(),
  'editedAt': instance.editedAt?.toIso8601String(),
  'readAt': instance.readAt?.toIso8601String(),
};

_Conversation _$ConversationFromJson(Map<String, dynamic> json) =>
    _Conversation(
      id: json['id'] as String,
      peerUserId: json['peerUserId'] as String,
      peerName: json['peerName'] as String?,
      peerAvatarUrl: json['peerAvatarUrl'] as String?,
      peerPhone: json['peerPhone'] as String?,
      lastMessagePreview: json['lastMessagePreview'] as String?,
      lastMessageMine: json['lastMessageMine'] as bool? ?? false,
      lastMessageAt: json['lastMessageAt'] == null
          ? null
          : DateTime.parse(json['lastMessageAt'] as String),
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
      status: json['status'] as String,
    );

Map<String, dynamic> _$ConversationToJson(_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'peerUserId': instance.peerUserId,
      'peerName': instance.peerName,
      'peerAvatarUrl': instance.peerAvatarUrl,
      'peerPhone': instance.peerPhone,
      'lastMessagePreview': instance.lastMessagePreview,
      'lastMessageMine': instance.lastMessageMine,
      'lastMessageAt': instance.lastMessageAt?.toIso8601String(),
      'unreadCount': instance.unreadCount,
      'status': instance.status,
    };

_ConversationPage _$ConversationPageFromJson(Map<String, dynamic> json) =>
    _ConversationPage(
      content:
          (json['content'] as List<dynamic>?)
              ?.map((e) => Conversation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Conversation>[],
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 0,
      totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ConversationPageToJson(_ConversationPage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'page': instance.page,
      'size': instance.size,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
    };

_MessagePage _$MessagePageFromJson(Map<String, dynamic> json) => _MessagePage(
  content:
      (json['content'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Message>[],
  page: (json['page'] as num?)?.toInt() ?? 0,
  size: (json['size'] as num?)?.toInt() ?? 0,
  totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$MessagePageToJson(_MessagePage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'page': instance.page,
      'size': instance.size,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
    };
