/// Model cho register FCM device token request
class FCMTokenRegisterRequest {
  final String token;
  final String platform;
  final String clientType;

  FCMTokenRegisterRequest({
    required this.token,
    required this.platform,
    required this.clientType,
  });

  factory FCMTokenRegisterRequest.fromJson(Map<String, dynamic> json) {
    return FCMTokenRegisterRequest(
      token: json['token'] as String,
      platform: json['platform'] as String,
      clientType: json['client_type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'token': token, 'platform': platform, 'client_type': clientType};
  }
}

/// Model cho FCM device token response
class FCMTokenResponse {
  final String userId;
  final String token;
  final String platform;
  final String clientType;
  final bool isActive;
  final String id;
  final DateTime createdAt;
  final DateTime lastSeenAt;

  FCMTokenResponse({
    required this.userId,
    required this.token,
    required this.platform,
    required this.clientType,
    required this.isActive,
    required this.id,
    required this.createdAt,
    required this.lastSeenAt,
  });

  factory FCMTokenResponse.fromJson(Map<String, dynamic> json) {
    return FCMTokenResponse(
      userId: json['user_id'] as String,
      token: json['token'] as String,
      platform: json['platform'] as String,
      clientType: json['client_type'] as String,
      isActive: json['is_active'] as bool,
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      lastSeenAt: DateTime.parse(json['last_seen_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'token': token,
      'platform': platform,
      'client_type': clientType,
      'is_active': isActive,
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'last_seen_at': lastSeenAt.toIso8601String(),
    };
  }
}
