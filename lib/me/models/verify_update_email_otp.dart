class VerifyUpdateEmailOTP {
  String? newEmail;
  String? otpCode;

  VerifyUpdateEmailOTP({this.newEmail, this.otpCode});

  VerifyUpdateEmailOTP.fromJson(Map<String, dynamic> json) {
    newEmail = json["new_email"];
    otpCode = json["otp_code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["new_email"] = newEmail;
    data["otp_code"] = otpCode;
    return data;
  }
}
