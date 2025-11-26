import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';

import '../models/models.dart' show ListResponse;
import 'models/models.dart';

class _NotificationsEndpoint {
  _NotificationsEndpoint._();

  // User Notification APIs
  static String getUserNotifications() => "/api/v1/notifications/user/me";
  static String getUnreadCount() =>
      "/api/v1/notifications/user/me/unread/count";
  static String markAsRead() => "/api/v1/notifications/user/me/mark-read";
}

abstract class NotificationsApi {
  /// Get user notifications with pagination and optional filter
  Future<NetworkResponse<ListResponse<UserNotificationResponse>>>
  getUserNotifications({int? page, int? size, bool? onlyUnread});

  /// Get count of unread notifications
  Future<NetworkResponse<int>> getUnreadCount();

  /// Mark notifications as read
  Future<NetworkResponse<void>> markAsRead(NotificationMarkReadRequest request);
}

class NotificationsApiImpl extends NotificationsApi {
  @override
  Future<NetworkResponse<ListResponse<UserNotificationResponse>>>
  getUserNotifications({int? page, int? size, bool? onlyUnread}) async {
    return await handleNetworkError(
      proccess: () async {
        final queryParams = <String, dynamic>{};
        if (page != null) queryParams['page'] = page;
        if (size != null) queryParams['size'] = size;
        if (onlyUnread != null) queryParams['only_unread'] = onlyUnread;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _NotificationsEndpoint.getUserNotifications(),
          queryParameters: queryParams,
        );

        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse<UserNotificationResponse>.fromJson(
                json,
                (item) => UserNotificationResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<int>> getUnreadCount() async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_NotificationsEndpoint.getUnreadCount());

        return NetworkResponse.fromResponse(
          response,
          converter: (json) => json as int,
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> markAsRead(
    NotificationMarkReadRequest request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_NotificationsEndpoint.markAsRead(), data: request.toJson());

        return NetworkResponse.fromResponse(
          response,
          converter: (json) => null,
        );
      },
    );
  }
}
