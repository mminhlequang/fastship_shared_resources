import 'package:shared_resources/driver_orgs/models/models.dart';
import 'package:shared_resources/restaurant_orgs/models/models.dart';
import 'package:shared_resources/restaurants/models/models.dart';

/// Model đại diện cho user trả về từ API admin (unified user)
class UnifiedUserResponse {
  final String? id;
  final String? email;
  final String? fullName;
  final String? phoneNumber;
  final String? companyName;
  final String? websiteUrl;
  final String? avatarUrl;
  final bool? isSuperuser;
  final bool? emailVerified;
  final String? countryCode;
  final String? locale;
  final String? timezone;
  final String? currency;
  final String? gender;
  final DateTime? birthDate;
  final String? bio;
  final String? jobTitle;
  final DateTime? inactiveAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<DriverOrganizationResponse>? driverOrganizations;
  final List<RestaurantOrganizationResponse>? restaurantOrganizations;
  final List<RestaurantResponse>? restaurants;
  final UserDriverInfo? driverInfo;
  final dynamic customerInfo;
  final List<UnifiedUserRole>? roles;
  final dynamic billingInfo;
  final List<dynamic>? subscriptions;

  UnifiedUserResponse({
    this.id,
    this.email,
    this.fullName,
    this.phoneNumber,
    this.companyName,
    this.websiteUrl,
    this.avatarUrl,
    this.isSuperuser,
    this.emailVerified,
    this.countryCode,
    this.locale,
    this.timezone,
    this.currency,
    this.gender,
    this.birthDate,
    this.bio,
    this.jobTitle,
    this.inactiveAt,
    this.createdAt,
    this.updatedAt,
    this.driverOrganizations,
    this.restaurantOrganizations,
    this.restaurants,
    this.driverInfo,
    this.customerInfo,
    this.roles,
    this.billingInfo,
    this.subscriptions,
  });

  /// Parse từ JSON trả về từ API
  factory UnifiedUserResponse.fromJson(Map<String, dynamic> json) {
    return UnifiedUserResponse(
      id: json['id']?.toString(),
      email: json['email'],
      fullName: json['full_name'],
      phoneNumber: json['phone_number'],
      companyName: json['company_name'],
      websiteUrl: json['website_url'],
      avatarUrl: json['avatar_url'],
      isSuperuser: json['is_superuser'],
      emailVerified: json['email_verified'],
      countryCode: json['country_code'],
      locale: json['locale'],
      timezone: json['timezone'],
      currency: json['currency'],
      gender: json['gender'],
      birthDate:
          json['birth_date'] != null
              ? DateTime.tryParse(json['birth_date'])
              : null,
      bio: json['bio'],
      jobTitle: json['job_title'],
      inactiveAt:
          json['inactive_at'] != null
              ? DateTime.tryParse(json['inactive_at'])
              : null,
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.tryParse(json['updated_at'])
              : null,
      driverOrganizations:
          json['driver_organizations'] != null
              ? (json['driver_organizations'] as List)
                  .map((e) => DriverOrganizationResponse.fromJson(e))
                  .toList()
              : null,
      restaurantOrganizations:
          json['restaurant_organizations'] != null
              ? (json['restaurant_organizations'] as List)
                  .map((e) => RestaurantOrganizationResponse.fromJson(e))
                  .toList()
              : null,
      restaurants:
          json['restaurants'] != null
              ? (json['restaurants'] as List)
                  .map((e) => RestaurantResponse.fromJson(e))
                  .toList()
              : null,
      driverInfo:
          json['driver_info'] != null
              ? UserDriverInfo.fromJson(json['driver_info'])
              : null,
      customerInfo: json['customer_info'],
      roles:
          (json['roles'] as List?)
              ?.map((e) => UnifiedUserRole.fromJson(e))
              .toList(),
      billingInfo: json['billing_info'],
      subscriptions: json['subscriptions'] as List<dynamic>?,
    );
  }

  /// Chuyển về JSON (dùng cho gửi lên API hoặc lưu local)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'phone_number': phoneNumber,
      'company_name': companyName,
      'website_url': websiteUrl,
      'avatar_url': avatarUrl,
      'is_superuser': isSuperuser,
      'email_verified': emailVerified,
      'country_code': countryCode,
      'locale': locale,
      'timezone': timezone,
      'currency': currency,
      'gender': gender,
      'birth_date': birthDate?.toIso8601String(),
      'bio': bio,
      'job_title': jobTitle,
      'inactive_at': inactiveAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'driver_organizations':
          driverOrganizations?.map((e) => e.toJson()).toList(),
      'restaurant_organizations':
          restaurantOrganizations?.map((e) => e.toJson()).toList(),
      'restaurants': restaurants?.map((e) => e.toJson()).toList(),
      'driver_info': driverInfo?.toJson(),
      'customer_info': customerInfo,
      'roles': roles?.map((e) => e.toJson()).toList(),
      'billing_info': billingInfo,
      'subscriptions': subscriptions,
    };
  }
}

