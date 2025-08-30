class RegistrationRequestResponse {
  int? id;
  String? applicantType; // 'driver', 'restaurant'
  String? applicantSubtype; // 'individual', 'organization'
  Map<String, dynamic>? formData;
  String? status; // 'pending', 'approved', 'rejected'
  int? userId;
  DateTime? createdAt;
  DateTime? reviewedAt;
  String? note;
  // Newly added top-level fields from backend
  String? topLevelFullName; // maps from json key: full_name
  String? topLevelEmail; // maps from json key: email
  String? phoneNumber; // maps from json key: phone_number
  String? languageCode; // maps from json key: language_code
  String? countryCode; // maps from json key: country_code

  RegistrationRequestResponse({
    this.id,
    this.applicantType,
    this.applicantSubtype,
    this.formData,
    this.status,
    this.userId,
    this.createdAt,
    this.reviewedAt,
    this.note,
    this.topLevelFullName,
    this.topLevelEmail,
    this.phoneNumber,
    this.languageCode,
    this.countryCode,
  });

  RegistrationRequestResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    applicantType = json["applicant_type"];
    applicantSubtype = json["applicant_subtype"];
    formData = json["form_data"];
    status = json["status"];
    userId = json["user_id"];
    createdAt =
        json["created_at"] != null ? DateTime.parse(json["created_at"]) : null;
    reviewedAt = json["reviewed_at"] != null
        ? DateTime.parse(json["reviewed_at"])
        : null;
    note = json["note"];
    topLevelFullName = json["full_name"];
    topLevelEmail = json["email"];
    phoneNumber = json["phone_number"];
    languageCode = json["language_code"];
    countryCode = json["country_code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["applicant_type"] = applicantType;
    data["applicant_subtype"] = applicantSubtype;
    data["form_data"] = formData;
    data["status"] = status;
    data["user_id"] = userId;
    data["created_at"] = createdAt?.toIso8601String();
    data["reviewed_at"] = reviewedAt?.toIso8601String();
    data["note"] = note;
    data["full_name"] = topLevelFullName;
    data["email"] = topLevelEmail;
    data["phone_number"] = phoneNumber;
    data["language_code"] = languageCode;
    data["country_code"] = countryCode;
    return data;
  }

  // Helper methods to get typed form data
  String? get fullName => topLevelFullName ?? formData?["full_name"];
  String? get organizationName => formData?["organization_name"];
  String? get restaurantName => formData?["restaurant_name"];
  String? get phone => phoneNumber ?? formData?["phone"];
  String? get managerPhone => formData?["manager_phone"];
  String? get email => topLevelEmail ?? formData?["email"];
  String? get managerEmail => formData?["manager_email"];
  String? get city => formData?["city"];
  String? get address => formData?["address"];

  // Get display name based on type
  String get displayName {
    if (applicantType == 'driver') {
      if (applicantSubtype == 'individual') {
        return fullName ?? 'Unknown Driver';
      } else {
        return organizationName ?? 'Unknown Organization';
      }
    } else if (applicantType == 'restaurant') {
      if (applicantSubtype == 'individual') {
        return restaurantName ?? 'Unknown Restaurant';
      } else {
        return organizationName ?? 'Unknown Organization';
      }
    }
    return 'Unknown Applicant';
  }

  // Get contact info
  String get contactInfo {
    if (applicantType == 'driver') {
      if (applicantSubtype == 'individual') {
        return phone ?? email ?? '';
      } else {
        return managerPhone ?? managerEmail ?? '';
      }
    } else if (applicantType == 'restaurant') {
      if (applicantSubtype == 'individual') {
        return phone ?? email ?? '';
      } else {
        return managerPhone ?? managerEmail ?? '';
      }
    }
    return '';
  }

  // Get status color
  String get statusColor {
    switch (status) {
      case 'pending':
        return 'orange';
      case 'approved':
        return 'green';
      case 'rejected':
        return 'red';
      default:
        return 'grey';
    }
  }
}
