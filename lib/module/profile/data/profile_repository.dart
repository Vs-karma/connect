import 'package:connect/module/profile/data/profile_models.dart';
import 'package:connect/network/api_controller.dart';
import 'package:connect/network/end_points.dart';
import 'package:dio/dio.dart';

/// Profile read + edit (name, avatar) against /users/me.
class ProfileRepository {
  final ApiController _api = ApiController.instance;

  Future<Profile> getProfile() async {
    final res = await _api.get(EndPoints.USERS_ME);
    return Profile.fromJson(res.data as Map<String, dynamic>);
  }

  Future<Profile> updateName(String name) async {
    final res = await _api.patch(EndPoints.USERS_ME, body: {'name': name});
    return Profile.fromJson(res.data as Map<String, dynamic>);
  }

  /// Permanently deletes the signed-in user's account, with an optional reason.
  Future<void> deleteAccount({String? reason, String? detail}) async {
    await _api.delete(EndPoints.DELETE_ACCOUNT, body: {
      if (reason != null && reason.isNotEmpty) 'reason': reason,
      if (detail != null && detail.trim().isNotEmpty) 'detail': detail.trim(),
    });
  }

  Future<Profile> uploadAvatar(String filePath) async {
    final form = FormData.fromMap({'file': await MultipartFile.fromFile(filePath)});
    final res = await _api.post(
      EndPoints.USER_AVATAR,
      body: form,
      headers: {'Content-Type': 'multipart/form-data'},
    );
    return Profile.fromJson(res.data as Map<String, dynamic>);
  }
}
