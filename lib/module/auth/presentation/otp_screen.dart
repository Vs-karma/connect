import 'dart:async';
import 'dart:io';

import 'package:connect/module/auth/application/auth_controller.dart';
import 'package:connect/module/auth/data/auth_models.dart';
import 'package:connect/module/auth/presentation/name_setup_screen.dart';
import 'package:connect/res/app_colors.dart';
import 'package:connect/res/app_images.dart';
import 'package:connect/res/text_style.dart';
import 'package:connect/utility/app_toast.dart';
import 'package:connect/utility/error_message.dart';
import 'package:connect/utility/l10n_extension.dart';
import 'package:connect/widgets/app_bar.dart';
import 'package:connect/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({super.key});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final _pinController = TextEditingController();
  Timer? _timer;
  int _seconds = 60;

  @override
  void initState() {
    super.initState();
    final s = ref.read(authControllerProvider);
    if (s.devOtp != null && s.devOtp!.isNotEmpty) {
      _pinController.text = s.devOtp!;
    }
    _seconds = s.resendAfter > 0 ? s.resendAfter : 60;
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_seconds <= 0) {
        t.cancel();
      } else {
        setState(() => _seconds--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController.dispose();
    super.dispose();
  }

  String get _timeStr {
    final m = (_seconds ~/ 60).toString().padLeft(2, '0');
    final s = (_seconds % 60).toString().padLeft(2, '0');
    return '$m:$s secs';
  }

  void _verify() async {
    final otp = _pinController.text.trim();
    if (otp.length < 4) {
      ScaffoldToast.showErrorBottom(context, context.l10n.enterOtp);
      return;
    }
    try {
      final tokens = await ref.read(authControllerProvider.notifier).verifyOtp(
            otp: otp,
            device: DeviceInfoData(
              platform: Platform.isAndroid ? 'android' : 'ios',
              appVersion: '1.0.0',
            ),
          );
      if (!mounted) return;
      // New user (or anyone still missing a name) must pick a username first.
      final needsName = tokens.isNewUser || (tokens.user.name ?? '').trim().isEmpty;
      if (needsName) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => NameSetupScreen(initialName: tokens.user.name)),
        );
      } else {
        Navigator.of(context).popUntil((r) => r.isFirst);
      }
    } catch (e) {
      if (mounted) ScaffoldToast.showErrorBottom(context, friendlyError(e));
    }
  }

  void _resend() async {
    if (_seconds > 0) return;
    final s = ref.read(authControllerProvider);
    try {
      await ref
          .read(authControllerProvider.notifier)
          .requestOtp(phone: s.phone ?? '', shopCode: s.shopCode);
      if (!mounted) return;
      _pinController.clear();
      setState(() => _seconds = ref.read(authControllerProvider).resendAfter);
      _startTimer();
    } catch (e) {
      if (mounted) ScaffoldToast.showErrorBottom(context, friendlyError(e));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = ref.watch(authControllerProvider);
    final phone = state.phone ?? '';

    final defaultPinTheme = PinTheme(
      width: 46.w,
      height: 54.h,
      textStyle: AppTextStyles.style20px.w700,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.border),
      ),
    );

    return Scaffold(
      appBar: CommonAppBar(title: l10n.verifyOtpTitle),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(child: _sentToText(l10n, phone)),
                  GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Text(l10n.edit,
                        style: AppTextStyles.style14px.w700.copyWith(color: AppColors.primary)),
                  ),
                ],
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: 0.05,
                      child: Image.asset(AppImages.appMark, height: 240.h),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 40.h),
                        Pinput(
                          length: 6,
                          controller: _pinController,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: (defaultPinTheme.decoration as BoxDecoration)
                                .copyWith(border: Border.all(color: AppColors.primary)),
                          ),
                          onCompleted: (_) => _verify(),
                        ),
                        SizedBox(height: 16.h),
                        _resendRow(l10n),
                        const Spacer(),
                        _secureNote(l10n),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ],
                ),
              ),
              AppButton(
                label: l10n.verify,
                icon: Icons.arrow_forward,
                isLoading: state.isLoading,
                onPressed: _verify,
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sentToText(l10n, String phone) {
    final grey = AppTextStyles.style14px.w500.copyWith(color: AppColors.textPrimary);
    final green = AppTextStyles.style14px.w700.copyWith(color: AppColors.primary);
    final full = l10n.otpSentTo(phone);
    final idx = phone.isNotEmpty ? full.indexOf(phone) : -1;
    if (idx < 0) return Text(full, style: grey);
    return Text.rich(TextSpan(children: [
      TextSpan(text: full.substring(0, idx), style: grey),
      TextSpan(text: phone, style: green),
      TextSpan(text: full.substring(idx + phone.length), style: grey),
    ]));
  }

  Widget _resendRow(l10n) {
    if (_seconds <= 0) {
      return Center(
        child: GestureDetector(
          onTap: _resend,
          child: Text(l10n.resendOtp,
              style: AppTextStyles.style14px.w700.copyWith(color: AppColors.primary)),
        ),
      );
    }
    final grey = AppTextStyles.style14px.w600.copyWith(color: AppColors.textPrimary);
    final green = AppTextStyles.style14px.w700.copyWith(color: AppColors.primary);
    final full = l10n.resendOtpIn(_timeStr);
    final idx = full.indexOf(_timeStr);
    if (idx < 0) return Center(child: Text(full, style: grey));
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: full.substring(0, idx), style: grey),
        TextSpan(text: _timeStr, style: green),
        TextSpan(text: full.substring(idx + _timeStr.length), style: grey),
      ])),
    );
  }

  Widget _secureNote(l10n) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AppImages.icProtected, height: 26.h),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.secureAndPrivate,
                  style: AppTextStyles.style14px.w700.copyWith(color: AppColors.primary)),
              SizedBox(height: 2.h),
              Text(l10n.otpConfidential,
                  style: AppTextStyles.style12px.w500.copyWith(color: AppColors.textSecondary)),
            ],
          ),
        ),
      ],
    );
  }
}
