import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_models.freezed.dart';
part 'chat_models.g.dart';

/// A single message in a 1:1 conversation (mirrors backend MessageResponse).
@freezed
abstract class Message with _$Message {
  const factory Message({
    required String id,
    required String conversationId,
    String? senderId,
    @Default(false) bool mine,
    String? body,
    String? mediaUrl,
    String? mediaType,
    @JsonKey(name: 'mediaDurationMs') int? durationMs,
    String? broadcastId,
    String? productId,
    required String status,
    @Default(false) bool deleted,
    @Default(false) bool edited,
    required DateTime createdAt,
    DateTime? editedAt,
    DateTime? readAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}

/// A chat-list row: the other participant + last message + my unread count.
@freezed
abstract class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    required String peerUserId,
    String? peerName,
    String? peerAvatarUrl,
    String? peerPhone,
    String? lastMessagePreview,
    @Default(false) bool lastMessageMine,
    DateTime? lastMessageAt,
    @Default(0) int unreadCount,
    required String status,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) => _$ConversationFromJson(json);
}

@freezed
abstract class ConversationPage with _$ConversationPage {
  const factory ConversationPage({
    @Default(<Conversation>[]) List<Conversation> content,
    @Default(0) int page,
    @Default(0) int size,
    @Default(0) int totalElements,
    @Default(0) int totalPages,
  }) = _ConversationPage;

  factory ConversationPage.fromJson(Map<String, dynamic> json) => _$ConversationPageFromJson(json);
}

@freezed
abstract class MessagePage with _$MessagePage {
  const factory MessagePage({
    @Default(<Message>[]) List<Message> content,
    @Default(0) int page,
    @Default(0) int size,
    @Default(0) int totalElements,
    @Default(0) int totalPages,
  }) = _MessagePage;

  factory MessagePage.fromJson(Map<String, dynamic> json) => _$MessagePageFromJson(json);
}
