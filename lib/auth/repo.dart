import 'package:internal_core/network/network_resources/resources.dart';
import '../admin/models/unified_user_response.dart';
import 'app_api.dart';
import 'models/models.dart';

class AuthRepo {
  AuthRepo._();
  static AuthRepo? _instance;

  factory AuthRepo([AuthApi? api]) {
    _instance ??= AuthRepo._();
    _instance!._api = api ?? AuthApiImpl();
    return _instance!;
  }

  late AuthApi _api;

  /// Register a new user
  Future<NetworkResponse<UnifiedUserResponse>> signup(
    UserRegister userRegister,
  ) async {
    return await _api.signup(userRegister);
  }

  /// Login with email and password
  Future<NetworkResponse<TokenResponseWithUser>> login(
    LoginRequest loginRequest,
  ) async {
    return await _api.login(loginRequest);
  }

  /// Social login (Google, Facebook, etc.)
  Future<NetworkResponse<TokenResponseWithUser>> socialLogin(
    SocialLoginRequest socialLoginRequest,
  ) async {
    return await _api.socialLogin(socialLoginRequest);
  }

  /// Refresh access token using refresh token
  Future<NetworkResponse<TokenResponse>> refreshAccessToken(
    RefreshTokenRequest refreshTokenRequest,
  ) async {
    return await _api.refreshAccessToken(refreshTokenRequest);
  }

  /// Send password recovery email
  Future<NetworkResponse<Message>> recoverPassword(String email) async {
    return await _api.recoverPassword(email);
  }

  /// Reset password with token
  Future<NetworkResponse<Message>> resetPassword(
    NewPassword newPassword,
  ) async {
    return await _api.resetPassword(newPassword);
  }

  /// Request OTP for password reset
  Future<NetworkResponse<Message>> requestPasswordResetOTP(
    RequestPasswordResetOTP requestPasswordResetOTP,
  ) async {
    return await _api.requestPasswordResetOTP(requestPasswordResetOTP);
  }

  /// Verify OTP and get reset token
  Future<NetworkResponse<VerifyPasswordResetOTPResponse>>
  verifyPasswordResetOTP(VerifyPasswordResetOTP verifyPasswordResetOTP) async {
    return await _api.verifyPasswordResetOTP(verifyPasswordResetOTP);
  }

  /// Reset password with reset token (3-step OTP flow - Step 3)
  Future<NetworkResponse<Message>> confirmPasswordReset(
    ConfirmPasswordReset confirmPasswordReset,
  ) async {
    return await _api.confirmPasswordReset(confirmPasswordReset);
  }

  /// Convenience method to check if login was successful
  Future<bool> isLoginSuccessful(LoginRequest loginRequest) async {
    final response = await login(loginRequest);
    return response.data != null && response.data!.accessToken != null;
  }

  /// Convenience method to check if signup was successful
  Future<bool> isSignupSuccessful(UserRegister userRegister) async {
    final response = await signup(userRegister);
    return response.data != null;
  }

  /// Convenience method to check if password recovery was successful
  Future<bool> isPasswordRecoverySuccessful(String email) async {
    final response = await recoverPassword(email);
    return response.data != null;
  }

  /// Convenience method to check if password reset was successful
  Future<bool> isPasswordResetSuccessful(NewPassword newPassword) async {
    final response = await resetPassword(newPassword);
    return response.data != null;
  }

  /// Convenience method to check if OTP request was successful (3-step OTP flow - Step 1)
  Future<bool> isPasswordResetOTPRequestSuccessful(
    RequestPasswordResetOTP request,
  ) async {
    final response = await requestPasswordResetOTP(request);
    return response.data != null;
  }

  /// Convenience method to check if OTP verification was successful (3-step OTP flow - Step 2)
  Future<bool> isPasswordResetOTPVerificationSuccessful(
    VerifyPasswordResetOTP verify,
  ) async {
    final response = await verifyPasswordResetOTP(verify);
    return response.data != null && response.data!.resetToken != null;
  }

  /// Convenience method to check if password confirm reset was successful (3-step OTP flow - Step 3)
  Future<bool> isPasswordConfirmResetSuccessful(
    ConfirmPasswordReset confirm,
  ) async {
    final response = await confirmPasswordReset(confirm);
    return response.data != null;
  }
}
