import 'dart:typed_data';
import 'package:internal_core/internal_core.dart';
import 'package:internal_core/network/network.dart';

import 'package:internal_core/network/network_resources/resources.dart';
import 'package:dio/dio.dart';
import 'package:shared_resources/admin/admin.dart';
import 'models/models.dart';
import '../auth/models/models.dart';

class _UsersEndpoint {
  _UsersEndpoint._();

  static String userMe() => "/api/v1/me/";
  static String userMePassword() => "/api/v1/me/password";
  static String updateAvatar() => "/api/v1/me/update_avatar";
  static String registerDeviceToken() => "/api/v1/me/device-token/register";
  static String userById(String userId) => "/api/v1/$userId";
  static String linkSocialAccount() => "/api/v1/me/social/link";
  static String getMySocialAccounts() => "/api/v1/me/social/accounts";
  static String unlinkSocialAccount(String provider) =>
      "/api/v1/me/social/$provider";
}

abstract class UsersApi {
  // Get current user
  Future<NetworkResponse<UnifiedUserResponse>> getUserMe([String? clientType]);

  // Update current user
  Future<NetworkResponse<UnifiedUserResponse>> updateUserMe(
    UserUpdate userUpdate,
  );

  // Update password
  Future<NetworkResponse<Message>> updatePasswordMe(
    UpdatePassword updatePassword,
  );

  // Update avatar (tối ưu cho cả web và mobile)
  Future<NetworkResponse<Map<String, dynamic>>> updateAvatar(
    Uint8List imageBytes,
    String fileName,
  );

  // Register FCM device token
  Future<NetworkResponse<FCMTokenResponse>> registerDeviceToken(
    FCMTokenRegisterRequest request,
  );

  // Get user by ID
  Future<NetworkResponse<UnifiedUserResponse>> getUserById(String userId);

  // Update user by ID
  Future<NetworkResponse<UnifiedUserResponse>> updateUserById(
    String userId,
    UserUpdate userUpdate, {
    String? avatarPath,
  });

  // Delete user
  Future<NetworkResponse<Message>> deleteUser(String userId);

  // Link social account
  Future<NetworkResponse<Message>> linkSocialAccount(
    SocialLinkRequest socialLinkRequest,
  );

  // Get my social accounts
  Future<NetworkResponse<List<SocialAccountResponse>>> getMySocialAccounts();

  // Unlink social account
  Future<NetworkResponse<Message>> unlinkSocialAccount(String provider);
}

class UsersApiImpl extends UsersApi {
  @override
  Future<NetworkResponse<UnifiedUserResponse>> getUserMe([
    String? clientType,
  ]) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _UsersEndpoint.userMe(),
          queryParameters: {'client_type': clientType},
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => UnifiedUserResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<UnifiedUserResponse>> updateUserMe(
    UserUpdate userUpdate,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Map data = userUpdate.toJson();
        data.removeWhere((k, v) => v == null); // Remove null values
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).patch(_UsersEndpoint.userMe(), data: data);

        return NetworkResponse.fromResponse(
          response,
          converter: (json) => UnifiedUserResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<Message>> updatePasswordMe(
    UpdatePassword updatePassword,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).patch(_UsersEndpoint.userMePassword(), data: updatePassword.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => Message.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<Map<String, dynamic>>> updateAvatar(
    Uint8List imageBytes,
    String fileName,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        FormData formData = FormData.fromMap({
          'avatar': MultipartFile.fromBytes(imageBytes, filename: fileName),
        });

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).patch(_UsersEndpoint.updateAvatar(), data: formData);
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => json as Map<String, dynamic>,
        );
      },
    );
  }

  @override
  Future<NetworkResponse<FCMTokenResponse>> registerDeviceToken(
    FCMTokenRegisterRequest request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_UsersEndpoint.registerDeviceToken(), data: request.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => FCMTokenResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<UnifiedUserResponse>> getUserById(
    String userId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_UsersEndpoint.userById(userId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => UnifiedUserResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<UnifiedUserResponse>> updateUserById(
    String userId,
    UserUpdate userUpdate, {
    String? avatarPath,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        Response response;

        if (avatarPath != null) {
          // Use FormData for file upload
          FormData formData = FormData();

          // Add user data fields
          if (userUpdate.fullName != null) {
            formData.fields.add(MapEntry('full_name', userUpdate.fullName!));
          }
          if (userUpdate.phoneNumber != null) {
            formData.fields.add(
              MapEntry('phone_number', userUpdate.phoneNumber!),
            );
          }

          // Add avatar file
          formData.files.add(
            MapEntry('avatar', await MultipartFile.fromFile(avatarPath)),
          );

          response = await AppClient(
            token: await appPrefs.getNormalToken(),
          ).patch(_UsersEndpoint.userById(userId), data: formData);
        } else {
          response = await AppClient(
            token: await appPrefs.getNormalToken(),
          ).patch(_UsersEndpoint.userById(userId), data: userUpdate.toJson());
        }

        return NetworkResponse.fromResponse(
          response,
          converter: (json) => UnifiedUserResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<Message>> deleteUser(String userId) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_UsersEndpoint.userById(userId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => Message.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<Message>> linkSocialAccount(
    SocialLinkRequest socialLinkRequest,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _UsersEndpoint.linkSocialAccount(),
          data: socialLinkRequest.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => Message.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<List<SocialAccountResponse>>>
  getMySocialAccounts() async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_UsersEndpoint.getMySocialAccounts());
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) =>
                  (json as List)
                      .map((item) => SocialAccountResponse.fromJson(item))
                      .toList(),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<Message>> unlinkSocialAccount(String provider) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_UsersEndpoint.unlinkSocialAccount(provider));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => Message.fromJson(json),
        );
      },
    );
  }
}