/// Model đại diện cho role của user trong unified user response
class UnifiedUserRole {
  final int? id;
  final int? roleId;
  final String? roleName;
  final String? roleLabel;
  final String? roleScope;
  final String? roleDescription;
  final int? driverOrgId;
  final int? restaurantOrgId;
  final int? restaurantId;
  final DriverOrganizationResponse? driverOrganization;
  final RestaurantOrganizationResponse? restaurantOrganization;
  final RestaurantResponse? restaurant;
  final DateTime? createdAt;

  UnifiedUserRole({
    this.id,
    this.roleId,
    this.roleName,
    this.roleLabel,
    this.roleScope,
    this.roleDescription,
    this.driverOrgId,
    this.restaurantOrgId,
    this.restaurantId,
    this.driverOrganization,
    this.restaurantOrganization,
    this.restaurant,
    this.createdAt,
  });

  factory UnifiedUserRole.fromJson(Map<String, dynamic> json) {
    return UnifiedUserRole(
      id: json['id'],
      roleId: json['role_id'],
      roleName: json['role_name'],
      roleLabel: json['role_label'],
      roleScope: json['role_scope'],
      roleDescription: json['role_description'],
      driverOrgId: json['driver_org_id'],
      restaurantOrgId: json['restaurant_org_id'],
      driverOrganization:
          json['driver_organization'] != null
              ? DriverOrganizationResponse.fromJson(json['driver_organization'])
              : null,
      restaurantOrganization:
          json['restaurant_organization'] != null
              ? RestaurantOrganizationResponse.fromJson(
                json['restaurant_organization'],
              )
              : null,
      restaurant:
          json['restaurant'] != null
              ? RestaurantResponse.fromJson(json['restaurant'])
              : null,
      restaurantId: json['restaurant_id'],
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role_id': roleId,
      'role_name': roleName,
      'role_label': roleLabel,
      'role_scope': roleScope,
      'role_description': roleDescription,
      'driver_org_id': driverOrgId,
      'restaurant_org_id': restaurantOrgId,
      'restaurant_id': restaurantId,
      'driver_organization': driverOrganization?.toJson(),
      'restaurant_organization': restaurantOrganization?.toJson(),
      'restaurant': restaurant?.toJson(),
      'created_at': createdAt?.toIso8601String(),
    };
  }
}

class UserDriverInfo {
  String? userId;
  String? type;
  int? driverOrgId;
  String? onboardingStatus;
  String? fullName;
  String? dateOfBirth;
  String? gender;
  String? nationality;
  String? idCardNumber;
  String? idCardIssueDate;
  String? idCardIssuePlace;
  String? emergencyContactName;
  String? emergencyContactPhone;
  String? emergencyContactRelationship;
  int? totalOrders;
  int? completedOrders;
  int? cancelledOrders;
  int? totalEarnings;
  int? totalDistance;
  int? ratingAverage;
  int? ratingCount;
  int? onTimeDeliveryRate;
  int? customerSatisfactionRate;
  bool? isActive;
  bool? isAvailable;
  bool? isOnline;
  double? currentLocationLatitude;
  double? currentLocationLongitude;
  String? lastLocationUpdate;
  String? lastActivity;
  String? createdAt;
  String? updatedAt;

  UserDriverInfo({
    this.userId,
    this.type,
    this.driverOrgId,
    this.onboardingStatus,
    this.fullName,
    this.dateOfBirth,
    this.gender,
    this.nationality,
    this.idCardNumber,
    this.idCardIssueDate,
    this.idCardIssuePlace,
    this.emergencyContactName,
    this.emergencyContactPhone,
    this.emergencyContactRelationship,
    this.totalOrders,
    this.completedOrders,
    this.cancelledOrders,
    this.totalEarnings,
    this.totalDistance,
    this.ratingAverage,
    this.ratingCount,
    this.onTimeDeliveryRate,
    this.customerSatisfactionRate,
    this.isActive,
    this.isAvailable,
    this.isOnline,
    this.currentLocationLatitude,
    this.currentLocationLongitude,
    this.lastLocationUpdate,
    this.lastActivity,
    this.createdAt,
    this.updatedAt,
  });

