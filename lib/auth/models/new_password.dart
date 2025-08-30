class NewPassword {
  String? token;
  String? newPassword;

  NewPassword({this.token, this.newPassword});

  NewPassword.fromJson(Map<String, dynamic> json) {
    token = json["token"];
    newPassword = json["new_password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["token"] = token;
    data["new_password"] = newPassword;
    return data;
  }
}
