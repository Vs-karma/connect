import 'dart:async';
import 'dart:convert';

import 'package:connect/services/active_chat.dart';
import 'package:connect/services/pending_chat.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Wraps FCM + local notifications: permission, token, showing notifications while the app is
/// foregrounded, and routing a tapped MESSAGE notification into the right chat thread.
class PushService {
  final FirebaseMessaging _fm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _local = FlutterLocalNotificationsPlugin();

  /// Emits the data payload of foreground MESSAGE/BROADCAST pushes so the chat list and
  /// the open thread can refresh live.
  final StreamController<Map<String, dynamic>> _incoming = StreamController.broadcast();
  Stream<Map<String, dynamic>> get onIncoming => _incoming.stream;

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'mitra_broadcasts',
    'Messages',
    description: 'Chat messages and broadcasts',
    importance: Importance.high,
  );

  Future<void> init() async {
    await _local.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse: _onLocalTap,
    );
    await _local
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);
    await _fm.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

    FirebaseMessaging.onMessage.listen(_showForeground);
    // App in background and the user taps the notification.
    FirebaseMessaging.onMessageOpenedApp.listen((m) => _route(m.data, m.notification?.title));
    // App was terminated and launched by tapping the notification.
    final initial = await _fm.getInitialMessage();
    if (initial != null) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _route(initial.data, initial.notification?.title));
    }
  }

  /// Ask for notification permission. Returns true if granted/provisional.
  Future<bool> requestPermission() async {
    final settings = await _fm.requestPermission(alert: true, badge: true, sound: true);
    return settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
  }

  Future<String?> getToken() => _fm.getToken();

  Stream<String> get onTokenRefresh => _fm.onTokenRefresh;

  void _showForeground(RemoteMessage message) {
    final type = message.data['type'];
    if (type == 'MESSAGE' || type == 'BROADCAST') {
      _incoming.add(message.data);
    }
    // Suppress the notification for the conversation the user is currently viewing
    // (the message shows up live in the thread instead).
    if (type == 'MESSAGE' && ActiveChat.instance.isOpen(message.data['conversationId'] as String?)) {
      return;
    }
    final n = message.notification;
    if (n == null) return;
    _local.show(
      n.hashCode,
      n.title,
      n.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      // carry the routing data + title so a tap can open the thread
      payload: jsonEncode({...message.data, '_title': n.title ?? ''}),
    );
  }

  void _onLocalTap(NotificationResponse response) {
    final raw = response.payload;
    if (raw == null || raw.isEmpty) return;
    try {
      final data = jsonDecode(raw) as Map<String, dynamic>;
      _route(data, data['_title'] as String?);
    } catch (_) {}
  }

  /// Queue the conversation for a tapped MESSAGE notification. MainShell opens it
  /// once the app is signed in and ready (avoids a cold-start load failure).
  void _route(Map<String, dynamic> data, String? title) {
    if (data['type'] != 'MESSAGE') return;
    final cid = data['conversationId'] as String?;
    if (cid == null || cid.isEmpty) return;
    PendingChat.set(cid, title);
  }
}
