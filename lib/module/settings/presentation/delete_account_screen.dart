import 'package:connect/app/session_reset.dart';
import 'package:connect/module/auth/application/session_controller.dart';
import 'package:connect/module/profile/application/profile_providers.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Asks why the user is leaving (optional), then permanently deletes the account.
class DeleteAccountScreen extends ConsumerStatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  ConsumerState<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends ConsumerState<DeleteAccountScreen> {
  // Stable codes sent to the backend; labels are localized at render time.
  static const _reasons = <String>[
    'NOT_USING',
    'FOUND_BETTER',
    'PRIVACY',
    'TOO_MANY_NOTIFICATIONS',
    'ANOTHER_ACCOUNT',
    'OTHER',
  ];

  String? _selected;
  final _detail = TextEditingController();
  bool _deleting = false;
  String? _error;

  @override
  void dispose() {
    _detail.dispose();
    super.dispose();
  }

  String _label(String code, l10n) {
    switch (code) {
      case 'NOT_USING':
        return l10n.reasonNotUsing;
      case 'FOUND_BETTER':
        return l10n.reasonFoundBetter;
      case 'PRIVACY':
        return l10n.reasonPrivacy;
      case 'TOO_MANY_NOTIFICATIONS':
        return l10n.reasonTooManyNotifications;
      case 'ANOTHER_ACCOUNT':
        return l10n.reasonAnotherAccount;
      default:
        return l10n.reasonOther;
    }
  }

  Future<void> _confirmAndDelete() async {
    final l10n = context.l10n;
    // A reason is required; "Other" also needs a few words of detail.
    if (_selected == null) {
      setState(() => _error = l10n.selectReasonError);
      return;
    }
    if (_selected == 'OTHER' && _detail.text.trim().isEmpty) {
      setState(() => _error = l10n.tellUsMoreError);
      return;
    }
    setState(() => _error = null);

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        title: Text(l10n.deleteAccountConfirmTitle, style: AppTextStyles.style16px.w700),
        content: Text(l10n.deleteAccountConfirmBody,
            style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.cancel)),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.deleteAccount,
                style: AppTextStyles.style14px.w700.copyWith(color: AppColors.danger)),
          ),
        ],
      ),
    );
    if (ok != true) return;

    setState(() => _deleting = true);
    try {
      await ref.read(profileRepositoryProvider).deleteAccount(
            reason: _selected,
            detail: _detail.text,
          );
      // Clear tokens/session + every user-scoped cache, then return to login.
      await ref.read(sessionControllerProvider.notifier).logout();
      clearUserScopedState(ref);
      if (mounted) Navigator.of(context).popUntil((r) => r.isFirst);
    } catch (_) {
      if (mounted) {
        setState(() => _deleting = false);
        ScaffoldToast.showErrorBottom(context, context.l10n.couldNotDeleteAccount);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: CommonAppBar(title: l10n.deleteAccount),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h),
                children: [
                  Text(l10n.deleteAccountReasonTitle,
                      style: AppTextStyles.style18px.w700.copyWith(color: AppColors.textPrimary)),
                  SizedBox(height: 4.h),
                  Text(l10n.deleteAccountReasonSubtitle,
                      style: AppTextStyles.style13px.w500.copyWith(color: AppColors.textSecondary)),
                  SizedBox(height: 16.h),
                  for (final code in _reasons) _reasonTile(code, l10n),
                  if (_error != null) ...[
                    SizedBox(height: 4.h),
                    Text(_error!,
                        style: AppTextStyles.style12px.w500.copyWith(color: AppColors.danger)),
                  ],
                  SizedBox(height: 16.h),
                  TextField(
                    controller: _detail,
                    minLines: 2,
                    maxLines: 4,
                    maxLength: 1000,
                    onChanged: (_) {
                      if (_error != null) setState(() => _error = null);
                    },
                    style: AppTextStyles.style14px.w500,
                    decoration: InputDecoration(
                      hintText: l10n.deleteAccountDetailHint,
                      hintStyle: AppTextStyles.style14px.w400.copyWith(color: AppColors.textHint),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.danger.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.warning_amber_rounded, color: AppColors.danger, size: 20.sp),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(l10n.deleteAccountConfirmBody,
                              style: AppTextStyles.style12px.w500
                                  .copyWith(color: AppColors.danger, height: 1.4)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
              child: GestureDetector(
                onTap: _deleting ? null : _confirmAndDelete,
                child: Container(
                  height: 52.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.danger,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: _deleting
                      ? SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: const CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white))
                      : Text(l10n.deleteAccount,
                          style: AppTextStyles.style16px.w700.copyWith(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _reasonTile(String code, l10n) {
    final selected = _selected == code;
    return GestureDetector(
      onTap: () => setState(() {
        _selected = code;
        _error = null;
      }),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary.withValues(alpha: 0.08) : AppColors.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: selected ? AppColors.primary : AppColors.border),
        ),
        child: Row(
          children: [
            Icon(selected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                color: selected ? AppColors.primary : AppColors.textSecondary, size: 20.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(_label(code, l10n),
                  style: AppTextStyles.style14px.w600.copyWith(color: AppColors.textPrimary)),
            ),
          ],
        ),
      ),
    );
  }
}
