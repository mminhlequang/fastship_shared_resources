class CustomerUpdate {
  final String? fullName;
  final String? phone;
  final String? email;
  final bool? isActive;
  final String? accountStatus;

  CustomerUpdate({
    this.fullName,
    this.phone,
    this.email,
    this.isActive,
    this.accountStatus,
  });

  Map<String, dynamic> toJson() => {
        if (fullName != null) 'full_name': fullName,
        if (phone != null) 'phone': phone,
        if (email != null) 'email': email,
        if (isActive != null) 'is_active': isActive,
        if (accountStatus != null) 'account_status': accountStatus,
      };
}

class CustomerResponse {
  final String id; // Changed to String (UUID) according to API spec
  final String? fullName;
  final String? phone;
  final String? email;
  final bool? isActive;
  final bool? isOnline;
  final String? accountStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CustomerResponse({
    required this.id,
    this.fullName,
    this.phone,
    this.email,
    this.isActive,
    this.isOnline,
    this.accountStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      CustomerResponse(
        id: json['id'] as String,
        fullName: json['full_name'] as String?,
        phone: json['phone'] as String?,
        email: json['email'] as String?,
        isActive: json['is_active'] as bool?,
        isOnline: json['is_online'] as bool?,
        accountStatus: json['account_status'] as String?,
        createdAt: json['created_at'] != null
            ? DateTime.tryParse(json['created_at'] as String)
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.tryParse(json['updated_at'] as String)
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': fullName,
        'phone': phone,
        'email': email,
        'is_active': isActive,
        'is_online': isOnline,
        'account_status': accountStatus,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
