class VerifyPasswordResetOTPResponse {
  String? resetToken;
  String? message;

  VerifyPasswordResetOTPResponse({this.resetToken, this.message});

  VerifyPasswordResetOTPResponse.fromJson(Map<String, dynamic> json) {
    resetToken = json["reset_token"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["reset_token"] = resetToken;
    data["message"] = message;
    return data;
  }
}
