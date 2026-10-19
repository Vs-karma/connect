import 'dart:async';

import 'package:connect/module/auth/application/session_controller.dart';
import 'package:connect/module/chat/data/chat_models.dart';
import 'package:connect/module/chat/data/chat_repository.dart';
import 'package:connect/services/notification_controller.dart';
import 'package:connect/services/push_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) => ChatRepository());

/// The signed-in user's chat list (WhatsApp-style), newest activity first.
final chatListProvider =
    AsyncNotifierProvider<ChatListController, List<Conversation>>(ChatListController.new);

class ChatListController extends AsyncNotifier<List<Conversation>> {
  @override
  Future<List<Conversation>> build() async {
    final page = await ref.read(chatRepositoryProvider).conversations(page: 0, size: 50);
    return page.content;
  }

  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async =>
        (await ref.read(chatRepositoryProvider).conversations(page: 0, size: 50)).content);
  }

  /// Refresh without flashing the loading spinner (used on incoming push).
  Future<void> refreshSilently() async {
    try {
      final page = await ref.read(chatRepositoryProvider).conversations(page: 0, size: 50);
      state = AsyncData(page.content);
    } catch (_) {/* keep current */}
  }
}

/// Total unread badge.
final unreadCountProvider = FutureProvider<int>((ref) {
  return ref.read(chatRepositoryProvider).unreadCount();
});

/// Listens to foreground pushes and live-refreshes the chat list + unread badge.
/// Activate by watching it once (e.g. in the shell).
final chatRealtimeProvider = Provider<void>((ref) {
  final push = ref.read(pushServiceProvider);
  final sub = push.onIncoming.listen((_) {
    ref.invalidate(unreadCountProvider);
    ref.read(chatListProvider.notifier).refreshSilently();
  });
  ref.onDispose(sub.cancel);
});

/// One thread controller per conversationId. Holds paged messages (newest-first) and
/// supports optimistic send, load-older, edit and delete. Exposed via a family provider.
final threadControllerProvider =
    Provider.autoDispose.family<ThreadController, String>((ref, conversationId) {
  final controller = ThreadController(ref, conversationId);
  ref.onDispose(controller.dispose);
  controller.load();
  return controller;
});

class ThreadController extends ChangeNotifier {
  ThreadController(this._ref, this._cid);

  final Ref _ref;
  final String _cid;
  static const _uuid = Uuid();
  StreamSubscription<Map<String, dynamic>>? _pushSub;
  Timer? _poll;

  AsyncValue<List<Message>> state = const AsyncValue.loading();

  ChatRepository get _repo => _ref.read(chatRepositoryProvider);
  List<Message> get _current => state.value ?? const [];

  Future<void> load() async {
    // Live-refresh when a push arrives for THIS conversation.
    _pushSub ??= _ref.read(pushServiceProvider).onIncoming.listen((data) {
      if (data['conversationId'] == _cid) _refreshSilently();
    });
    // Poll while the thread is open, so it stays live even without push (or if notifications
    // are denied / delayed). Cancelled on dispose when the thread closes.
    _poll ??= Timer.periodic(const Duration(seconds: 5), (_) => _refreshSilently());
    state = const AsyncValue.loading();
    notifyListeners();
    state = await AsyncValue.guard(() async {
      final page = await _repo.messages(_cid, page: 0, size: 30);
      _markRead();
      return page.content;
    });
    notifyListeners();
  }

  Future<void> _refreshSilently() async {
    try {
      final page = await _repo.messages(_cid, page: 0, size: 30);
      _markRead();
      // Keep any in-flight optimistic messages (not yet acked by the server) on top.
      final pending = _current.where((m) => m.id.startsWith('temp-')).toList();
      _set([...pending, ...page.content]);
    } catch (_) {/* keep current */}
  }

  /// Mark read, then refresh the chat list + unread badge so they reflect it.
  void _markRead() {
    _repo.markRead(_cid).then((_) {
      _ref.read(chatListProvider.notifier).refreshSilently();
      _ref.invalidate(unreadCountProvider);
    }).catchError((_) {});
  }

  @override
  void dispose() {
    _pushSub?.cancel();
    _poll?.cancel();
    super.dispose();
  }

  /// Optimistically prepend a message, then reconcile with the server response.
  Future<void> send(
      {String? body,
      String? mediaUrl,
      String? mediaType,
      int? mediaDurationMs,
      String? productId}) async {
    final me = _ref.read(sessionControllerProvider).value?.id;
    final clientId = _uuid.v4();
    final temp = Message(
      id: 'temp-$clientId',
      conversationId: _cid,
      senderId: me,
      mine: true,
      body: body,
      mediaUrl: mediaUrl,
      mediaType: mediaType,
      durationMs: mediaDurationMs,
      productId: productId,
      status: 'SENDING',
      createdAt: DateTime.now(),
    );
    _set([temp, ..._current]);
    try {
      final saved = await _repo.sendMessage(_cid,
          body: body,
          mediaUrl: mediaUrl,
          mediaType: mediaType,
          mediaDurationMs: mediaDurationMs,
          productId: productId,
          clientMessageId: clientId);
      _replace(temp.id, saved);
      _ref.invalidate(chatListProvider);
    } catch (e) {
      _replace(temp.id, temp.copyWith(status: 'FAILED'));
      rethrow;
    }
  }

  Future<void> loadOlder() async {
    final current = _current;
    if (current.isEmpty) return;
    final page = await _repo.messages(_cid, before: current.last.createdAt, page: 0, size: 30);
    if (page.content.isNotEmpty) {
      _set([...current, ...page.content]);
    }
  }

  Future<void> edit(String messageId, String body) async {
    final updated = await _repo.editMessage(_cid, messageId, body);
    _replace(messageId, updated);
    _ref.invalidate(chatListProvider);
  }

  Future<void> deleteMessage(String messageId) async {
    final updated = await _repo.deleteMessage(_cid, messageId);
    _replace(messageId, updated);
    _ref.invalidate(chatListProvider);
  }

  void _set(List<Message> list) {
    state = AsyncValue.data(list);
    notifyListeners();
  }

  void _replace(String id, Message m) {
    _set([for (final x in _current) x.id == id ? m : x]);
  }
}
