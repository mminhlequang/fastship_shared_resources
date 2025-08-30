/// Model cho input tạo/cập nhật Restaurant Organization.
/// Chuẩn theo JSON:
/// {
///   "name": "string",
///   "description": "string",
///   "logo_url": "string",
///   "contact_email": "string",
///   "contact_phone": "string",
///   "website_url": "string",
///   "tax_code": "string",
///   "business_license": "string",
///   "headquarters_address_id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
///   "business_type": "restaurant",
///   "cuisine_type": [ "string" ],
///   "company_size": "small",
///   "establishment_date": "2025-08-16",
///   "verification_status": "pending",
///   "rejection_reason": "string",
///   "is_active": true,
///   "is_featured": false,
///   "is_verified": false,
///   "is_chain": false
/// }
class RestaurantOrganizationInput {
  String? name;
  String? description;
  String? logoUrl;
  String? contactEmail;
  String? contactPhone;
  String? websiteUrl;
  String? taxCode;
  String? businessLicense;
  String? headquartersAddressId;
  String? businessType;
  List<String>? cuisineType;
  String? companySize;
  String? establishmentDate; // ISO date (yyyy-MM-dd)
  String? verificationStatus;
  String? rejectionReason;
  bool? isActive;
  bool? isFeatured;
  bool? isVerified;
  bool? isChain;

  RestaurantOrganizationInput({
    this.name,
    this.description,
    this.logoUrl,
    this.contactEmail,
    this.contactPhone,
    this.websiteUrl,
    this.taxCode,
    this.businessLicense,
    this.headquartersAddressId,
    this.businessType,
    this.cuisineType,
    this.companySize,
    this.establishmentDate,
    this.verificationStatus,
    this.rejectionReason,
    this.isActive,
    this.isFeatured,
    this.isVerified,
    this.isChain,
  });

