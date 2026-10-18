import 'dart:io';

import 'package:connect/app/app_nav.dart';
import 'package:connect/module/broadcast/data/broadcast_message.dart';
import 'package:connect/module/broadcast/presentation/widgets/attach_sheet.dart';
import 'package:connect/module/broadcast/presentation/widgets/message_bubble.dart';
import 'package:connect/module/catalog/presentation/widgets/product_card.dart';
import 'package:connect/module/chat/presentation/peer_profile_screen.dart';
import 'package:connect/module/chat/application/chat_providers.dart';
import 'package:connect/module/chat/data/chat_models.dart';
import 'package:connect/module/media/media_repository.dart';
import 'package:connect/services/active_chat.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

/// A 1:1 chat thread. Opens an existing conversation (conversationId) or starts a brand-new
/// chat (peerUserId, conversationId null) whose first message creates the conversation.
class ChatThreadScreen extends ConsumerStatefulWidget {
  final String? conversationId;
  final String? peerUserId; // required when starting a new chat
  final String peerName;
  final String? peerAvatarUrl;
  final String? peerPhone;
  final String? initialShareProductId; // auto-send this product as the opening message (Enquire)

  const ChatThreadScreen({
    super.key,
    this.conversationId,
    this.peerUserId,
    required this.peerName,
    this.peerAvatarUrl,
    this.peerPhone,
    this.initialShareProductId,
  });

  @override
  ConsumerState<ChatThreadScreen> createState() => _ChatThreadScreenState();
}

class _ChatThreadScreenState extends ConsumerState<ChatThreadScreen> {
  final _msgController = TextEditingController();
  final _media = MediaRepository();
  final _scroll = ScrollController();
  XFile? _pendingImage;
  bool _sending = false;
  String? _cid;

