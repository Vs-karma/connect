import 'package:connect/module/auth/application/session_controller.dart';
import 'package:connect/module/profile/application/profile_providers.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/app_images.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/error_message.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/utility/username_validator.dart';
import 'package:connect/widgets/app_button.dart';
import 'package:connect/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Shown right after OTP verification for a new user (or anyone without a name).
/// Collects a validated display name, saves it, then enters the app.
class NameSetupScreen extends ConsumerStatefulWidget {
  final String? initialName;

  const NameSetupScreen({super.key, this.initialName});

  @override
  ConsumerState<NameSetupScreen> createState() => _NameSetupScreenState();
}

class _NameSetupScreenState extends ConsumerState<NameSetupScreen> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.initialName ?? '');
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? _messageFor(String code, l10n) {
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

  Future<void> _save() async {
    final l10n = context.l10n;
    final name = _controller.text.trim();
    final code = usernameError(name);
    if (code != null) {
      setState(() => _error = _messageFor(code, l10n));
      return;
    }
    setState(() {
      _error = null;
      _saving = true;
    });
    try {
      await ref.read(profileRepositoryProvider).updateName(name);
      await ref.read(sessionControllerProvider.notifier).refreshUser();
      ref.invalidate(profileProvider);
      if (!mounted) return;
      // Enter the app — AuthGate already renders MainShell underneath.
      Navigator.of(context).popUntil((r) => r.isFirst);
    } catch (e) {
      if (mounted) {
        setState(() => _saving = false);
        ScaffoldToast.showErrorBottom(context, friendlyError(e));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // Block back — a signed-in user must set a name before using the app.
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Image.asset(AppImages.appMark, height: 120.h),
                SizedBox(height: 32.h),
                Text(l10n.setUpProfile,
                    style: AppTextStyles.style22px.w700.copyWith(color: AppColors.textPrimary)),
                SizedBox(height: 8.h),
                Text(l10n.whatShouldWeCallYou,
                    style: AppTextStyles.style14px.w500.copyWith(color: AppColors.textSecondary)),
                SizedBox(height: 28.h),
                AppTextField(
                  controller: _controller,
                  hintText: l10n.yourNameHint,
                  keyboardType: TextInputType.name,
                  maxLength: kUsernameMax,
                  textInputAction: TextInputAction.done,
                  inputFormatters: [usernameInputFormatter],
                  errorText: _error,
                  onChanged: (_) {
                    if (_error != null) setState(() => _error = null);
                  },
                  onSubmitted: (_) => _save(),
                ),
                SizedBox(height: 10.h),
                Text(l10n.nameInvalidChars,
                    style: AppTextStyles.style11px.w500.copyWith(color: AppColors.textHint)),
                SizedBox(height: 24.h),
                AppButton(
                  label: l10n.continueLabel,
                  icon: Icons.arrow_forward,
                  isLoading: _saving,
                  onPressed: _save,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
