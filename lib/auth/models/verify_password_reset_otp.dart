class VerifyPasswordResetOTP {
  String? email;
  String? otpCode;

  VerifyPasswordResetOTP({this.email, this.otpCode});

  VerifyPasswordResetOTP.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    otpCode = json["otp_code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["otp_code"] = otpCode;
    return data;
  }
}
