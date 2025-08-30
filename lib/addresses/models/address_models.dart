class AddressCreate {
  final String? refType;
  final String? refId;
  final String? street;
  final String? ward;
  final String? district;
  final String? city;
  final String? country;
  final String? postalCode;
  final String? formattedAddress;
  final double? latitude;
  final double? longitude;
  final bool? isPrimary;
  final String? label;

  AddressCreate({
    this.refType,
    this.refId,
    this.street,
    this.ward,
    this.district,
    this.city,
    this.country,
    this.postalCode,
    this.formattedAddress,
    this.latitude,
    this.longitude,
    this.isPrimary,
    this.label,
  });

  Map<String, dynamic> toJson() => {
        if (refType != null) 'ref_type': refType,
        if (refId != null) 'ref_id': refId,
        if (street != null) 'street': street,
        if (ward != null) 'ward': ward,
        if (district != null) 'district': district,
        if (city != null) 'city': city,
        if (country != null) 'country': country,
        if (postalCode != null) 'postal_code': postalCode,
        if (formattedAddress != null) 'formatted_address': formattedAddress,
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
        if (isPrimary != null) 'is_primary': isPrimary,
        if (label != null) 'label': label,
      };
}

class AddressResponse {
  final String id;
  final String? refType;
  final String? refId;
  final String? street;
  final String? ward;
  final String? district;
  final String? city;
  final String? country;
  final String? postalCode;
  final String? formattedAddress;
  final double? latitude;
  final double? longitude;
  final bool? isPrimary;
  final String? label;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AddressResponse({
    required this.id,
    this.refType,
    this.refId,
    this.street,
    this.ward,
    this.district,
    this.city,
    this.country,
    this.postalCode,
    this.formattedAddress,
    this.latitude,
    this.longitude,
    this.isPrimary,
    this.label,
    this.createdAt,
    this.updatedAt,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      AddressResponse(
        id: json['id'] as String,
        refType: json['ref_type'] as String?,
        refId: json['ref_id'] as String?,
        street: json['street'] as String?,
        ward: json['ward'] as String?,
        district: json['district'] as String?,
        city: json['city'] as String?,
        country: json['country'] as String?,
        postalCode: json['postal_code'] as String?,
        formattedAddress: json['formatted_address'] as String?,
        latitude: json['latitude'] as double?,
        longitude: json['longitude'] as double?,
        isPrimary: json['is_primary'] as bool?,
        label: json['label'] as String?,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'] as String)
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'] as String)
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'ref_type': refType,
        'ref_id': refId,
        'street': street,
        'ward': ward,
        'district': district,
        'city': city,
        'country': country,
        'postal_code': postalCode,
        'formatted_address': formattedAddress,
        'latitude': latitude,
        'longitude': longitude,
        'is_primary': isPrimary,
        'address_label': label,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
