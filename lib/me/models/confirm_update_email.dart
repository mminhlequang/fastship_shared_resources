class ConfirmUpdateEmail {
  String? confirmationToken;
  String? newEmail;

  ConfirmUpdateEmail({this.confirmationToken, this.newEmail});

  ConfirmUpdateEmail.fromJson(Map<String, dynamic> json) {
    confirmationToken = json["confirmation_token"];
    newEmail = json["new_email"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["confirmation_token"] = confirmationToken;
    data["new_email"] = newEmail;
    return data;
  }
}
