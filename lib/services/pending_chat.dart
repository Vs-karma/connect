import 'package:flutter/foundation.dart';

/// A chat to open from a tapped notification.
@immutable
class PendingChatRoute {
  final String conversationId;
  final String? title;

  const PendingChatRoute(this.conversationId, this.title);
}

/// Holds a conversation to open from a notification tap. On a cold start the tap
/// arrives before the app is authenticated and the shell is built, so pushing the
/// thread immediately fails to load. Instead we stash it here and let MainShell
/// (which only exists once signed in) consume it when it's ready.
class PendingChat {
  PendingChat._();

  static final ValueNotifier<PendingChatRoute?> notifier = ValueNotifier(null);

  static void set(String conversationId, String? title) {
    notifier.value = PendingChatRoute(conversationId, title);
  }

  /// Returns and clears the pending route (null if none).
  static PendingChatRoute? take() {
    final v = notifier.value;
    notifier.value = null;
    return v;
  }
}
