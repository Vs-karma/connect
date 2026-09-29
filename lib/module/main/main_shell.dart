import 'package:connect/module/broadcast/presentation/broadcast_screen.dart';
import 'package:connect/module/broadcastlist/presentation/broadcast_lists_screen.dart';
import 'package:connect/module/catalog/presentation/store_browse_screen.dart';
import 'package:connect/module/chat/application/chat_providers.dart';
import 'package:connect/module/contact/presentation/contacts_screen.dart';
import 'package:connect/module/settings/presentation/profile_settings_screen.dart';
import 'package:connect/services/notification_controller.dart';
import 'package:connect/widgets/app_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The signed-in app shell. Home = Broadcast list, Settings = profile.
/// The middle "Broadcast" button starts a broadcast by selecting contacts.
class MainShell extends ConsumerStatefulWidget {
  const MainShell({super.key});

  @override
  ConsumerState<MainShell> createState() => _MainShellState();
}

class _MainShellState extends ConsumerState<MainShell> {
  int _tab = 0; // 0 = Home (chats), 1 = Store (marketplace), 2 = Settings

  static const _tabs = [BroadcastScreen(), StoreBrowseScreen(), ProfileSettingsScreen()];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(notificationControllerProvider.notifier).syncDevice();
    });
  }

  void _onNavTap(int navIndex) {
    if (navIndex == 2) {
      // "Broadcast" action → the user's broadcast lists (not a tab).
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const BroadcastListsScreen()),
      );
      return;
    }
    // navIndex 0 = Home, 1 = Store, 3 = Settings → tab 0/1/2
    setState(() => _tab = navIndex == 3 ? 2 : navIndex);
  }

  void _newChat() {
    // Home FAB → pick a contact to start a 1:1 chat (or invite if not on Mitra).
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ContactsScreen(asFlow: true)),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(chatRealtimeProvider); // live-refresh chat list + badge on incoming push
    final unread = ref.watch(unreadCountProvider).value ?? 0;
    return Scaffold(
      body: IndexedStack(index: _tab, children: _tabs),
      floatingActionButton: _tab == 0
          ? FloatingActionButton(
              onPressed: _newChat,
              child: const Icon(Icons.chat_bubble_outline),
            )
          : null,
      bottomNavigationBar: AppBottomNav(
        // tab 0/1/2 → nav slot 0 (Home) / 1 (Store) / 3 (Settings)
        currentIndex: _tab == 2 ? 3 : _tab,
        onTap: _onNavTap,
        homeBadge: unread,
      ),
    );
  }
}
