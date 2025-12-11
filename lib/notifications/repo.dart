import 'package:internal_core/network/network_resources/resources.dart';

import '../models/models.dart' show ListResponse;
import 'app_api.dart';
import 'models/models.dart';

class NotificationsRepo {
  NotificationsRepo._();
  static NotificationsRepo? _instance;

  factory NotificationsRepo([NotificationsApi? api]) {
    _instance ??= NotificationsRepo._();
    _instance!._api = api ?? NotificationsApiImpl();
    return _instance!;
  }

  late NotificationsApi _api;

  /// Get user notifications with pagination and optional filter
  ///
  /// Parameters:
  /// - [page]: Page number (default=1, ge=1)
  /// - [size]: Page size (default=10, ge=1, le=100)
  /// - [onlyUnread]: Filter to get only unread notifications
  Future<NetworkResponse<ListResponse<UserNotificationResponse>>>
  getUserNotifications({int? page, int? size, bool? onlyUnread}) =>
      _api.getUserNotifications(page: page, size: size, onlyUnread: onlyUnread);

  /// Get count of unread notifications for the current user
  Future<NetworkResponse<int>> getUnreadCount() => _api.getUnreadCount();

  /// Mark notifications as read
  ///
  /// Parameters:
  /// - [request]: Contains notification_ids list and mark_all flag
  ///
  /// If mark_all=true, all notifications will be marked as read.
  /// Otherwise, only notifications with IDs in notification_ids will be marked as read.
  Future<NetworkResponse<void>> markAsRead(
    NotificationMarkReadRequest request,
  ) => _api.markAsRead(request);
}
