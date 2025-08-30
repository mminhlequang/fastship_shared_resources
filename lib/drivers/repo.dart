import 'package:internal_network/network_resources/resources.dart';

import '../admin/models/models.dart';
import 'app_api.dart';
import 'models/models.dart';
import '../models/models.dart';

class DriversRepo {
  DriversRepo._();
  static DriversRepo? _instance;

  factory DriversRepo([DriversApi? api]) {
    _instance ??= DriversRepo._();
    _instance!._api = api ?? DriversApiImpl();
    return _instance!;
  }

  late DriversApi _api;

  Future<NetworkResponse<UnifiedUserResponse>> createDriverAdmin(
          DriverCreate create) =>
      _api.createDriverAdmin(create);

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
  }) =>
      _api.getDriversAdmin(
        offset: offset,
        limit: limit,
        type: type,
        driverOrgId: driverOrgId,
        onboardingStatus: onboardingStatus,
        gender: gender,
        nationality: nationality,
        isActive: isActive,
        isAvailable: isAvailable,
        isOnline: isOnline,
        minRating: minRating,
        maxRating: maxRating,
        minOrders: minOrders,
        maxOrders: maxOrders,
        minEarnings: minEarnings,
        maxEarnings: maxEarnings,
        search: search,
        createdAfter: createdAfter,
        createdBefore: createdBefore,
        lastActivityAfter: lastActivityAfter,
        lastActivityBefore: lastActivityBefore,
      );

  Future<NetworkResponse<UnifiedUserResponse>> getDriverAdmin(int driverId) =>
      _api.getDriverAdmin(driverId);

  Future<NetworkResponse<UnifiedUserResponse>> updateDriverAdmin(
          int driverId, DriverUpdate update) =>
      _api.updateDriverAdmin(driverId, update);

  Future<NetworkResponse<void>> deleteDriverAdmin(int driverId) =>
      _api.deleteDriverAdmin(driverId);

  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>>
      getDriversByOrganizationAdmin(
    int driverOrgId, {
    int offset = 0,
    int limit = 100,
    bool? isActive,
    bool? isAvailable,
    String? onboardingStatus,
    String? search,
  }) =>
          _api.getDriversByOrganizationAdmin(
            driverOrgId,
            offset: offset,
            limit: limit,
            isActive: isActive,
            isAvailable: isAvailable,
            onboardingStatus: onboardingStatus,
            search: search,
          );
}
