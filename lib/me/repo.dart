import 'dart:typed_data';
import 'package:internal_network/network_resources/resources.dart';
import '../admin/admin.dart';
import 'app_api.dart';
import 'models/models.dart';
import '../auth/models/models.dart';

class MeRepo {
  MeRepo._();
  static MeRepo? _instance;

  factory MeRepo([UsersApi? api]) {
    _instance ??= MeRepo._();
    _instance!._api = api ?? UsersApiImpl();
    return _instance!;
  }

  late UsersApi _api;

  /// Get current user profile
  Future<NetworkResponse<UnifiedUserResponse>> getUserMe({
    required String clientType,
  }) async {
    return await _api.getUserMe(clientType);
  }

  /// Update current user profile
  Future<NetworkResponse<UnifiedUserResponse>> updateUserMe(
    UserUpdate userUpdate, {
    String? avatarPath,
  }) async {
    return await _api.updateUserMe(userUpdate, avatarPath: avatarPath);
  }

  /// Update current user password
  Future<NetworkResponse<Message>> updatePasswordMe(
    UpdatePassword updatePassword,
  ) async {
    return await _api.updatePasswordMe(updatePassword);
  }

  /// Update current user avatar (tối ưu cho cả web và mobile)
  Future<NetworkResponse<Map<String, dynamic>>> updateAvatar(
    Uint8List imageBytes,
    String fileName,
  ) async {
    return await _api.updateAvatar(imageBytes, fileName);
  }

  /// Register FCM device token
  Future<NetworkResponse<FCMTokenResponse>> registerDeviceToken(
    FCMTokenRegisterRequest request,
  ) async {
    return await _api.registerDeviceToken(request);
  }

  /// Get user by ID
  Future<NetworkResponse<UnifiedUserResponse>> getUserById(
    String userId,
  ) async {
    return await _api.getUserById(userId);
  }

  /// Update user by ID
  Future<NetworkResponse<UnifiedUserResponse>> updateUserById(
    String userId,
    UserUpdate userUpdate, {
    String? avatarPath,
  }) async {
    return await _api.updateUserById(
      userId,
      userUpdate,
      avatarPath: avatarPath,
    );
  }

  /// Delete user
  Future<NetworkResponse<Message>> deleteUser(String userId) async {
    return await _api.deleteUser(userId);
  }

  /// Link a social account to current user
  Future<NetworkResponse<Message>> linkSocialAccount(
    SocialLinkRequest socialLinkRequest,
  ) async {
    return await _api.linkSocialAccount(socialLinkRequest);
  }

  /// Get all social accounts linked to current user
  Future<NetworkResponse<List<SocialAccountResponse>>>
  getMySocialAccounts() async {
    return await _api.getMySocialAccounts();
  }

  /// Unlink a social account from current user
  Future<NetworkResponse<Message>> unlinkSocialAccount(String provider) async {
    return await _api.unlinkSocialAccount(provider);
  }
}
