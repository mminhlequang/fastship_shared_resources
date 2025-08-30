/// Model phản hồi người dùng kèm thông tin vai trò cho admin
class UserWithRolesResponse {
  String? id;
  String? email;
  String? fullName;
  String? phoneNumber;
  bool? isSuperuser;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Map<String, dynamic>>? roles; // Danh sách vai trò, có thể chứa context tổ chức

  UserWithRolesResponse({
    this.id,
    this.email,
    this.fullName,
    this.phoneNumber,
    this.isSuperuser,
    this.createdAt,
    this.updatedAt,
    this.roles,
  });

  /// Khởi tạo từ JSON
  UserWithRolesResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    fullName = json["full_name"];
    phoneNumber = json["phone_number"];
    isSuperuser = json["is_superuser"];
    createdAt = json["created_at"] != null ? DateTime.tryParse(json["created_at"]) : null;
    updatedAt = json["updated_at"] != null ? DateTime.tryParse(json["updated_at"]) : null;
    if (json["roles"] != null) {
      // roles là List<Map<String, dynamic>>
      roles = List<Map<String, dynamic>>.from(
        json["roles"].map((e) => Map<String, dynamic>.from(e)),
      );
    }
  }

  /// Chuyển model sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["email"] = email;
    data["full_name"] = fullName;
    data["phone_number"] = phoneNumber;
    data["is_superuser"] = isSuperuser;
    data["created_at"] = createdAt?.toIso8601String();
    data["updated_at"] = updatedAt?.toIso8601String();
    if (roles != null) {
      data["roles"] = roles;
    }
    return data;
  }
}
