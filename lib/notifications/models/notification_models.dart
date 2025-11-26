/// Model cho notification data
class NotificationData {
  final String id;
  final String title;
  final String body;
  final String type;
  final Map<String, dynamic>? data;
  final String createdAt;
  final String? sentAt;

  NotificationData({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    this.data,
    required this.createdAt,
    this.sentAt,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      type: json['type'] as String,
      data: json['data'] as Map<String, dynamic>?,
      createdAt: json['created_at'] as String,
      sentAt: json['sent_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'type': type,
      'data': data,
      'created_at': createdAt,
      'sent_at': sentAt,
    };
  }
}

/// Model cho user notification response
class UserNotificationResponse {
  final String id;
  final String notificationId;
  final String userId;
  final bool isRead;
  final String? readAt;
  final bool delivered;
  final String? deliveredAt;
  final NotificationData notification;

  UserNotificationResponse({
    required this.id,
    required this.notificationId,
    required this.userId,
    required this.isRead,
    this.readAt,
    required this.delivered,
    this.deliveredAt,
    required this.notification,
  });

  factory UserNotificationResponse.fromJson(Map<String, dynamic> json) {
    return UserNotificationResponse(
      id: json['id'] as String,
      notificationId: json['notification_id'] as String,
      userId: json['user_id'] as String,
      isRead: json['is_read'] as bool,
      readAt: json['read_at'] as String?,
      delivered: json['delivered'] as bool,
      deliveredAt: json['delivered_at'] as String?,
      notification: NotificationData.fromJson(
        json['notification'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'notification_id': notificationId,
      'user_id': userId,
      'is_read': isRead,
      'read_at': readAt,
      'delivered': delivered,
      'delivered_at': deliveredAt,
      'notification': notification.toJson(),
    };
  }
}

/// Model cho request mark notifications as read
class NotificationMarkReadRequest {
  final List<String> notificationIds;
  final bool markAll;

  NotificationMarkReadRequest({
    required this.notificationIds,
    this.markAll = false,
  });

  factory NotificationMarkReadRequest.fromJson(Map<String, dynamic> json) {
    return NotificationMarkReadRequest(
      notificationIds:
          (json['notification_ids'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      markAll: json['mark_all'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'notification_ids': notificationIds, 'mark_all': markAll};
  }
}
