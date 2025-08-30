class SocialLoginRequest {
  String? provider;
  String? accessToken;
  String? idToken;
  String? clientType;

  SocialLoginRequest({
    this.provider,
    this.accessToken,
    this.idToken,
    this.clientType,
  });

  SocialLoginRequest.fromJson(Map<String, dynamic> json) {
    provider = json["provider"];
    accessToken = json["access_token"];
    idToken = json["id_token"];
    clientType = json["client_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["provider"] = provider;
    data["access_token"] = accessToken;
    data["id_token"] = idToken;
    data["client_type"] = clientType;
    return data;
  }
}
