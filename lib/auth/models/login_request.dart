class LoginRequest {
  String? username;
  String? password;
  String? clientType;

  LoginRequest({
    this.username,
    this.password,
    this.clientType,
  });

  LoginRequest.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    password = json["password"];
    clientType = json["client_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["username"] = username;
    data["password"] = password;
    data["client_type"] = clientType;
    return data;
  }
}
