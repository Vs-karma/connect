import 'package:connect/app/app_nav.dart';
import 'package:connect/module/chat/application/chat_providers.dart';
import 'package:connect/module/chat/presentation/chat_thread_screen.dart';
import 'package:connect/module/chat/presentation/widgets/conversation_tile.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/app_search_field.dart';
import 'package:connect/widgets/skeletons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

/// Home = the user's chat list (WhatsApp-style). Tapping a row opens the thread.
class BroadcastScreen extends ConsumerStatefulWidget {
  const BroadcastScreen({super.key});

  @override
  ConsumerState<BroadcastScreen> createState() => _BroadcastScreenState();
}

class _BroadcastScreenState extends ConsumerState<BroadcastScreen> with WidgetsBindingObserver {
  String _query = '';
  bool _notifGranted = true; // assume granted until checked, to avoid a flash

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkNotifPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Re-check when returning from system/app settings so the banner disappears
    // the moment notifications are turned on.
    if (state == AppLifecycleState.resumed) _checkNotifPermission();
  }

  Future<void> _checkNotifPermission() async {
    final granted = await Permission.notification.isGranted;
    if (mounted && granted != _notifGranted) {
      setState(() => _notifGranted = granted);
    }
  }

  Future<void> _enableNotifications() async {
    final status = await Permission.notification.request();
    if (status.isPermanentlyDenied || status.isRestricted) {
      await openAppSettings(); // user blocked it before — send them to settings
    }
    await _checkNotifPermission();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final chats = ref.watch(chatListProvider);

    return Scaffold(
      appBar: CommonAppBar(title: l10n.connections, showBack: false),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 8.h),
              child: AppSearchField(
                hintText: l10n.searchByNameNumber,
                onChanged: (v) => setState(() => _query = v),
              ),
            ),
            if (!_notifGranted) _notifBanner(l10n),
            Expanded(
              child: chats.when(
                loading: () => const ChatListSkeleton(),
                error: (e, _) => _errorState(e),
                data: (all) {
                  if (all.isEmpty) return _emptyState(l10n);
                  final filtered = _query.isEmpty
                      ? all
                      : all.where((c) {
                          final n = (c.peerName ?? c.peerPhone ?? '').toLowerCase();
                          return n.contains(_query.toLowerCase());
                        }).toList();
                  return RefreshIndicator(
                    onRefresh: () => ref.read(chatListProvider.notifier).reload(),
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                      itemCount: filtered.length,
                      itemBuilder: (_, i) {
                        final c = filtered[i];
                        return ConversationTile(
                          conversation: c,
                          onTap: () => pushOrRevealChat(
                            context,
                            chatRouteName(c.peerUserId ?? c.id),
                            (_) => ChatThreadScreen(
                              conversationId: c.id,
                              peerUserId: c.peerUserId,
                              peerName: c.peerName ?? c.peerPhone ?? 'Chat',
                              peerAvatarUrl: c.peerAvatarUrl,
                              peerPhone: c.peerPhone,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Persistent reminder (no dismiss): without notifications there's no realtime
  /// delivery, so it stays until the user turns them on.
  Widget _notifBanner(l10n) {
    final tint = AppColors.primary.withValues(alpha: 0.10);
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 2.h, 20.w, 8.h),
      child: InkWell(
        onTap: _enableNotifications,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(color: tint, borderRadius: BorderRadius.circular(16.r)),
          child: Row(
            children: [
              // Bell doodle with a little "missed alert" dot.
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 44.w,
                    height: 44.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(13.r)),
                    child: Icon(Icons.notifications_active_outlined,
                        color: AppColors.primary, size: 24.sp),
                  ),
                  Positioned(
                    right: 6.w,
                    top: 6.h,
                    child: Container(
                      width: 9.w,
                      height: 9.w,
                      decoration: BoxDecoration(
                        color: AppColors.danger,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.card, width: 1.5),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: l10n.notifNudgePrefix,
                          style: AppTextStyles.style13px.w500.copyWith(color: AppColors.textPrimary)),
                      TextSpan(
                          text: l10n.notifNudgeKeyword,
                          style: AppTextStyles.style13px.w700.copyWith(color: AppColors.primary)),
                      TextSpan(
                          text: l10n.notifNudgeSuffix,
                          style: AppTextStyles.style13px.w500.copyWith(color: AppColors.textPrimary)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                    color: AppColors.primary, borderRadius: BorderRadius.circular(10.r)),
                child: Text(l10n.enableNotifs,
                    style: AppTextStyles.style12px.w700.copyWith(color: AppColors.onPrimary)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyState(l10n) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.chat_bubble_outline, size: 96.sp, color: AppColors.border),
          SizedBox(height: 16.h),
          Text(l10n.noConnectionsYet,
              style: AppTextStyles.style16px.w700.copyWith(color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _errorState(Object e) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48.sp, color: AppColors.textSecondary),
            SizedBox(height: 12.h),
            Text(context.l10n.couldNotLoadChats,
                style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary),
                textAlign: TextAlign.center),
            SizedBox(height: 12.h),
            TextButton(
              onPressed: () => ref.invalidate(chatListProvider),
              child: Text(context.l10n.retry, style: AppTextStyles.style14px.w700.copyWith(color: AppColors.primary)),
            ),
          ],
        ),
      ),
    );
  }
}