  @override
  void initState() {
    super.initState();
    _cid = widget.conversationId;
    if (_cid != null) ActiveChat.instance.enter(_cid!);
    _scroll.addListener(_onScroll);
    if (widget.initialShareProductId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _shareInitialProduct());
    }
  }

  Future<void> _shareInitialProduct() async {
    final productId = widget.initialShareProductId!;
    try {
      if (_cid == null) {
        final msg = await ref.read(chatRepositoryProvider).startChat(widget.peerUserId!, productId: productId);
        ref.invalidate(chatListProvider);
        ActiveChat.instance.enter(msg.conversationId);
        if (mounted) setState(() => _cid = msg.conversationId);
      } else {
        await _controller!.send(productId: productId);
      }
    } catch (_) {
      if (mounted) ScaffoldToast.showErrorBottom(context, 'Could not share. Try again.');
    }
  }

  @override
  void dispose() {
    if (_cid != null) ActiveChat.instance.leave(_cid!);
    _scroll.dispose();
    _msgController.dispose();
    super.dispose();
  }

  ThreadController? get _controller =>
      _cid == null ? null : ref.read(threadControllerProvider(_cid!));

  void _onScroll() {
    if (_cid == null) return;
    if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 200) {
      _controller?.loadOlder();
    }
  }

  Future<void> _attach() async {
    final file = await AttachSheet.show(context);
    if (file != null && mounted) setState(() => _pendingImage = file);
  }

  Future<void> _send() async {
    final text = _msgController.text.trim();
    if ((text.isEmpty && _pendingImage == null) || _sending) return;
    setState(() => _sending = true);
    try {
      String? mediaUrl;
      if (_pendingImage != null) {
        mediaUrl = await _media.uploadImage(_pendingImage!.path);
      }
      final body = text.isEmpty ? null : text;
      final mediaType = mediaUrl != null ? 'IMAGE' : null;

      if (_cid == null) {
        // First message of a brand-new chat — creates the conversation.
        final msg = await ref
            .read(chatRepositoryProvider)
            .startChat(widget.peerUserId!, body: body, mediaUrl: mediaUrl, mediaType: mediaType);
        ref.invalidate(chatListProvider);
        ActiveChat.instance.enter(msg.conversationId);
        if (mounted) setState(() => _cid = msg.conversationId);
      } else {
        await _controller!.send(body: body, mediaUrl: mediaUrl, mediaType: mediaType);
      }
      _msgController.clear();
      if (mounted) setState(() => _pendingImage = null);
    } catch (e) {
      if (mounted) ScaffoldToast.showErrorBottom(context, 'Could not send. Try again.');
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  Future<void> _onLongPress(Message m) async {
    if (!m.mine || m.deleted) return;
    final action = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: AppColors.card,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (m.body != null && m.mediaUrl == null && m.broadcastId == null)
              ListTile(
                leading: Icon(Icons.edit, color: AppColors.textPrimary),
                title: Text('Edit', style: AppTextStyles.style14px.w600),
                onTap: () => Navigator.pop(context, 'edit'),
              ),
            ListTile(
              leading: const Icon(Icons.delete_outline, color: Colors.redAccent),
              title: Text('Delete', style: AppTextStyles.style14px.w600),
              onTap: () => Navigator.pop(context, 'delete'),
            ),
          ],
        ),
      ),
    );
    if (action == 'edit') {
      await _editDialog(m);
    } else if (action == 'delete') {
      try {
        await _controller?.deleteMessage(m.id);
      } catch (_) {
        if (mounted) ScaffoldToast.showErrorBottom(context, 'Could not delete.');
      }
    }
  }

  Future<void> _editDialog(Message m) async {
    final controller = TextEditingController(text: m.body ?? '');
    final newText = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        title: Text('Edit message', style: AppTextStyles.style16px.w700),
        content: TextField(controller: controller, autofocus: true, maxLines: 4, minLines: 1),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, controller.text.trim()),
            child: Text('Save', style: AppTextStyles.style14px.w700.copyWith(color: AppColors.primary)),
          ),
        ],
      ),
    );
    if (newText != null && newText.isNotEmpty) {
      try {
        await _controller?.edit(m.id, newText);
      } catch (_) {
        if (mounted) ScaffoldToast.showErrorBottom(context, 'Edit failed (older than 10 min?).');
      }
    }
  }

  Future<void> _blockToggle(bool block) async {
    if (_cid == null) return;
    final repo = ref.read(chatRepositoryProvider);
    try {
      block ? await repo.block(_cid!) : await repo.unblock(_cid!);
      ref.invalidate(chatListProvider);
      _controller?.load();
    } catch (_) {
      if (mounted) ScaffoldToast.showErrorBottom(context, 'Action failed.');
    }
  }

  BroadcastMessage _toBubble(Message m) {
    final time = DateFormat('h:mm a').format(m.createdAt.toLocal());
    if (m.deleted) {
      return BroadcastMessage(text: 'This message was deleted', time: time, fromCustomer: !m.mine);
    }
    final text = m.body == null ? null : (m.edited ? '${m.body}  (edited)' : m.body);
    return BroadcastMessage(text: text, imageUrl: m.mediaUrl, time: time, fromCustomer: !m.mine);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffold,
        surfaceTintColor: AppColors.scaffold,
        elevation: 0,
        titleSpacing: 0,
        title: GestureDetector(
          onTap: widget.peerUserId == null ? null : _openPeerProfile,
          behavior: HitTestBehavior.opaque,
          child: Row(
            children: [
              UserAvatar(name: widget.peerName, imageUrl: widget.peerAvatarUrl, size: 34),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(widget.peerName,
                    maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.style18px.w700),
              ),
            ],
          ),
        ),
        actions: [
          if (_cid != null)
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: AppColors.textPrimary),
              color: AppColors.card,
              onSelected: (v) => _blockToggle(v == 'block'),
              itemBuilder: (_) => [
                PopupMenuItem(value: 'block', child: Text('Block', style: AppTextStyles.style14px.w600)),
                PopupMenuItem(value: 'unblock', child: Text('Unblock', style: AppTextStyles.style14px.w600)),
              ],
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _cid == null ? _newChatHint() : _messages()),
            if (_pendingImage != null) _pendingPreview(),
            _composer(l10n),
          ],
        ),
      ),
    );
  }

  void _openPeerProfile() {
    revealOrPush(
      context,
      profileRouteName(widget.peerUserId!),
      (_) => PeerProfileScreen(
        userId: widget.peerUserId!,
        name: widget.peerName,
        avatarUrl: widget.peerAvatarUrl,
        phone: widget.peerPhone,
      ),
    );
  }

  Widget _newChatHint() {
    return Center(
      child: Text('Send a message to start the chat',
          style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary)),
    );
  }

  Widget _messages() {
    final controller = ref.watch(threadControllerProvider(_cid!));
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final state = controller.state;
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(
            child: Text('Could not load messages',
                style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
          ),
          data: (messages) {
            if (messages.isEmpty) {
              return Center(
                child: Text('Say hi 👋',
                    style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary)),
              );
            }
            return ListView.builder(
              controller: _scroll,
              reverse: true,
              padding: EdgeInsets.all(16.w),
              itemCount: messages.length,
              itemBuilder: (_, i) {
                final m = messages[i];
                if (m.productId != null && !m.deleted) {
                  return Align(
                    alignment: m.mine ? Alignment.centerRight : Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: GestureDetector(
                        onLongPress: () => _onLongPress(m),
                        child: ProductChatCard(productId: m.productId!, mine: m.mine),
                      ),
                    ),
                  );
                }
                return GestureDetector(
                  onLongPress: () => _onLongPress(m),
                  child: MessageBubble(message: _toBubble(m)),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _pendingPreview() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 8.h),
      child: Align(
        alignment: Alignment.centerRight,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.file(File(_pendingImage!.path), width: 80.w, height: 80.w, fit: BoxFit.cover),
            ),
            Positioned(
              right: 2,
              top: 2,
              child: GestureDetector(
                onTap: () => setState(() => _pendingImage = null),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                  padding: const EdgeInsets.all(2),
                  child: const Icon(Icons.close, size: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _composer(l10n) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 6.h, 16.w, 10.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: AppColors.border),
        ),
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.attach_file, color: AppColors.textSecondary, size: 22.sp),
              onPressed: _attach,
            ),
            Expanded(
              child: TextField(
                controller: _msgController,
                style: AppTextStyles.style14px.w500,
                minLines: 1,
                maxLines: 4,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _send(),
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: l10n.sendMessage,
                  hintStyle: AppTextStyles.style14px.w400.copyWith(color: AppColors.textHint),
                ),
              ),
            ),
            IconButton(
              icon: _sending
                  ? SizedBox(width: 18.w, height: 18.w, child: const CircularProgressIndicator(strokeWidth: 2))
                  : Icon(Icons.send, color: AppColors.primary, size: 22.sp),
              onPressed: _sending ? null : _send,
            ),
          ],
        ),
      ),
    );
  }
}
