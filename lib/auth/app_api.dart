import 'package:internal_core/network/network.dart'; 

import 'package:internal_core/network/network_resources/resources.dart';
import 'package:dio/dio.dart';
import '../admin/models/unified_user_response.dart';
import 'models/models.dart';

class _AuthEndpoint {
  _AuthEndpoint._();

  static String signup() => "/api/v1/auth/signup";
  static String login() => "/api/v1/auth/login";
  static String socialLogin() => "/api/v1/auth/login_social";
  static String refreshToken() => "/api/v1/auth/refresh-token";
  static String passwordRecovery(String email) =>
      "/api/v1/auth/password-recovery/$email";
  static String resetPassword() => "/api/v1/auth/reset-password/";
  static String requestPasswordResetOTP() =>
      "/api/v1/auth/password-reset-otp/request";
  static String verifyPasswordResetOTP() =>
      "/api/v1/auth/password-reset-otp/verify";
}

abstract class AuthApi {
  Future<NetworkResponse<UnifiedUserResponse>> signup(
    UserRegister userRegister,
  );
  Future<NetworkResponse<TokenResponseWithUser>> login(
    LoginRequest loginRequest,
  );
  Future<NetworkResponse<TokenResponseWithUser>> socialLogin(
    SocialLoginRequest socialLoginRequest,
  );
  Future<NetworkResponse<TokenResponse>> refreshAccessToken(
    RefreshTokenRequest refreshTokenRequest,
  );
  Future<NetworkResponse<Message>> recoverPassword(String email);
  Future<NetworkResponse<Message>> resetPassword(NewPassword newPassword);
  Future<NetworkResponse<Message>> requestPasswordResetOTP(
    RequestPasswordResetOTP requestPasswordResetOTP,
  );
  Future<NetworkResponse<Message>> verifyPasswordResetOTP(
    VerifyPasswordResetOTP verifyPasswordResetOTP,
  );
}

class AuthApiImpl extends AuthApi {
  @override
  Future<NetworkResponse<UnifiedUserResponse>> signup(
    UserRegister userRegister,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient().post(
          _AuthEndpoint.signup(),
          data: userRegister.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => UnifiedUserResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<TokenResponseWithUser>> login(
    LoginRequest loginRequest,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient().post(
          _AuthEndpoint.login(),
          data: loginRequest.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => TokenResponseWithUser.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<TokenResponseWithUser>> socialLogin(
    SocialLoginRequest socialLoginRequest,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient().post(
          _AuthEndpoint.socialLogin(),
          data: socialLoginRequest.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => TokenResponseWithUser.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<TokenResponse>> refreshAccessToken(
    RefreshTokenRequest refreshTokenRequest,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient().post(
          _AuthEndpoint.refreshToken(),
          data: refreshTokenRequest.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => TokenResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<Message>> recoverPassword(String email) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient().post(
          _AuthEndpoint.passwordRecovery(email),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => Message.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<Message>> resetPassword(
    NewPassword newPassword,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient().post(
          _AuthEndpoint.resetPassword(),
          data: newPassword.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => Message.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<Message>> requestPasswordResetOTP(
    RequestPasswordResetOTP requestPasswordResetOTP,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient().post(
          _AuthEndpoint.requestPasswordResetOTP(),
          data: requestPasswordResetOTP.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => Message.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<Message>> verifyPasswordResetOTP(
    VerifyPasswordResetOTP verifyPasswordResetOTP,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient().post(
          _AuthEndpoint.verifyPasswordResetOTP(),
          data: verifyPasswordResetOTP.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => Message.fromJson(json),
        );
      },
    );
  }
}
