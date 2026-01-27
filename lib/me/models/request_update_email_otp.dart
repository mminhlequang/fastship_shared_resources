class RequestUpdateEmailOTP {
  String? newEmail;

  RequestUpdateEmailOTP({this.newEmail});

  RequestUpdateEmailOTP.fromJson(Map<String, dynamic> json) {
    newEmail = json["new_email"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["new_email"] = newEmail;
    return data;
  }
}
