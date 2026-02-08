import 'package:internal_core/internal_core.dart';
import 'package:internal_core/network/network.dart';

import 'package:internal_core/network/network_resources/resources.dart';

import '../admin/models/models.dart';
import '../models/list_response.dart';
import 'models/models.dart';

class _AdminDriversEndpoint {
  _AdminDriversEndpoint._();

  static String base() => "/api/v1/admin/drivers/";
  static String byId(int driverId) => "/api/v1/admin/drivers/$driverId";
}

abstract class AdminDriversApi {
  Future<NetworkResponse<UnifiedUserResponse>> createDriverAdmin(
    DriverCreate create,
  );

  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>> getDriversAdmin({
    int offset,
    int limit,
    String? search,
    bool? isOnline,
    bool? isAvailable,
    bool? isActive,
    int? driverOrgId,
    num? minRating,
    num? centerLat,
    num? centerLng,
    num? radiusKm,
  });

  Future<NetworkResponse<UnifiedUserResponse>> getDriverAdmin(int driverId);

  Future<NetworkResponse<UnifiedUserResponse>> updateDriverAdmin(
    int driverId,
    DriverUpdate update,
  );

  Future<NetworkResponse<void>> deleteDriverAdmin(int driverId);
}

class DriversApiImpl extends AdminDriversApi {
  @override
  Future<NetworkResponse<UnifiedUserResponse>> createDriverAdmin(
    DriverCreate create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_AdminDriversEndpoint.base(), data: create.toJson());
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
    String? search,
    bool? isOnline,
    bool? isAvailable,
    bool? isActive,
    int? driverOrgId,
    num? minRating,
    num? centerLat,
    num? centerLng,
    num? radiusKm,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        void put(String k, dynamic v) {
          if (v != null) params[k] = v;
        }

        put('search', search);
        put('is_online', isOnline);
        put('is_available', isAvailable);
        put('is_active', isActive);
        put('driver_org_id', driverOrgId);
        put('min_rating', minRating);
        put('center_lat', centerLat);
        put('center_lng', centerLng);
        put('radius_km', radiusKm);

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_AdminDriversEndpoint.base(), queryParameters: params);

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
        ).get(_AdminDriversEndpoint.byId(driverId));
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
        ).put(_AdminDriversEndpoint.byId(driverId), data: update.toJson());
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
        ).delete(_AdminDriversEndpoint.byId(driverId));
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }
}
