import 'package:connect/module/chat/data/chat_models.dart';
import 'package:connect/network/api_controller.dart';
import 'package:connect/network/end_points.dart';

/// Talks to the 1:1 chat API. Throws ApiException on failure (handled by ApiController).
class ChatRepository {
  final ApiController _api = ApiController.instance;

  Future<ConversationPage> conversations({int page = 0, int size = 20}) async {
    final res = await _api.get(EndPoints.CONVERSATIONS, queryParameters: {'page': page, 'size': size});
    return ConversationPage.fromJson(res.data as Map<String, dynamic>);
  }

  Future<int> unreadCount() async {
    final res = await _api.get(EndPoints.CONVERSATIONS_UNREAD);
    return (res.data as Map<String, dynamic>)['unread'] as int? ?? 0;
  }

  Future<MessagePage> messages(String conversationId, {DateTime? before, int page = 0, int size = 30}) async {
    final res = await _api.get(
      EndPoints.conversationMessages(conversationId),
      queryParameters: {
        'page': page,
        'size': size,
        if (before != null) 'before': before.toUtc().toIso8601String(),
      },
    );
    return MessagePage.fromJson(res.data as Map<String, dynamic>);
  }

  /// Start (or continue) a chat with a user and send the first/next message.
  Future<Message> startChat(
    String otherUserId, {
    String? body,
    String? mediaUrl,
    String? mediaType,
    int? mediaDurationMs,
    String? productId,
    String? clientMessageId,
  }) async {
    final res = await _api.post(
      EndPoints.startChatWith(otherUserId),
      body: _messageBody(body, mediaUrl, mediaType, mediaDurationMs, productId, clientMessageId),
    );
    return Message.fromJson(res.data as Map<String, dynamic>);
  }

  /// Send a message into an existing conversation.
  Future<Message> sendMessage(
    String conversationId, {
    String? body,
    String? mediaUrl,
    String? mediaType,
    int? mediaDurationMs,
    String? productId,
    String? clientMessageId,
  }) async {
    final res = await _api.post(
      EndPoints.conversationMessages(conversationId),
      body: _messageBody(body, mediaUrl, mediaType, mediaDurationMs, productId, clientMessageId),
    );
    return Message.fromJson(res.data as Map<String, dynamic>);
  }

  Future<void> markRead(String conversationId) async {
    await _api.post(EndPoints.conversationRead(conversationId));
  }

  Future<Message> editMessage(String conversationId, String messageId, String body) async {
    final res = await _api.patch(
      EndPoints.conversationMessage(conversationId, messageId),
      body: {'body': body},
    );
    return Message.fromJson(res.data as Map<String, dynamic>);
  }

  Future<Message> deleteMessage(String conversationId, String messageId) async {
    final res = await _api.delete(EndPoints.conversationMessage(conversationId, messageId));
    return Message.fromJson(res.data as Map<String, dynamic>);
  }

  Future<void> block(String conversationId) async {
    await _api.post(EndPoints.conversationBlock(conversationId));
  }

  Future<void> unblock(String conversationId) async {
    await _api.post(EndPoints.conversationUnblock(conversationId));
  }

  Map<String, dynamic> _messageBody(String? body, String? mediaUrl, String? mediaType,
      int? mediaDurationMs, String? productId, String? clientMessageId) {
    return {
      if (body != null && body.isNotEmpty) 'body': body,
      if (mediaUrl != null && mediaUrl.isNotEmpty) 'mediaUrl': mediaUrl,
      if (mediaType != null && mediaType.isNotEmpty) 'mediaType': mediaType,
      if (mediaDurationMs != null) 'mediaDurationMs': mediaDurationMs,
      if (productId != null && productId.isNotEmpty) 'productId': productId,
      if (clientMessageId != null) 'clientMessageId': clientMessageId,
    };
  }
}
