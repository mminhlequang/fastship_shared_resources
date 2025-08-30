class RoleDetailResponse {
  int? id;
  String? name;
  String? label;
  String? description;
  String? scope;
  List<String>? permissions;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<UserRoleInfo>? users;

  RoleDetailResponse({
    this.id,
    this.name,
    this.label,
    this.description,
    this.scope,
    this.permissions,
    this.createdAt,
    this.updatedAt,
    this.users,
  });

  RoleDetailResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    label = json["label"];
    description = json["description"];
    scope = json["scope"];
    permissions = json["permissions"]?.cast<String>();
    createdAt =
        json["created_at"] != null ? DateTime.parse(json["created_at"]) : null;
    updatedAt =
        json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : null;
    if (json["users"] != null) {
      users = <UserRoleInfo>[];
      json["users"].forEach((v) {
        users!.add(UserRoleInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["label"] = label;
    data["description"] = description;
    data["scope"] = scope;
    data["permissions"] = permissions;
    data["created_at"] = createdAt?.toIso8601String();
    data["updated_at"] = updatedAt?.toIso8601String();
    if (users != null) {
      data["users"] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserRoleInfo {
  String? id;
  String? email;
  String? fullName;
  bool? isActive;

  UserRoleInfo({this.id, this.email, this.fullName, this.isActive});

  UserRoleInfo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    fullName = json["full_name"];
    isActive = json["is_active"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["email"] = email;
    data["full_name"] = fullName;
    data["is_active"] = isActive;
    return data;
  }
}
