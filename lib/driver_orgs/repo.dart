import 'package:internal_network/network_resources/resources.dart';

import 'app_api.dart';
import 'models/models.dart';
import '../models/models.dart' show ListResponse;
import '../admin/models/models.dart';

class DriverOrgsRepo {
  DriverOrgsRepo._();
  static DriverOrgsRepo? _instance;

  factory DriverOrgsRepo([DriverOrganizationsApi? api]) {
    _instance ??= DriverOrgsRepo._();
    _instance!._api = api ?? DriverOrganizationsApiImpl();
    return _instance!;
  }

  late DriverOrganizationsApi _api;

  // Admin - Organizations
  Future<NetworkResponse<DriverOrganizationResponse>> createOrganizationAdmin(
    DriverOrganizationCreate create,
  ) async => _api.createOrganizationAdmin(create);

  Future<NetworkResponse<ListResponse<DriverOrganizationResponse>>>
  listOrganizationsAdmin({
    int offset = 0,
    int limit = 100,
    String? search,
    bool? isActive,
    bool? isVerified,
    String? businessType,
    String? verificationStatus,
    String? companySize,
  }) async => _api.listOrganizationsAdmin(
    offset: offset,
    limit: limit,
    search: search,
    isActive: isActive,
    isVerified: isVerified,
    businessType: businessType,
    verificationStatus: verificationStatus,
    companySize: companySize,
  );

  Future<NetworkResponse<DriverOrganizationResponse>> getOrganizationAdmin(
    int id,
  ) async => _api.getOrganizationAdmin(id);

  Future<NetworkResponse<DriverOrganizationResponse>> updateOrganizationAdmin(
    int id,
    DriverOrganizationUpdate update,
  ) async => _api.updateOrganizationAdmin(id, update);

  Future<NetworkResponse<void>> deleteOrganizationAdmin(int id) async =>
      _api.deleteOrganizationAdmin(id);

  Future<NetworkResponse<void>> verifyOrganizationAdmin(
    int id, {
    bool isApproved = true,
    String? rejectionReason,
  }) async => _api.verifyOrganizationAdmin(
    id,
    isApproved: isApproved,
    rejectionReason: rejectionReason,
  );

  Future<NetworkResponse<void>> updateOrganizationStatsAdmin(
    int id, {
    int? totalDrivers,
    int? activeDrivers,
    int? totalOrders,
    int? totalRevenue,
    double? ratingAverage,
    int? ratingCount,
  }) async => _api.updateOrganizationStatsAdmin(
    id,
    totalDrivers: totalDrivers,
    activeDrivers: activeDrivers,
    totalOrders: totalOrders,
    totalRevenue: totalRevenue,
    ratingAverage: ratingAverage,
    ratingCount: ratingCount,
  );

  // Admin - Users
  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>>
  getOrganizationUsersAdmin(int id, {int offset = 0, int limit = 100}) async =>
      _api.getOrganizationUsersAdmin(id, offset: offset, limit: limit);

  Future<NetworkResponse<UserWithRolesResponse>> createDriverUserAdmin(
    int id,
    UserCreateForOrg request,
  ) async => _api.createDriverUserAdmin(id, request);

  Future<NetworkResponse<void>> assignRoleToUserAdmin(
    int id,
    RoleAssignmentRequest request,
  ) async => _api.assignRoleToUserAdmin(id, request);

  // Non-admin
  Future<NetworkResponse<DriverOrganizationResponse>>
  getMyOrganization() async => _api.getMyOrganization();

  Future<NetworkResponse<UserWithRolesResponse>> createDriverUser(
    UserCreateForOrg request,
  ) async => _api.createDriverUser(request);

  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>>
  getOrganizationUsers({int offset = 0, int limit = 100}) async =>
      _api.getOrganizationUsers(offset: offset, limit: limit);

  Future<NetworkResponse<void>> assignRoleToUser(
    RoleAssignmentRequest request,
  ) async => _api.assignRoleToUser(request);
}
