class UserRegister {
  String? email;
  String? password;
  String? fullName;
  String? phone;
  String? clientType;

  UserRegister({
    this.email,
    this.password,
    this.fullName,
    this.phone,
    this.clientType,
  });

  UserRegister.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
    fullName = json["full_name"];
    phone = json["phone"];
    clientType = json["client_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    data["full_name"] = fullName;
    data["phone"] = phone;
    data["client_type"] = clientType;
    return data;
  }
}
