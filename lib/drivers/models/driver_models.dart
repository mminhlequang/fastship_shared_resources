class DriverCreate {
  final String? type;
  final int? driverOrgId;
  final String? onboardingStatus;
  final String? fullName;
  final String? dateOfBirth;
  final String? gender;
  final String? nationality;
  final String? idCardNumber;
  final String? idCardIssueDate;
  final String? idCardIssuePlace;
  final String? emergencyContactName;
  final String? emergencyContactPhone;
  final String? emergencyContactRelationship;
  final bool? isActive;
  final bool? isAvailable;
  final bool? isOnline;
  final String? email;
  final String? password;

  DriverCreate({
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
    this.isActive,
    this.isAvailable,
    this.isOnline,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        if (type != null) 'type': type,
        if (driverOrgId != null) 'driver_org_id': driverOrgId,
        if (onboardingStatus != null) 'onboarding_status': onboardingStatus,
        if (fullName != null) 'full_name': fullName,
        if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
        if (gender != null) 'gender': gender,
        if (nationality != null) 'nationality': nationality,
        if (idCardNumber != null) 'id_card_number': idCardNumber,
        if (idCardIssueDate != null) 'id_card_issue_date': idCardIssueDate,
        if (idCardIssuePlace != null) 'id_card_issue_place': idCardIssuePlace,
        if (emergencyContactName != null)
          'emergency_contact_name': emergencyContactName,
        if (emergencyContactPhone != null)
          'emergency_contact_phone': emergencyContactPhone,
        if (emergencyContactRelationship != null)
          'emergency_contact_relationship': emergencyContactRelationship,
        if (isActive != null) 'is_active': isActive,
        if (isAvailable != null) 'is_available': isAvailable,
        if (isOnline != null) 'is_online': isOnline,
        if (email != null) 'email': email,
        if (password != null) 'password': password,
      };

  factory DriverCreate.fromJson(Map<String, dynamic> json) => DriverCreate(
        type: json['type'] as String?,
        driverOrgId: json['driver_org_id'] as int?,
        onboardingStatus: json['onboarding_status'] as String?,
        fullName: json['full_name'] as String?,
        dateOfBirth: json['date_of_birth'] as String?,
        gender: json['gender'] as String?,
        nationality: json['nationality'] as String?,
        idCardNumber: json['id_card_number'] as String?,
        idCardIssueDate: json['id_card_issue_date'] as String?,
        idCardIssuePlace: json['id_card_issue_place'] as String?,
        emergencyContactName: json['emergency_contact_name'] as String?,
        emergencyContactPhone: json['emergency_contact_phone'] as String?,
        emergencyContactRelationship:
            json['emergency_contact_relationship'] as String?,
        isActive: json['is_active'] as bool?,
        isAvailable: json['is_available'] as bool?,
        isOnline: json['is_online'] as bool?,
        email: json['email'] as String?,
        password: json['password'] as String?,
      );
}

class DriverUpdate {
  final String? type;
  final int? driverOrgId;
  final String? onboardingStatus;
  final String? fullName;
  final String? dateOfBirth;
  final String? gender;
  final String? nationality;
  final String? idCardNumber;
  final String? idCardIssueDate;
  final String? idCardIssuePlace;
  final String? emergencyContactName;
  final String? emergencyContactPhone;
  final String? emergencyContactRelationship;
  final bool? isActive;
  final bool? isAvailable;
  final bool? isOnline;
  final int? totalOrders;
  final int? completedOrders;
  final int? cancelledOrders;
  final int? totalEarnings;
  final int? totalDistance;
  final double? ratingAverage;
  final int? ratingCount;
  final int? onTimeDeliveryRate;
  final int? customerSatisfactionRate;
  final double? currentLocationLatitude;
  final double? currentLocationLongitude;
  final String? lastLocationUpdate;
  final String? lastActivity;

  DriverUpdate({
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
    this.isActive,
    this.isAvailable,
    this.isOnline,
    this.totalOrders,
    this.completedOrders,
    this.cancelledOrders,
    this.totalEarnings,
    this.totalDistance,
    this.ratingAverage,
    this.ratingCount,
    this.onTimeDeliveryRate,
    this.customerSatisfactionRate,
    this.currentLocationLatitude,
    this.currentLocationLongitude,
    this.lastLocationUpdate,
    this.lastActivity,
  });

  Map<String, dynamic> toJson() => {
        if (type != null) 'type': type,
        if (driverOrgId != null) 'driver_org_id': driverOrgId,
        if (onboardingStatus != null) 'onboarding_status': onboardingStatus,
        if (fullName != null) 'full_name': fullName,
        if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
        if (gender != null) 'gender': gender,
        if (nationality != null) 'nationality': nationality,
        if (idCardNumber != null) 'id_card_number': idCardNumber,
        if (idCardIssueDate != null) 'id_card_issue_date': idCardIssueDate,
        if (idCardIssuePlace != null) 'id_card_issue_place': idCardIssuePlace,
        if (emergencyContactName != null)
          'emergency_contact_name': emergencyContactName,
        if (emergencyContactPhone != null)
          'emergency_contact_phone': emergencyContactPhone,
        if (emergencyContactRelationship != null)
          'emergency_contact_relationship': emergencyContactRelationship,
        if (isActive != null) 'is_active': isActive,
        if (isAvailable != null) 'is_available': isAvailable,
        if (isOnline != null) 'is_online': isOnline,
        if (totalOrders != null) 'total_orders': totalOrders,
        if (completedOrders != null) 'completed_orders': completedOrders,
        if (cancelledOrders != null) 'cancelled_orders': cancelledOrders,
        if (totalEarnings != null) 'total_earnings': totalEarnings,
        if (totalDistance != null) 'total_distance': totalDistance,
        if (ratingAverage != null) 'rating_average': ratingAverage,
        if (ratingCount != null) 'rating_count': ratingCount,
        if (onTimeDeliveryRate != null)
          'on_time_delivery_rate': onTimeDeliveryRate,
        if (customerSatisfactionRate != null)
          'customer_satisfaction_rate': customerSatisfactionRate,
        if (currentLocationLatitude != null)
          'current_location_latitude': currentLocationLatitude,
        if (currentLocationLongitude != null)
          'current_location_longitude': currentLocationLongitude,
        if (lastLocationUpdate != null)
          'last_location_update': lastLocationUpdate,
        if (lastActivity != null) 'last_activity': lastActivity,
      };

  factory DriverUpdate.fromJson(Map<String, dynamic> json) => DriverUpdate(
        type: json['type'] as String?,
        driverOrgId: json['driver_org_id'] as int?,
        onboardingStatus: json['onboarding_status'] as String?,
        fullName: json['full_name'] as String?,
        dateOfBirth: json['date_of_birth'] as String?,
        gender: json['gender'] as String?,
        nationality: json['nationality'] as String?,
        idCardNumber: json['id_card_number'] as String?,
        idCardIssueDate: json['id_card_issue_date'] as String?,
        idCardIssuePlace: json['id_card_issue_place'] as String?,
        emergencyContactName: json['emergency_contact_name'] as String?,
        emergencyContactPhone: json['emergency_contact_phone'] as String?,
        emergencyContactRelationship:
            json['emergency_contact_relationship'] as String?,
        isActive: json['is_active'] as bool?,
        isAvailable: json['is_available'] as bool?,
        isOnline: json['is_online'] as bool?,
        totalOrders: json['total_orders'] as int?,
        completedOrders: json['completed_orders'] as int?,
        cancelledOrders: json['cancelled_orders'] as int?,
        totalEarnings: json['total_earnings'] as int?,
        totalDistance: json['total_distance'] as int?,
        ratingAverage: (json['rating_average'] as num?)?.toDouble(),
        ratingCount: json['rating_count'] as int?,
        onTimeDeliveryRate: json['on_time_delivery_rate'] as int?,
        customerSatisfactionRate: json['customer_satisfaction_rate'] as int?,
        currentLocationLatitude:
            (json['current_location_latitude'] as num?)?.toDouble(),
        currentLocationLongitude:
            (json['current_location_longitude'] as num?)?.toDouble(),
        lastLocationUpdate: json['last_location_update'] as String?,
        lastActivity: json['last_activity'] as String?,
      );
}
