class SocialLinkRequest {
  String? provider;
  String? accessToken;
  String? idToken;

  SocialLinkRequest({
    this.provider,
    this.accessToken,
    this.idToken,
  });

  SocialLinkRequest.fromJson(Map<String, dynamic> json) {
    provider = json["provider"];
    accessToken = json["access_token"];
    idToken = json["id_token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (provider != null) data["provider"] = provider;
    if (accessToken != null) data["access_token"] = accessToken;
    if (idToken != null) data["id_token"] = idToken;
    return data;
  }
}
