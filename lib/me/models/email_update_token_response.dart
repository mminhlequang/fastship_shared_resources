class EmailUpdateTokenResponse {
  String? confirmationToken;
  String? message;

  EmailUpdateTokenResponse({this.confirmationToken, this.message});

  EmailUpdateTokenResponse.fromJson(Map<String, dynamic> json) {
    confirmationToken = json["confirmation_token"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["confirmation_token"] = confirmationToken;
    data["message"] = message;
    return data;
  }
}
