class SocialAccountResponse {
  String? id;
  String? provider;
  String? providerUserId;
  DateTime? createdAt;

  SocialAccountResponse({
    this.id,
    this.provider,
    this.providerUserId,
    this.createdAt,
  });

  SocialAccountResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    provider = json["provider"];
    providerUserId = json["provider_user_id"];
    createdAt =
        json["created_at"] != null ? DateTime.parse(json["created_at"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["provider"] = provider;
    data["provider_user_id"] = providerUserId;
    if (createdAt != null) {
      data["created_at"] = createdAt!.toIso8601String();
    }
    return data;
  }
}
