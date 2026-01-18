class ConfirmPasswordReset {
  String? resetToken;
  String? newPassword;

  ConfirmPasswordReset({this.resetToken, this.newPassword});

  ConfirmPasswordReset.fromJson(Map<String, dynamic> json) {
    resetToken = json["reset_token"];
    newPassword = json["new_password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["reset_token"] = resetToken;
    data["new_password"] = newPassword;
    return data;
  }
}
