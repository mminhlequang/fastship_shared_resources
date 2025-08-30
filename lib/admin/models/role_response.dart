class RoleCreate {
  String? name;
  String? label;
  String? description;
  String? scope;
  List<String>? permissions;

  RoleCreate(
      {this.name, this.label, this.description, this.scope, this.permissions});

  RoleCreate.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    label = json["label"];
    description = json["description"];
    scope = json["scope"];
    permissions = json["permissions"]?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["label"] = label;
    data["description"] = description;
    data["scope"] = scope;
    data["permissions"] = permissions;
    return data;
  }
}


class RoleUpdate {
  String? name;
  String? label;
  String? description;
  List<String>? permissions;

  RoleUpdate({this.name, this.label, this.description, this.permissions});

  RoleUpdate.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    label = json["label"];
    description = json["description"];
    permissions = json["permissions"]?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["label"] = label;
    data["description"] = description;
    data["permissions"] = permissions;
    return data;
  }
}


class RoleResponse {
  int? id;
  String? name;
  String? label;
  String? description;
  String? scope;
  List<String>? permissions;
  DateTime? createdAt;
  DateTime? updatedAt;

  RoleResponse({
    this.id,
    this.name,
    this.label,
    this.description,
    this.scope,
    this.permissions,
    this.createdAt,
    this.updatedAt,
  });

  RoleResponse.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
