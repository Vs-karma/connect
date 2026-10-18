import 'package:connect/module/auth/data/auth_models.dart';
import 'package:connect/module/auth/data/auth_repository.dart';
import 'package:connect/utility/secure_auth_storage_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository());

/// Holds the current session. `null` = signed out; an [AppUser] = signed in.
/// On startup it restores the session from the stored token via /auth/me.
final sessionControllerProvider =
    AsyncNotifierProvider<SessionController, AppUser?>(SessionController.new);

class SessionController extends AsyncNotifier<AppUser?> {
  AuthRepository get _repo => ref.read(authRepositoryProvider);

  @override
  Future<AppUser?> build() async {
    final token = await SecureAuthStorageUtil.getAccessToken();
    if (token == null || token.isEmpty) return null;
    try {
      return await _repo.me();
    } catch (_) {
      // Token invalid/expired and refresh failed → treat as signed out.
      await SecureAuthStorageUtil.clearAuthData();
      return null;
    }
  }

  Future<OtpRequestResult> requestOtp({required String phone, String? shopCode}) {
    return _repo.requestOtp(phone: phone, shopCode: shopCode);
  }

  Future<TokenResponse> verifyOtp({
    required String requestId,
    required String phone,
    required String otp,
    String? shopCode,
    String? fcmToken,
    DeviceInfoData? device,
  }) async {
    final tokens = await _repo.verifyOtp(
      requestId: requestId,
      phone: phone,
      otp: otp,
      shopCode: shopCode,
      fcmToken: fcmToken,
      device: device,
    );
    await SecureAuthStorageUtil.saveAuthData(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
    );
    state = AsyncData(tokens.user);
    return tokens;
  }

  /// Re-fetch the signed-in user (e.g. after the name is set during signup).
  Future<void> refreshUser() async {
    try {
      state = AsyncData(await _repo.me());
    } catch (_) {
      // keep existing state on failure
    }
  }

  Future<void> logout() async {
    final refreshToken = await SecureAuthStorageUtil.getRefreshToken();
    try {
      if (refreshToken != null) await _repo.logout(refreshToken: refreshToken);
    } catch (_) {
      // ignore — clear locally regardless
    }
    await SecureAuthStorageUtil.clearAuthData();
    state = const AsyncData(null);
  }
}
