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

/// Home = the user's chat list (WhatsApp-style). Tapping a row opens the thread.
class BroadcastScreen extends ConsumerStatefulWidget {
  const BroadcastScreen({super.key});

  @override
  ConsumerState<BroadcastScreen> createState() => _BroadcastScreenState();
}

class _BroadcastScreenState extends ConsumerState<BroadcastScreen> {
  String _query = '';

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
                      itemBuilder: (_, i) => ConversationTile(
                        conversation: filtered[i],
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ChatThreadScreen(
                              conversationId: filtered[i].id,
                              peerUserId: filtered[i].peerUserId,
                              peerName: filtered[i].peerName ?? filtered[i].peerPhone ?? 'Chat',
                              peerAvatarUrl: filtered[i].peerAvatarUrl,
                              peerPhone: filtered[i].peerPhone,
                            ),
                          ),
                        ),
                      ),
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
