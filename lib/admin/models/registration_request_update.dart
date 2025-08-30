/// Model đại diện cho yêu cầu cập nhật đăng ký dựa trên JSON mẫu
 

class RegistrationRequestUpdate {
  String? status;
  String? note;

  RegistrationRequestUpdate({
    this.status,
    this.note,
  });

  RegistrationRequestUpdate.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    note = json["note"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) data["status"] = status;
    if (note != null) data["note"] = note;
    return data;
  }
}