  factory RestaurantOrganizationInput.fromJson(Map<String, dynamic> json) {
    return RestaurantOrganizationInput(
      name: json['name'],
      description: json['description'],
      logoUrl: json['logo_url'],
      contactEmail: json['contact_email'],
      contactPhone: json['contact_phone'],
      websiteUrl: json['website_url'],
      taxCode: json['tax_code'],
      businessLicense: json['business_license'],
      headquartersAddressId: json['headquarters_address_id'],
      businessType: json['business_type'],
      cuisineType:
          (json['cuisine_type'] as List?)?.map((e) => e.toString()).toList(),
      companySize: json['company_size'],
      establishmentDate: json['establishment_date'],
      verificationStatus: json['verification_status'],
      rejectionReason: json['rejection_reason'],
      isActive: json['is_active'],
      isFeatured: json['is_featured'],
      isVerified: json['is_verified'],
      isChain: json['is_chain'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (description != null) data['description'] = description;
    if (logoUrl != null) data['logo_url'] = logoUrl;
    if (contactEmail != null) data['contact_email'] = contactEmail;
    if (contactPhone != null) data['contact_phone'] = contactPhone;
    if (websiteUrl != null) data['website_url'] = websiteUrl;
    if (taxCode != null) data['tax_code'] = taxCode;
    if (businessLicense != null) data['business_license'] = businessLicense;
    if (headquartersAddressId != null) {
      data['headquarters_address_id'] = headquartersAddressId;
    }
    if (businessType != null) data['business_type'] = businessType;
    if (cuisineType != null) data['cuisine_type'] = cuisineType;
    if (companySize != null) data['company_size'] = companySize;
    if (establishmentDate != null) {
      data['establishment_date'] = establishmentDate;
    }
    if (verificationStatus != null) {
      data['verification_status'] = verificationStatus;
    }
    if (rejectionReason != null) data['rejection_reason'] = rejectionReason;
    if (isActive != null) data['is_active'] = isActive;
    if (isFeatured != null) data['is_featured'] = isFeatured;
    if (isVerified != null) data['is_verified'] = isVerified;
    if (isChain != null) data['is_chain'] = isChain;
    return data;
  }
}

class RestaurantOrganizationResponse {
  int? id;
  String? name;
  String? businessType;
  String? description;
  String? logoUrl;
  String? contactEmail;
  String? contactPhone;
  String? websiteUrl;
  String? taxCode;
  String? businessLicense;
  int? headquartersAddressId;
  List<String>? cuisineType;
  String? companySize;
  String? establishmentDate;
  bool? isActive;
  bool? isVerified;
  String? verificationStatus;
  String? rejectionReason;
  DateTime? verificationDate;
  String? verifiedBy;
  int? totalRestaurants;
  int? activeRestaurants;
  int? totalOrders;
  int? totalRevenue;
  double? ratingAverage;
  int? ratingCount;
  DateTime? createdAt;
  DateTime? updatedAt;

  RestaurantOrganizationResponse({
    this.id,
    this.name,
    this.description,
    this.logoUrl,
    this.contactEmail,
    this.contactPhone,
    this.websiteUrl,
    this.taxCode,
    this.businessLicense,
    this.headquartersAddressId,
    this.cuisineType,
    this.companySize,
    this.establishmentDate,
    this.isActive,
    this.isVerified,
    this.verificationStatus,
    this.rejectionReason,
    this.verificationDate,
    this.verifiedBy,
    this.totalRestaurants,
    this.activeRestaurants,
    this.totalOrders,
    this.totalRevenue,
    this.ratingAverage,
    this.ratingCount,
    this.createdAt,
    this.updatedAt,
  });

  RestaurantOrganizationResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    logoUrl = json['logo_url'];
    contactEmail = json['contact_email'];
    contactPhone = json['contact_phone'];
    websiteUrl = json['website_url'];
    taxCode = json['tax_code'];
    businessLicense = json['business_license'];
    headquartersAddressId = json['headquarters_address_id'];
    cuisineType =
        (json['cuisine_type'] as List?)?.map((e) => e.toString()).toList();
    companySize = json['company_size'];
    establishmentDate = json['establishment_date'];
    isActive = json['is_active'];
    isVerified = json['is_verified'];
    verificationStatus = json['verification_status'];
    rejectionReason = json['rejection_reason'];
    verificationDate = json['verification_date'] != null
        ? DateTime.tryParse(json['verification_date'])
        : null;
    verifiedBy = json['verified_by']?.toString();
    totalRestaurants = json['total_restaurants'];
    activeRestaurants = json['active_restaurants'];
    totalOrders = json['total_orders'];
    totalRevenue = json['total_revenue'];
    ratingAverage = (json['rating_average'] as num?)?.toDouble();
    ratingCount = json['rating_count'];
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    updatedAt =
        json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['logo_url'] = logoUrl;
    data['contact_email'] = contactEmail;
    data['contact_phone'] = contactPhone;
    data['website_url'] = websiteUrl;
    data['tax_code'] = taxCode;
    data['business_license'] = businessLicense;
    data['headquarters_address_id'] = headquartersAddressId;
    data['cuisine_type'] = cuisineType;
    data['company_size'] = companySize;
    data['establishment_date'] = establishmentDate;
    data['is_active'] = isActive;
    data['is_verified'] = isVerified;
    data['verification_status'] = verificationStatus;
    data['rejection_reason'] = rejectionReason;
    data['verification_date'] = verificationDate?.toIso8601String();
    data['verified_by'] = verifiedBy;
    data['total_restaurants'] = totalRestaurants;
    data['active_restaurants'] = activeRestaurants;
    data['total_orders'] = totalOrders;
    data['total_revenue'] = totalRevenue;
    data['rating_average'] = ratingAverage;
    data['rating_count'] = ratingCount;
    data['created_at'] = createdAt?.toIso8601String();
    data['updated_at'] = updatedAt?.toIso8601String();
    return data;
  }
}
