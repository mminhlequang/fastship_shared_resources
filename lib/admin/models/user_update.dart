enum UserCreateByAdminUserType {
  driver("driver"),
  customer("customer"),
  admin(
    "admin",
  ); //User type (customer, driver, admin: system admin or restaurant manager)

  const UserCreateByAdminUserType(this.value);
  final String value;
}

class UserCreateByAdmin {
  String? email;
  String? password;
  String? fullName;
  String? phoneNumber;
  UserCreateByAdminUserType userType;
  List<AssignRolesCreateByAdmin>? assignRoles;

  //detail
  String? companyName;
  String? websiteUrl;
  String? avatarUrl;
  String? countryCode;
  String? locale;
  String? timezone;
  String? currency;
  String? gender;
  DateTime? birthDate;
  String? bio;
  String? jobTitle;
  bool? emailVerified;

  UserCreateByAdmin({
    this.email,
    this.password,
    this.fullName,
    this.phoneNumber,
    required this.userType,
    this.assignRoles,
    this.companyName,
    this.websiteUrl,
    this.avatarUrl,
    this.countryCode,
    this.locale,
    this.timezone,
    this.currency,
    this.gender,
    this.birthDate,
    this.bio,
    this.jobTitle,
    this.emailVerified,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    data["full_name"] = fullName;
    data["phone_number"] = phoneNumber;
    data["user_type"] = userType.value;
    data["assign_roles"] = assignRoles?.map((e) => e.toJson()).toList();
    data["company_name"] = companyName;
    data["website_url"] = websiteUrl;
    data["avatar_url"] = avatarUrl;
    data["country_code"] = countryCode;
    data["locale"] = locale;
    data["timezone"] = timezone;
    data["currency"] = currency;
    data["gender"] = gender;
    data["birth_date"] = birthDate?.toIso8601String();
    data["bio"] = bio;
    data["job_title"] = jobTitle;
    data["email_verified"] = emailVerified;
    return data;
  }
}

class AssignRolesCreateByAdmin {
  String? role;
  int? driverOrgId;
  int? restaurantOrgId;
  int? restaurantId;

  AssignRolesCreateByAdmin({
    this.role,
    this.driverOrgId,
    this.restaurantOrgId,
    this.restaurantId,
  });
 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["role"] = role;
    data["driver_org_id"] = driverOrgId;
    data["restaurant_org_id"] = restaurantOrgId;
    data["restaurant_id"] = restaurantId;
    return data;
  }
}

/// Model cập nhật thông tin người dùng cho admin
class UserUpdate {
  String? fullName;
  String? phoneNumber;
  String? companyName;
  String? websiteUrl;
  String? avatarUrl;
  String? countryCode;
  String? locale;
  String? timezone;
  String? currency;
  String? gender;
  DateTime? birthDate;
  String? bio;
  String? jobTitle;
  bool? emailVerified;

  UserUpdate({
    this.fullName,
    this.phoneNumber,
    this.companyName,
    this.websiteUrl,
    this.avatarUrl,
    this.countryCode,
    this.locale,
    this.timezone,
    this.currency,
    this.gender,
    this.birthDate,
    this.bio,
    this.jobTitle,
    this.emailVerified,
  });

  /// Khởi tạo từ JSON
  UserUpdate.fromJson(Map<String, dynamic> json) {
    fullName = json["full_name"];
    phoneNumber = json["phone_number"];
    companyName = json["company_name"];
    websiteUrl = json["website_url"];
    avatarUrl = json["avatar_url"];
    countryCode = json["country_code"];
    locale = json["locale"];
    timezone = json["timezone"];
    currency = json["currency"];
    gender = json["gender"];
    birthDate =
        json["birth_date"] != null
            ? DateTime.tryParse(json["birth_date"])
            : null;
    bio = json["bio"];
    jobTitle = json["job_title"];
    emailVerified = json["email_verified"];
  }

  /// Chuyển model sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["full_name"] = fullName;
    data["phone_number"] = phoneNumber;
    data["company_name"] = companyName;
    data["website_url"] = websiteUrl;
    data["avatar_url"] = avatarUrl;
    data["country_code"] = countryCode;
    data["locale"] = locale;
    data["timezone"] = timezone;
    data["currency"] = currency;
    data["gender"] = gender;
    data["birth_date"] = birthDate?.toIso8601String();
    data["bio"] = bio;
    data["job_title"] = jobTitle;
    data["email_verified"] = emailVerified;
    return data;
  }
}


/// Model cập nhật vai trò người dùng (UserRoleUpdateRequest)
class UserRoleUpdateRequest {
  /// ID của UserRole cần cập nhật
  int userRoleId;

  /// Tên vai trò mới (nếu có)
  String? roleName;

  /// ID tổ chức tài xế (nếu có)
  int? driverOrgId;

  /// ID tổ chức nhà hàng (nếu có)
  int? restaurantOrgId;

  /// ID nhà hàng (nếu có)
  int? restaurantId;

  UserRoleUpdateRequest({
    required this.userRoleId,
    this.roleName,
    this.driverOrgId,
    this.restaurantOrgId,
    this.restaurantId,
  });

  /// Chuyển model sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_role_id'] = userRoleId;
    if (roleName != null) data['role_name'] = roleName;
    if (driverOrgId != null) data['driver_org_id'] = driverOrgId;
    if (restaurantOrgId != null) data['restaurant_org_id'] = restaurantOrgId;
    if (restaurantId != null) data['restaurant_id'] = restaurantId;
    return data;
  }
}


