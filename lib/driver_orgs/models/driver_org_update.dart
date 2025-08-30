class DriverOrganizationUpdate {
  final String? name;
  final String? description;
  final String? logoUrl;
  final String? contactEmail;
  final String? contactPhone;
  final String? websiteUrl;
  final String? taxCode;
  final String? businessLicense;
  final String? businessType;
  final String? companySize;
  final String? establishmentDate; // yyyy-MM-dd
  final bool? isActive;
  final bool? isFeatured;

  DriverOrganizationUpdate({
    this.name,
    this.description,
    this.logoUrl,
    this.contactEmail,
    this.contactPhone,
    this.websiteUrl,
    this.taxCode,
    this.businessLicense,
    this.businessType,
    this.companySize,
    this.establishmentDate,
    this.isActive,
    this.isFeatured,
  });

  factory DriverOrganizationUpdate.fromJson(Map<String, dynamic> json) {
    return DriverOrganizationUpdate(
      name: json['name'] as String?,
      description: json['description'] as String?,
      logoUrl: json['logo_url'] as String?,
      contactEmail: json['contact_email'] as String?,
      contactPhone: json['contact_phone'] as String?,
      websiteUrl: json['website_url'] as String?,
      taxCode: json['tax_code'] as String?,
      businessLicense: json['business_license'] as String?,
      businessType: json['business_type'] as String?,
      companySize: json['company_size'] as String?,
      establishmentDate: json['establishment_date'] as String?,
      isActive: json['is_active'] as bool?,
      isFeatured: json['is_featured'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (logoUrl != null) 'logo_url': logoUrl,
      if (contactEmail != null) 'contact_email': contactEmail,
      if (contactPhone != null) 'contact_phone': contactPhone,
      if (websiteUrl != null) 'website_url': websiteUrl,
      if (taxCode != null) 'tax_code': taxCode,
      if (businessLicense != null) 'business_license': businessLicense,
      if (businessType != null) 'business_type': businessType,
      if (companySize != null) 'company_size': companySize,
      if (establishmentDate != null) 'establishment_date': establishmentDate,
      if (isActive != null) 'is_active': isActive,
      if (isFeatured != null) 'is_featured': isFeatured,
    };
  }
}
