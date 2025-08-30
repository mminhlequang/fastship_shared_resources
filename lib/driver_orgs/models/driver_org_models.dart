class DriverOrganizationResponse {
  final int id;
  final String name;
  final String? description;
  final String? logoUrl;
  final String? contactEmail;
  final String? contactPhone;
  final String? websiteUrl;
  final String? taxCode;
  final String? businessLicense;
  final int? headquartersAddressId;
  final String? businessType;
  final String? companySize;
  final String? establishmentDate; // ISO date (yyyy-MM-dd)

  final String? verificationStatus;
  final DateTime? verificationDate;
  final String? verifiedBy;
  final String? rejectionReason;

  final int? totalDrivers;
  final int? activeDrivers;
  final int? totalOrders;
  final int? totalRevenue;
  final double? ratingAverage;
  final int? ratingCount;

  final bool isActive;
  final bool isFeatured;
  final bool isVerified;

  final DateTime createdAt;
  final DateTime updatedAt;

  DriverOrganizationResponse({
    required this.id,
    required this.name,
    this.description,
    this.logoUrl,
    this.contactEmail,
    this.contactPhone,
    this.websiteUrl,
    this.taxCode,
    this.businessLicense,
    this.headquartersAddressId,
    this.businessType,
    this.companySize,
    this.establishmentDate,
    this.verificationStatus,
    this.verificationDate,
    this.verifiedBy,
    this.rejectionReason,
    this.totalDrivers,
    this.activeDrivers,
    this.totalOrders,
    this.totalRevenue,
    this.ratingAverage,
    this.ratingCount,
    required this.isActive,
    required this.isFeatured,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Backward-compatible status used by UI widgets
  String get status {
    if (!isActive) return 'inactive';
    // If active, reflect verification status if present
    return (verificationStatus ?? (isVerified ? 'verified' : 'pending'))
        .toString();
  }

  factory DriverOrganizationResponse.fromJson(Map<String, dynamic> json) {
    return DriverOrganizationResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      logoUrl: json['logo_url'] as String?,
      contactEmail: json['contact_email'] as String?,
      contactPhone: json['contact_phone'] as String?,
      websiteUrl: json['website_url'] as String?,
      taxCode: json['tax_code'] as String?,
      businessLicense: json['business_license'] as String?,
      headquartersAddressId: json['headquarters_address_id'] as int?,
      businessType: json['business_type'] as String?,
      companySize: json['company_size'] as String?,
      establishmentDate: json['establishment_date'] as String?,
      verificationStatus: json['verification_status'] as String?,
      verificationDate: (json['verification_date'] != null)
          ? DateTime.tryParse(json['verification_date'])
          : null,
      verifiedBy: json['verified_by']?.toString(),
      rejectionReason: json['rejection_reason'] as String?,
      totalDrivers: json['total_drivers'] as int?,
      activeDrivers: json['active_drivers'] as int?,
      totalOrders: json['total_orders'] as int?,
      totalRevenue: json['total_revenue'] as int?,
      ratingAverage: (json['rating_average'] as num?)?.toDouble(),
      ratingCount: json['rating_count'] as int?,
      isActive: (json['is_active'] as bool?) ?? false,
      isFeatured: (json['is_featured'] as bool?) ?? false,
      isVerified: (json['is_verified'] as bool?) ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'logo_url': logoUrl,
      'contact_email': contactEmail,
      'contact_phone': contactPhone,
      'website_url': websiteUrl,
      'tax_code': taxCode,
      'business_license': businessLicense,
      'headquarters_address_id': headquartersAddressId,
      'business_type': businessType,
      'company_size': companySize,
      'establishment_date': establishmentDate,
      'verification_status': verificationStatus,
      'verification_date': verificationDate?.toIso8601String(),
      'verified_by': verifiedBy,
      'rejection_reason': rejectionReason,
      'total_drivers': totalDrivers,
      'active_drivers': activeDrivers,
      'total_orders': totalOrders,
      'total_revenue': totalRevenue,
      'rating_average': ratingAverage,
      'rating_count': ratingCount,
      'is_active': isActive,
      'is_featured': isFeatured,
      'is_verified': isVerified,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

// Deprecated in favor of generic ListResponse<T>
class DriverOrganizationListResponse {
  final List<DriverOrganizationResponse> data;
  final int? count;
  DriverOrganizationListResponse({required this.data, this.count});

  factory DriverOrganizationListResponse.fromJson(Map<String, dynamic> json) {
    return DriverOrganizationListResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              DriverOrganizationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'count': count,
    };
  }
}
