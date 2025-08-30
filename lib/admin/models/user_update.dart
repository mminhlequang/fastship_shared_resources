class UserCreateByAdmin {
  String? email;
  String? password;
  String? fullName;
  String? phoneNumber;
  String? userType;
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
    this.userType,
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

  UserCreateByAdmin.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
    fullName = json["full_name"];
    phoneNumber = json["phone_number"];
    userType = json["user_type"];
    assignRoles = json["assign_roles"]
        ?.map((e) => AssignRolesCreateByAdmin.fromJson(e))
        .toList();
    companyName = json["company_name"];
    websiteUrl = json["website_url"];
    avatarUrl = json["avatar_url"];
    countryCode = json["country_code"];
    locale = json["locale"];
    timezone = json["timezone"];
    currency = json["currency"];
    gender = json["gender"];
    birthDate = json["birth_date"] != null
        ? DateTime.tryParse(json["birth_date"])
        : null;
    bio = json["bio"];
    jobTitle = json["job_title"];
    emailVerified = json["email_verified"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    data["full_name"] = fullName;
    data["phone_number"] = phoneNumber;
    data["user_type"] = userType;
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

  AssignRolesCreateByAdmin({
    this.role,
    this.driverOrgId,
    this.restaurantOrgId,
  });

  AssignRolesCreateByAdmin.fromJson(Map<String, dynamic> json) {
    role = json["role"];
    driverOrgId = json["driver_org_id"];
    restaurantOrgId = json["restaurant_org_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["role"] = role;
    data["driver_org_id"] = driverOrgId;
    data["restaurant_org_id"] = restaurantOrgId;
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
    birthDate = json["birth_date"] != null
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
