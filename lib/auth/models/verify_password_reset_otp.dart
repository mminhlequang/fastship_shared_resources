class VerifyPasswordResetOTP {
  String? email;
  String? otp;
  String? newPassword;

  VerifyPasswordResetOTP({this.email, this.otp, this.newPassword});

  VerifyPasswordResetOTP.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    otp = json["otp_code"];
    newPassword = json["new_password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["otp_code"] = otp;
    data["new_password"] = newPassword;
    return data;
  }
}
