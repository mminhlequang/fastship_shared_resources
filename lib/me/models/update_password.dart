class UpdatePassword {
  String? currentPassword;
  String? newPassword;

  UpdatePassword({
    this.currentPassword,
    this.newPassword,
  });

  UpdatePassword.fromJson(Map<String, dynamic> json) {
    currentPassword = json["current_password"];
    newPassword = json["new_password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (currentPassword != null) data["current_password"] = currentPassword;
    if (newPassword != null) data["new_password"] = newPassword;
    return data;
  }
}
