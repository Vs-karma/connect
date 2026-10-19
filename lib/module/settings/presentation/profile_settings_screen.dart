import 'package:connect/app/locale_controller.dart';
import 'package:connect/app/session_reset.dart';
import 'package:connect/module/auth/application/session_controller.dart';
import 'package:connect/module/broadcast/presentation/broadcast_history_screen.dart';
import 'package:connect/module/catalog/presentation/my_store_screen.dart';
import 'package:connect/module/profile/application/profile_providers.dart';
import 'package:connect/module/settings/application/settings_controller.dart';
import 'package:connect/module/settings/presentation/delete_account_screen.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/services/lock_service.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/utility/username_validator.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/section_title.dart';
import 'package:connect/widgets/setting_tiles.dart';
import 'package:connect/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// Profile + settings (the Settings tab). Toggles persist and take effect.
class ProfileSettingsScreen extends ConsumerStatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  ConsumerState<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends ConsumerState<ProfileSettingsScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Reflect real OS permission state once the screen is up.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(settingsControllerProvider.notifier).refreshPermissions();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Returning from system settings — re-sync the toggles with reality.
    if (state == AppLifecycleState.resumed) {
      ref.read(settingsControllerProvider.notifier).refreshPermissions();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final user = ref.watch(sessionControllerProvider).value;
    final profile = ref.watch(profileProvider).value;
    final displayName = profile?.name ?? user?.name;
    final settings = ref.watch(settingsControllerProvider);
    final ctrl = ref.read(settingsControllerProvider.notifier);
    final isHindi = ref.watch(localeControllerProvider).languageCode == 'hi';

    return Scaffold(
      appBar: CommonAppBar(title: l10n.appName, showBack: false),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 24.h),
          children: [
            Center(child: _avatar(profile?.avatarUrl, displayName)),
            SizedBox(height: 24.h),
            SectionTitle(l10n.details),
            SizedBox(height: 12.h),
            GestureDetector(
              onTap: () => _editName(displayName),
              child: InfoCard(label: l10n.nameLabel, value: displayName ?? '—'),
            ),
            SizedBox(height: 12.h),
            InfoCard(label: l10n.phoneNumberLabel, value: user?.phone ?? '—'),
            SizedBox(height: 24.h),
            SectionTitle(l10n.settings),
            SizedBox(height: 12.h),
            _settingsCard(l10n, settings, ctrl),
            SizedBox(height: 16.h),
            SettingLinkTile(
              title: l10n.myStore,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const MyStoreScreen()),
              ),
            ),
            SizedBox(height: 12.h),
            SettingLinkTile(
              title: 'My Broadcasts',
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const BroadcastHistoryScreen()),
              ),
            ),
            SizedBox(height: 12.h),
            SettingLinkTile(title: l10n.helpFeedback, onTap: _openFeedback),
            SizedBox(height: 12.h),
            SettingLinkTile(title: l10n.shareInvite, onTap: _shareInvite),
            SizedBox(height: 12.h),
            SettingLinkTile(
              title: '${l10n.changeLanguage} (अ/A)',
              onTap: () => ref.read(localeControllerProvider.notifier).toggle(),
              trailing: Text(isHindi ? 'हिंदी' : 'EN',
                  style: AppTextStyles.style14px.w700.copyWith(color: AppColors.primary)),
            ),
            SizedBox(height: 24.h),
            Center(
              child: GestureDetector(
                onTap: () async {
                  // Clear the session state (also clears tokens + tells the backend),
                  // wipe every user-scoped provider cache so the next login starts
                  // clean, then pop back to the root so AuthGate rebuilds to login.
                  await ref.read(sessionControllerProvider.notifier).logout();
                  clearUserScopedState(ref);
                  if (context.mounted) {
                    Navigator.of(context).popUntil((r) => r.isFirst);
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(l10n.logout,
                        style: AppTextStyles.style16px.w700.copyWith(color: AppColors.primary)),
                    SizedBox(width: 6.w),
                    Icon(Icons.arrow_forward, color: AppColors.primary, size: 18.sp),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18.h),
            Center(
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const DeleteAccountScreen()),
                ),
                child: Text(l10n.deleteAccount,
                    style: AppTextStyles.style14px.w600.copyWith(color: AppColors.danger)),
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: Text('v 1.0.0 (1)',
                  style: AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatar(String? avatarUrl, String? name) {
    return GestureDetector(
      onTap: _pickAvatar,
      child: Stack(
        children: [
          UserAvatar(name: name ?? '?', imageUrl: avatarUrl, size: 92),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.scaffold, width: 2),
              ),
              child: Icon(Icons.edit, size: 14.sp, color: AppColors.onPrimary),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickAvatar() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      maxWidth: 1080,
    );
    if (picked == null) return;
    try {
      await ref.read(profileRepositoryProvider).uploadAvatar(picked.path);
      ref.invalidate(profileProvider);
    } catch (_) {
      if (mounted) ScaffoldToast.showErrorBottom(context, 'Could not update photo.');
    }
  }

  Future<void> _editName(String? current) async {
    final controller = TextEditingController(text: current ?? '');
    final l10n = context.l10n;
    String? error;
    final name = await showDialog<String>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setLocal) => AlertDialog(
          backgroundColor: AppColors.card,
          title: Text(l10n.nameLabel, style: AppTextStyles.style16px.w700),
          content: TextField(
            controller: controller,
            autofocus: true,
            maxLength: kUsernameMax,
            inputFormatters: [usernameInputFormatter],
            decoration: InputDecoration(
              errorText: error,
              helperText: l10n.nameInvalidChars,
              helperMaxLines: 2,
            ),
            onChanged: (_) {
              if (error != null) setLocal(() => error = null);
            },
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.cancel)),
            TextButton(
              onPressed: () {
                final value = controller.text.trim();
                final code = usernameError(value);
                if (code != null) {
                  setLocal(() => error = _nameErrorMessage(code, l10n));
                  return;
                }
                Navigator.pop(ctx, value);
              },
              child: Text(l10n.save, style: AppTextStyles.style14px.w700.copyWith(color: AppColors.primary)),
            ),
          ],
        ),
      ),
    );
    if (name == null || name.isEmpty) return;
    try {
      await ref.read(profileRepositoryProvider).updateName(name);
      await ref.read(sessionControllerProvider.notifier).refreshUser();
      ref.invalidate(profileProvider);
    } catch (_) {
      if (mounted) ScaffoldToast.showErrorBottom(context, 'Could not update name.');
    }
  }

  String? _nameErrorMessage(String code, l10n) {
    switch (code) {
      case 'empty':
        return l10n.nameRequired;
      case 'short':
        return l10n.nameTooShort;
      case 'long':
        return l10n.nameTooLong;
      case 'start':
        return l10n.nameInvalidStart;
      case 'chars':
        return l10n.nameInvalidChars;
    }
    return null;
  }

  Widget _settingsCard(l10n, SettingsState s, SettingsController ctrl) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: [
          SettingToggleTile(
            title: l10n.contactPermission,
            subtitle: l10n.contactPermissionDesc,
            value: s.contactPermission,
            onChanged: (v) => _togglePermission(
              enable: v,
              permission: Permission.contacts,
              title: l10n.contactPermission,
            ),
          ),
          SettingToggleTile(
            title: l10n.notificationPermission,
            subtitle: l10n.notificationPermissionDesc,
            value: s.notificationPermission,
            onChanged: (v) => _togglePermission(
              enable: v,
              permission: Permission.notification,
              title: l10n.notificationPermission,
            ),
          ),
          SettingToggleTile(
            title: l10n.appLock,
            subtitle: l10n.appLockDesc,
            value: s.appLock,
            onChanged: (v) async {
              if (v) {
                final ok = await ref.read(lockServiceProvider).isSupported();
                if (!ok) {
                  if (mounted) _snack(l10n.appLockUnavailable);
                  return;
                }
              }
              await ctrl.setAppLock(v);
            },
          ),
          SettingToggleTile(
            title: l10n.darkTheme,
            value: s.darkTheme,
            onChanged: (v) => ctrl.setDarkTheme(v),
          ),
        ],
      ),
    );
  }

  /// Drives the real OS permission dialog / App Settings, then re-syncs the toggle.
  Future<void> _togglePermission({
    required bool enable,
    required Permission permission,
    required String title,
  }) async {
    final ctrl = ref.read(settingsControllerProvider.notifier);
    final status = await permission.status;

    if (enable) {
      if (status.isGranted || status.isLimited) {
        // already on, nothing to do
      } else if (status.isPermanentlyDenied || status.isRestricted) {
        await _openSettingsDialog(title);
      } else {
        final result = await permission.request();
        // Still blocked after a hard "Don't allow" → point to App Settings.
        if (result.isPermanentlyDenied && mounted) await _openSettingsDialog(title);
      }
    } else {
      // Apps can't revoke a granted permission — only the OS can.
      await _openSettingsDialog(title);
    }

    await ctrl.refreshPermissions();
  }

  Future<void> _openSettingsDialog(String title) async {
    final l10n = context.l10n;
    final go = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(title, style: AppTextStyles.style16px.w700),
        content: Text(l10n.permissionSettingsHint,
            style: AppTextStyles.style14px.w400.copyWith(color: AppColors.textSecondary)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel,
                style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textSecondary)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.openSettings,
                style: AppTextStyles.style14px.w700.copyWith(color: AppColors.primary)),
          ),
        ],
      ),
    );
    if (go == true) await openAppSettings();
  }

  void _snack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _openFeedback() async {
    final uri = Uri.parse(
        'mailto:support@mitra.app?subject=${Uri.encodeComponent('Mitra App Feedback')}');
    try {
      final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!ok && mounted) _snack('support@mitra.app');
    } catch (_) {
      if (mounted) _snack('support@mitra.app');
    }
  }

  Future<void> _shareInvite() async {
    try {
      await SharePlus.instance.share(
        ShareParams(
          text: 'I use Connect to get instant updates from my shop. Join me: https://connect-messenger.com',
        ),
      );
    } catch (_) {}
  }
}
