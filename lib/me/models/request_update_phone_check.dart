class RequestUpdatePhoneCheck {
  String? phoneNumber;

  RequestUpdatePhoneCheck({this.phoneNumber});

  RequestUpdatePhoneCheck.fromJson(Map<String, dynamic> json) {
    phoneNumber = json["new_phone_number"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["new_phone_number"] = phoneNumber;
    return data;
  }
}
