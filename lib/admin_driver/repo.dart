import 'package:internal_core/network/network_resources/resources.dart';

import '../admin/models/models.dart';
import 'app_api.dart';
import 'models/models.dart';
import '../models/models.dart';

class AdminDriversRepo {
  AdminDriversRepo._();
  static AdminDriversRepo? _instance;

  factory AdminDriversRepo([AdminDriversApi? api]) {
    _instance ??= AdminDriversRepo._();
    _instance!._api = api ?? DriversApiImpl();
    return _instance!;
  }

  late AdminDriversApi _api;

  Future<NetworkResponse<UnifiedUserResponse>> createDriverAdmin(
    DriverCreate create,
  ) => _api.createDriverAdmin(create);

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
  }) => _api.getDriversAdmin(
    offset: offset,
    limit: limit,
    search: search,
    isOnline: isOnline,
    isAvailable: isAvailable,
    isActive: isActive,
    driverOrgId: driverOrgId,
    minRating: minRating,
    centerLat: centerLat,
    centerLng: centerLng,
    radiusKm: radiusKm,
  );

  Future<NetworkResponse<UnifiedUserResponse>> getDriverAdmin(int driverId) =>
      _api.getDriverAdmin(driverId);

  Future<NetworkResponse<UnifiedUserResponse>> updateDriverAdmin(
    int driverId,
    DriverUpdate update,
  ) => _api.updateDriverAdmin(driverId, update);

  Future<NetworkResponse<void>> deleteDriverAdmin(int driverId) =>
      _api.deleteDriverAdmin(driverId);
}
