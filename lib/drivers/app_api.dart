import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';


import '../admin/models/models.dart';
import '../models/list_response.dart';
import 'models/models.dart';

class _DriversEndpoint {
  _DriversEndpoint._();

  static String base() => "/api/v1/drivers/admin";
  static String byId(int driverId) => "/api/v1/drivers/admin/$driverId";
  static String byOrganization(int driverOrgId) =>
      "/api/v1/drivers/admin/organization/$driverOrgId";
}

abstract class DriversApi {
  Future<NetworkResponse<UnifiedUserResponse>> createDriverAdmin(
    DriverCreate create,
  );

  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>> getDriversAdmin({
    int offset,
    int limit,
    String? type,
    int? driverOrgId,
    String? onboardingStatus,
    String? gender,
    String? nationality,
    bool? isActive,
    bool? isAvailable,
    bool? isOnline,
    num? minRating,
    num? maxRating,
    int? minOrders,
    int? maxOrders,
    int? minEarnings,
    int? maxEarnings,
    String? search,
    String? createdAfter,
    String? createdBefore,
    String? lastActivityAfter,
    String? lastActivityBefore,
  });

  Future<NetworkResponse<UnifiedUserResponse>> getDriverAdmin(int driverId);

  Future<NetworkResponse<UnifiedUserResponse>> updateDriverAdmin(
    int driverId,
    DriverUpdate update,
  );

  Future<NetworkResponse<void>> deleteDriverAdmin(int driverId);

  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>>
  getDriversByOrganizationAdmin(
    int driverOrgId, {
    int offset,
    int limit,
    bool? isActive,
    bool? isAvailable,
    String? onboardingStatus,
    String? search,
  });
}

class DriversApiImpl extends DriversApi {
  @override
  Future<NetworkResponse<UnifiedUserResponse>> createDriverAdmin(
    DriverCreate create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_DriversEndpoint.base(), data: create.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => UnifiedUserResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>> getDriversAdmin({
    int offset = 0,
    int limit = 100,
    String? type,
    int? driverOrgId,
    String? onboardingStatus,
    String? gender,
    String? nationality,
    bool? isActive,
    bool? isAvailable,
    bool? isOnline,
    num? minRating,
    num? maxRating,
    int? minOrders,
    int? maxOrders,
    int? minEarnings,
    int? maxEarnings,
    String? search,
    String? createdAfter,
    String? createdBefore,
    String? lastActivityAfter,
    String? lastActivityBefore,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        void put(String k, dynamic v) {
          if (v != null) params[k] = v;
        }

        put('type', type);
        put('driver_org_id', driverOrgId);
        put('onboarding_status', onboardingStatus);
        put('gender', gender);
        put('nationality', nationality);
        put('is_active', isActive);
        put('is_available', isAvailable);
        put('is_online', isOnline);
        put('min_rating', minRating);
        put('max_rating', maxRating);
        put('min_orders', minOrders);
        put('max_orders', maxOrders);
        put('min_earnings', minEarnings);
        put('max_earnings', maxEarnings);
        put('search', search);
        put('created_after', createdAfter);
        put('created_before', createdBefore);
        put('last_activity_after', lastActivityAfter);
        put('last_activity_before', lastActivityBefore);

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_DriversEndpoint.base(), queryParameters: params);

        return NetworkResponse.fromResponse(
          response,
          converter: (json) {
            return ListResponse<UnifiedUserResponse>.fromJson(
              json,
              (item) =>
                  UnifiedUserResponse.fromJson(item as Map<String, dynamic>),
            );
          },
        );
      },
    );
  }

  @override
  Future<NetworkResponse<UnifiedUserResponse>> getDriverAdmin(
    int driverId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_DriversEndpoint.byId(driverId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => UnifiedUserResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<UnifiedUserResponse>> updateDriverAdmin(
    int driverId,
    DriverUpdate update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(_DriversEndpoint.byId(driverId), data: update.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => UnifiedUserResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteDriverAdmin(int driverId) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_DriversEndpoint.byId(driverId));
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>>
  getDriversByOrganizationAdmin(
    int driverOrgId, {
    int offset = 0,
    int limit = 100,
    bool? isActive,
    bool? isAvailable,
    String? onboardingStatus,
    String? search,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        void put(String k, dynamic v) {
          if (v != null) params[k] = v;
        }

        put('is_active', isActive);
        put('is_available', isAvailable);
        put('onboarding_status', onboardingStatus);
        put('search', search);

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _DriversEndpoint.byOrganization(driverOrgId),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) {
            return ListResponse<UnifiedUserResponse>.fromJson(
              json,
              (item) =>
                  UnifiedUserResponse.fromJson(item as Map<String, dynamic>),
            );
          },
        );
      },
    );
  }
}
