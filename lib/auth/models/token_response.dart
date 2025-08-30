
import 'package:shared_resources/admin/models/models.dart';

class TokenResponse {
  String? accessToken;
  String? refreshToken;
  String? tokenType;
  int? expiresIn;

  TokenResponse({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
  });

  TokenResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json["access_token"];
    refreshToken = json["refresh_token"];
    tokenType = json["token_type"];
    expiresIn = json["expires_in"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["access_token"] = accessToken;
    data["refresh_token"] = refreshToken;
    data["token_type"] = tokenType;
    data["expires_in"] = expiresIn;
    return data;
  }
}

class TokenResponseWithUser extends TokenResponse {
  UnifiedUserResponse? user;

  TokenResponseWithUser({
    super.accessToken,
    super.refreshToken,
    super.tokenType,
    super.expiresIn,
    this.user,
  });

  TokenResponseWithUser.fromJson(Map<String, dynamic> json)
    : super.fromJson(json) {
    user =
        json["user"] != null
            ? UnifiedUserResponse.fromJson(json["user"])
            : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data["user"] = user?.toJson();
    return data;
  }
}
