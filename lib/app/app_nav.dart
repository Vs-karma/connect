import 'package:flutter/material.dart';

/// Identity-aware navigation for the store ↔ product ↔ chat loop.
///
/// Each of these screens is pushed with a stable route name encoding its ID
/// (e.g. `store:<catalogId>`). [AppRouteObserver] keeps a live count of those
/// names in the current stack, so instead of pushing a duplicate we can jump
/// BACK to the copy already open. This keeps the back stack small and makes
/// Back retrace only the unique screens the user actually visited.

/// Route name builders (the prefix is what makes a screen "the same place").
String storeRouteName(String catalogId) => 'store:$catalogId';
String productRouteName(String productId) => 'product:$productId';
String chatRouteName(String key) => 'chat:$key';
String profileRouteName(String userId) => 'profile:$userId';

bool _isChatName(String? name) => name != null && name.startsWith('chat:');

/// Tracks which of our named routes are currently in the stack.
class AppRouteObserver extends NavigatorObserver {
  final Map<String, int> _live = {};

  bool isLive(String name) => (_live[name] ?? 0) > 0;

  void _add(Route? route) {
    final name = route?.settings.name;
    if (name == null) return;
    _live[name] = (_live[name] ?? 0) + 1;
  }

  void _remove(Route? route) {
    final name = route?.settings.name;
    if (name == null) return;
    final n = (_live[name] ?? 0) - 1;
    if (n <= 0) {
      _live.remove(name);
    } else {
      _live[name] = n;
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) => _add(route);

  @override
  void didPop(Route route, Route? previousRoute) => _remove(route);

  @override
  void didRemove(Route route, Route? previousRoute) => _remove(route);

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _remove(oldRoute);
    _add(newRoute);
  }
}

/// The single observer instance, wired into MaterialApp.navigatorObservers.
final appRouteObserver = AppRouteObserver();

MaterialPageRoute<T> _named<T>(String name, WidgetBuilder builder) =>
    MaterialPageRoute<T>(settings: RouteSettings(name: name), builder: builder);

/// If a screen with [name] is already open, pop back to it; otherwise push it.
/// Use for Store and Product so looping between them never stacks duplicates.
void revealOrPush(BuildContext context, String name, WidgetBuilder builder) {
  final nav = Navigator.of(context);
  if (appRouteObserver.isLive(name)) {
    nav.popUntil(ModalRoute.withName(name));
  } else {
    nav.push(_named(name, builder));
  }
}

/// Open a chat from "Enquire": if a chat with this peer is already open,
/// reveal it (dropping the store/product screens above it). Otherwise collapse
/// the whole browsing excursion — remove everything down to the first route —
/// and place the chat there, so Back from the chat goes home, not back through
/// the product/store trail.
void openEnquiryChat(BuildContext context, String name, WidgetBuilder builder) {
  final nav = Navigator.of(context);
  if (appRouteObserver.isLive(name)) {
    nav.popUntil(ModalRoute.withName(name));
  } else {
    nav.pushAndRemoveUntil(_named(name, builder), (r) => r.isFirst);
  }
}

/// Open a chat from the chat list (or anywhere that's a normal push). Reveals
/// an existing thread for the same peer instead of stacking a second copy.
void pushOrRevealChat(BuildContext context, String name, WidgetBuilder builder) =>
    revealOrPush(context, name, builder);
