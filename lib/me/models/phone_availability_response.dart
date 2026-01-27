class PhoneAvailabilityResponse {
  bool? isAvailable;

  PhoneAvailabilityResponse({this.isAvailable});

  PhoneAvailabilityResponse.fromJson(Map<String, dynamic> json) {
    isAvailable = json["is_available"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["is_available"] = isAvailable;
    return data;
  }
}