  UserDriverInfo.fromJson(Map<String, dynamic> json) {
    if (json["user_id"] is String) {
      userId = json["user_id"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["driver_org_id"] is int) {
      driverOrgId = json["driver_org_id"];
    }
    if (json["onboarding_status"] is String) {
      onboardingStatus = json["onboarding_status"];
    }
    if (json["full_name"] is String) {
      fullName = json["full_name"];
    }
    if (json["date_of_birth"] is String) {
      dateOfBirth = json["date_of_birth"];
    }
    if (json["gender"] is String) {
      gender = json["gender"];
    }
    if (json["nationality"] is String) {
      nationality = json["nationality"];
    }
    if (json["id_card_number"] is String) {
      idCardNumber = json["id_card_number"];
    }
    if (json["id_card_issue_date"] is String) {
      idCardIssueDate = json["id_card_issue_date"];
    }
    if (json["id_card_issue_place"] is String) {
      idCardIssuePlace = json["id_card_issue_place"];
    }
    if (json["emergency_contact_name"] is String) {
      emergencyContactName = json["emergency_contact_name"];
    }
    if (json["emergency_contact_phone"] is String) {
      emergencyContactPhone = json["emergency_contact_phone"];
    }
    if (json["emergency_contact_relationship"] is String) {
      emergencyContactRelationship = json["emergency_contact_relationship"];
    }
    if (json["total_orders"] is int) {
      totalOrders = json["total_orders"];
    }
    if (json["completed_orders"] is int) {
      completedOrders = json["completed_orders"];
    }
    if (json["cancelled_orders"] is int) {
      cancelledOrders = json["cancelled_orders"];
    }
    if (json["total_earnings"] is int) {
      totalEarnings = json["total_earnings"];
    }
    if (json["total_distance"] is int) {
      totalDistance = json["total_distance"];
    }
    if (json["rating_average"] is int) {
      ratingAverage = json["rating_average"];
    }
    if (json["rating_count"] is int) {
      ratingCount = json["rating_count"];
    }
    if (json["on_time_delivery_rate"] is int) {
      onTimeDeliveryRate = json["on_time_delivery_rate"];
    }
    if (json["customer_satisfaction_rate"] is int) {
      customerSatisfactionRate = json["customer_satisfaction_rate"];
    }
    if (json["is_active"] is bool) {
      isActive = json["is_active"];
    }
    if (json["is_available"] is bool) {
      isAvailable = json["is_available"];
    }
    if (json["is_online"] is bool) {
      isOnline = json["is_online"];
    }
    if (json["current_location_latitude"] is double) {
      currentLocationLatitude = json["current_location_latitude"];
    }
    if (json["current_location_longitude"] is double) {
      currentLocationLongitude = json["current_location_longitude"];
    }
    if (json["last_location_update"] is String) {
      lastLocationUpdate = json["last_location_update"];
    }
    if (json["last_activity"] is String) {
      lastActivity = json["last_activity"];
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
  }

  static List<UserDriverInfo> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserDriverInfo.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["user_id"] = userId;
    _data["type"] = type;
    _data["driver_org_id"] = driverOrgId;
    _data["onboarding_status"] = onboardingStatus;
    _data["full_name"] = fullName;
    _data["date_of_birth"] = dateOfBirth;
    _data["gender"] = gender;
    _data["nationality"] = nationality;
    _data["id_card_number"] = idCardNumber;
    _data["id_card_issue_date"] = idCardIssueDate;
    _data["id_card_issue_place"] = idCardIssuePlace;
    _data["emergency_contact_name"] = emergencyContactName;
    _data["emergency_contact_phone"] = emergencyContactPhone;
    _data["emergency_contact_relationship"] = emergencyContactRelationship;
    _data["total_orders"] = totalOrders;
    _data["completed_orders"] = completedOrders;
    _data["cancelled_orders"] = cancelledOrders;
    _data["total_earnings"] = totalEarnings;
    _data["total_distance"] = totalDistance;
    _data["rating_average"] = ratingAverage;
    _data["rating_count"] = ratingCount;
    _data["on_time_delivery_rate"] = onTimeDeliveryRate;
    _data["customer_satisfaction_rate"] = customerSatisfactionRate;
    _data["is_active"] = isActive;
    _data["is_available"] = isAvailable;
    _data["is_online"] = isOnline;
    _data["current_location_latitude"] = currentLocationLatitude;
    _data["current_location_longitude"] = currentLocationLongitude;
    _data["last_location_update"] = lastLocationUpdate;
    _data["last_activity"] = lastActivity;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}
