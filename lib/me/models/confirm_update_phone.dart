class ConfirmUpdatePhone {
  String? newPhoneNumber;
  String? idToken;

  ConfirmUpdatePhone({this.newPhoneNumber, this.idToken});

  ConfirmUpdatePhone.fromJson(Map<String, dynamic> json) {
    newPhoneNumber = json["new_phone_number"];
    idToken = json["id_token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["new_phone_number"] = newPhoneNumber;
    data["id_token"] = idToken;
    return data;
  }
}
