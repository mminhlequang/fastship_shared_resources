class RoleAssignmentRequest {
  String? userId;
  int? restaurantOrganizationId;
  int? restaurantId;
  int? roleId;

  RoleAssignmentRequest({
    this.userId,
    this.roleId,
    this.restaurantOrganizationId,
    this.restaurantId,
  });

  RoleAssignmentRequest.fromJson(Map<String, dynamic> json) {
    userId = json["user_id"];
    restaurantOrganizationId = json["restaurant_org_id"];
    restaurantId = json["restaurant_id"];
    roleId = json["role_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["user_id"] = userId;
    data["restaurant_org_id"] = restaurantOrganizationId;
    data["restaurant_id"] = restaurantId;
    data["role_id"] = roleId;
    return data;
  }
}

class UserCreateForOrg {
  String? email;
  String? fullName;
  String? phone;
  String? password;
  String? role;
  String? restaurantOrganizationId;
  String? restaurantId;

  UserCreateForOrg({
    this.email,
    this.fullName,
    this.phone,
    this.password,
    this.role,
    this.restaurantOrganizationId,
    this.restaurantId,
  });

  UserCreateForOrg.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['full_name'];
    phone = json['phone'];
    password = json['password'];
    role = json['role'];
    restaurantOrganizationId = json['restaurant_org_id'];
    restaurantId = json['restaurant_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (email != null) data['email'] = email;
    if (fullName != null) data['full_name'] = fullName;
    if (phone != null) data['phone'] = phone;
    if (password != null) data['password'] = password;
    if (role != null) data['role'] = role;
    if (restaurantOrganizationId != null)
      data['restaurant_org_id'] = restaurantOrganizationId;
    if (restaurantId != null) data['restaurant_id'] = restaurantId;
    return data;
  }
}
