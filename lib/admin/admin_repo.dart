import 'package:internal_core/network/network_resources/resources.dart';
import '../models/models.dart';
import 'admin_api.dart';
import 'models/models.dart';

class AdminRepo {
  AdminRepo._();
  static AdminRepo? _instance;

  factory AdminRepo([AdminApi? api]) {
    _instance ??= AdminRepo._();
    _instance!._api = api ?? AdminApiImpl();
    return _instance!;
  }

  late AdminApi _api;

  // User Management
  Future<NetworkResponse<UnifiedUserResponse>> createUser(
    UserCreateByAdmin userCreate,
  ) async {
    return await _api.createUser(userCreate);
  }

  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>> getUsers({
    int offset = 0,
    int limit = 100,
    int? driverOrgId,
    int? restaurantOrgId,
    int? restaurantId,
    String? roleName,
    String? roleScope,
    String? search,
  }) async {
    return await _api.getUsers(
      offset: offset,
      limit: limit,
      driverOrgId: driverOrgId,
      restaurantOrgId: restaurantOrgId,
      restaurantId: restaurantId,
      roleName: roleName,
      roleScope: roleScope,
      search: search,
    );
  }

  Future<NetworkResponse<UnifiedUserResponse>> getUserDetail(
    String userId,
  ) async {
    return await _api.getUserDetail(userId);
  }

  Future<NetworkResponse<UnifiedUserResponse>> updateUser(
    String userId,
    UserUpdate userUpdate,
  ) async {
    return await _api.updateUser(userId, userUpdate);
  }

  Future<NetworkResponse<void>> deleteUser(String userId) async {
    return await _api.deleteUser(userId);
  }

  // User Role Management
  Future<NetworkResponse<void>> updateUserRole(
    UserRoleUpdateRequest userRoleUpdate,
  ) async {
    return await _api.updateUserRole(userRoleUpdate);
  }

  Future<NetworkResponse<void>> deleteUserRole(
    dynamic userRoleId,
    bool deleteUser,
  ) async {
    return await _api.deleteUserRole(userRoleId, deleteUser);
  }

  Future<NetworkResponse<void>> resetUserPassword(
    String userId,
    String newPassword,
  ) async {
    return await _api.resetUserPassword(userId, newPassword);
  }

  // Role Management
  Future<NetworkResponse<RoleResponse>> createRole(
    RoleCreate roleCreate,
  ) async {
    return await _api.createRole(roleCreate);
  }

  Future<NetworkResponse<ListResponse<RoleResponse>>> getRoles({
    int offset = 0,
    int limit = 100,
    String? scope,
    String? search,
  }) async {
    return await _api.getRoles(
      offset: offset,
      limit: limit,
      scope: scope,
      search: search,
    );
  }

  Future<NetworkResponse<RoleDetailResponse>> getRoleDetail(int roleId) async {
    return await _api.getRoleDetail(roleId);
  }

  Future<NetworkResponse<RoleDetailResponse>> updateRole(
    int roleId,
    RoleUpdate roleUpdate,
  ) async {
    return await _api.updateRole(roleId, roleUpdate);
  }

  Future<NetworkResponse<void>> deleteRole(int roleId) async {
    return await _api.deleteRole(roleId);
  }

  // Registration Request Management

  Future<NetworkResponse<RegistrationRequestResponse>>
  submitRegistrationRequest(Map<String, dynamic> request) async {
    return await _api.submitRegistrationRequest(request);
  }

  Future<NetworkResponse<ListResponse<RegistrationRequestResponse>>>
  getRegistrationRequests({
    int offset = 0,
    int limit = 100,
    String? status,
    String? applicantType,
    String? search,
  }) async {
    return await _api.getRegistrationRequests(
      offset: offset,
      limit: limit,
      status: status,
      applicantType: applicantType,
      search: search,
    );
  }

  Future<NetworkResponse<RegistrationStatistics>>
  getRegistrationStatistics() async {
    return await _api.getRegistrationStatistics();
  }

  Future<NetworkResponse<RegistrationRequestResponse>>
  getRegistrationRequestDetail(int requestId) async {
    return await _api.getRegistrationRequestDetail(requestId);
  }

  Future<NetworkResponse<RegistrationRequestResponse>>
  updateRegistrationRequest(
    int requestId,
    RegistrationRequestUpdate requestUpdate,
  ) async {
    return await _api.updateRegistrationRequest(requestId, requestUpdate);
  }

  Future<NetworkResponse<void>> deleteRegistrationRequest(int requestId) async {
    return await _api.deleteRegistrationRequest(requestId);
  }
}
