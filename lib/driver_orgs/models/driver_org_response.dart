class DriverOrganizationDetailResponse {
  final int id;
  final String name;
  final String? description;
  final String? address;
  final String? phone;
  final String? email;
  final String? website;
  final String? logo;
  final String? status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<DriverInfo> drivers;
  final List<VehicleInfo> vehicles;

  DriverOrganizationDetailResponse({
    required this.id,
    required this.name,
    this.description,
    this.address,
    this.phone,
    this.email,
    this.website,
    this.logo,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.drivers,
    required this.vehicles,
  });

  factory DriverOrganizationDetailResponse.fromJson(Map<String, dynamic> json) {
    return DriverOrganizationDetailResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      logo: json['logo'] as String?,
      status: json['status'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      drivers: (json['drivers'] as List<dynamic>?)
              ?.map((e) => DriverInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      vehicles: (json['vehicles'] as List<dynamic>?)
              ?.map((e) => VehicleInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'address': address,
      'phone': phone,
      'email': email,
      'website': website,
      'logo': logo,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'drivers': drivers.map((e) => e.toJson()).toList(),
      'vehicles': vehicles.map((e) => e.toJson()).toList(),
    };
  }
}

class DriverInfo {
  final int id;
  final String name;
  final String? phone;
  final String? email;
  final String status;

  DriverInfo({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    required this.status,
  });

  factory DriverInfo.fromJson(Map<String, dynamic> json) {
    return DriverInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'status': status,
    };
  }
}

class VehicleInfo {
  final int id;
  final String plateNumber;
  final String? model;
  final String? brand;
  final String status;

  VehicleInfo({
    required this.id,
    required this.plateNumber,
    this.model,
    this.brand,
    required this.status,
  });

  factory VehicleInfo.fromJson(Map<String, dynamic> json) {
    return VehicleInfo(
      id: json['id'] as int,
      plateNumber: json['plate_number'] as String,
      model: json['model'] as String?,
      brand: json['brand'] as String?,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'plate_number': plateNumber,
      'model': model,
      'brand': brand,
      'status': status,
    };
  }
}
