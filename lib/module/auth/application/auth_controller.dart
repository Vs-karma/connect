import 'package:connect/module/auth/application/auth_state.dart';
import 'package:connect/module/auth/application/session_controller.dart';
import 'package:connect/module/auth/data/auth_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    NotifierProvider<AuthController, AuthState>(AuthController.new);

/// Drives the login flow. Owns [AuthState.isLoading] (so buttons reflect it) and
/// rethrows errors so the calling screen can toast + decide navigation locally.
class AuthController extends Notifier<AuthState> {
  @override
  AuthState build() => AuthState.initial();

  Future<void> requestOtp({required String phone, String? shopCode}) async {
    state = state.copyWith(isLoading: true);
    try {
      final res = await ref
          .read(authRepositoryProvider)
          .requestOtp(phone: phone, shopCode: shopCode);
      // Fresh state for the OTP step (overwrites any previous attempt).
      state = AuthState(
        isLoading: false,
        requestId: res.requestId,
        phone: phone,
        devOtp: res.devOtp,
        shopCode: shopCode,
        resendAfter: res.resendAfter,
      );
    } catch (_) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<TokenResponse> verifyOtp({required String otp, DeviceInfoData? device}) async {
    state = state.copyWith(isLoading: true);
    try {
      final tokens = await ref.read(sessionControllerProvider.notifier).verifyOtp(
            requestId: state.requestId!,
            phone: state.phone!,
            otp: otp,
            shopCode: state.shopCode,
            device: device,
          );
      state = state.copyWith(isLoading: false);
      return tokens;
    } catch (_) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
