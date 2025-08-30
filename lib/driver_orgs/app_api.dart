/// Driver Organizations network layer
/// - Defines endpoints, API contract, and implementation
/// - Covers Admin and non-admin flows
/// - Follows the same style as `restaurant_orgs` module

import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';
import 'package:dio/dio.dart';
import 'package:shared_resources/admin/admin.dart';

import '../models/models.dart';
import '../admin/models/models.dart'
    show RoleAssignmentRequest, UserWithRolesResponse, UnifiedUserResponse;
import 'models/models.dart';
import '../restaurant_orgs/models/restaurant_org_models.dart'
    show UserCreateForOrg;

class _DriverOrgEndpoint {
  _DriverOrgEndpoint._();

  // Admin base
  static String adminOrganizations() =>
      "/api/v1/driver-org/admin/organizations";
  static String adminOrganizationDetail(int id) =>
      "/api/v1/driver-org/admin/organizations/$id";
  static String adminOrganizationVerify(int id) =>
      "/api/v1/driver-org/admin/organizations/$id/verify";
  static String adminOrganizationStats(int id) =>
      "/api/v1/driver-org/admin/organizations/$id/stats";
  static String adminOrganizationUsers(int id) =>
      "/api/v1/driver-org/admin/organizations/$id/users";
  static String adminOrganizationAssignRole(int id) =>
      "/api/v1/driver-org/admin/organizations/$id/roles/assign";

  // Non-admin base
  static String myOrganization() => "/api/v1/driver-org/organizations/me";
  static String orgUsers() => "/api/v1/driver-org/organizations/users";
  static String orgAssignRole() =>
      "/api/v1/driver-org/organizations/roles/assign";
}

abstract class DriverOrganizationsApi {
  // Admin - Organizations CRUD
  Future<NetworkResponse<DriverOrganizationResponse>> createOrganizationAdmin(
    DriverOrganizationCreate create,
  );
  Future<NetworkResponse<ListResponse<DriverOrganizationResponse>>>
  listOrganizationsAdmin({
    int offset,
    int limit,
    String? search,
    bool? isActive,
    bool? isVerified,
    String? businessType,
    String? verificationStatus,
    String? companySize,
  });
  Future<NetworkResponse<DriverOrganizationResponse>> getOrganizationAdmin(
    int id,
  );
  Future<NetworkResponse<DriverOrganizationResponse>> updateOrganizationAdmin(
    int id,
    DriverOrganizationUpdate update,
  );
  Future<NetworkResponse<void>> deleteOrganizationAdmin(int id);
  Future<NetworkResponse<void>> verifyOrganizationAdmin(
    int id, {
    bool isApproved,
    String? rejectionReason,
  });
  Future<NetworkResponse<void>> updateOrganizationStatsAdmin(
    int id, {
    int? totalDrivers,
    int? activeDrivers,
    int? totalOrders,
    int? totalRevenue,
    double? ratingAverage,
    int? ratingCount,
  });

  // Admin - Users within organization
  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>>
  getOrganizationUsersAdmin(int id, {int offset = 0, int limit = 100});
  Future<NetworkResponse<UserWithRolesResponse>> createDriverUserAdmin(
    int id,
    UserCreateForOrg request,
  );
  Future<NetworkResponse<void>> assignRoleToUserAdmin(
    int id,
    RoleAssignmentRequest request,
  );

  // Non-admin - My organization and users
  Future<NetworkResponse<DriverOrganizationResponse>> getMyOrganization();
  Future<NetworkResponse<UserWithRolesResponse>> createDriverUser(
    UserCreateForOrg request,
  );
  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>>
  getOrganizationUsers({int offset = 0, int limit = 100});
  Future<NetworkResponse<void>> assignRoleToUser(RoleAssignmentRequest request);
}

class DriverOrganizationsApiImpl extends DriverOrganizationsApi {
  // Admin - Organizations CRUD
  @override
  Future<NetworkResponse<DriverOrganizationResponse>> createOrganizationAdmin(
    DriverOrganizationCreate create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_DriverOrgEndpoint.adminOrganizations(), data: create.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => DriverOrganizationResponse.fromJson(json),
        );
      },
    );
  }

  @override
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
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        if (search != null) params['search'] = search;
        if (isActive != null) params['is_active'] = isActive;
        if (isVerified != null) params['is_verified'] = isVerified;
        if (businessType != null) params['business_type'] = businessType;
        if (verificationStatus != null)
          params['verification_status'] = verificationStatus;
        if (companySize != null) params['company_size'] = companySize;

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_DriverOrgEndpoint.adminOrganizations(), queryParameters: params);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => DriverOrganizationResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<DriverOrganizationResponse>> getOrganizationAdmin(
    int id,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_DriverOrgEndpoint.adminOrganizationDetail(id));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => DriverOrganizationResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<DriverOrganizationResponse>> updateOrganizationAdmin(
    int id,
    DriverOrganizationUpdate update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _DriverOrgEndpoint.adminOrganizationDetail(id),
          data: update.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => DriverOrganizationResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteOrganizationAdmin(int id) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_DriverOrgEndpoint.adminOrganizationDetail(id));
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }

  @override
  Future<NetworkResponse<void>> verifyOrganizationAdmin(
    int id, {
    bool isApproved = true,
    String? rejectionReason,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'is_approved': isApproved};
        if (rejectionReason != null)
          params['rejection_reason'] = rejectionReason;
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _DriverOrgEndpoint.adminOrganizationVerify(id),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }

  @override
  Future<NetworkResponse<void>> updateOrganizationStatsAdmin(
    int id, {
    int? totalDrivers,
    int? activeDrivers,
    int? totalOrders,
    int? totalRevenue,
    double? ratingAverage,
    int? ratingCount,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{};
        if (totalDrivers != null) params['total_drivers'] = totalDrivers;
        if (activeDrivers != null) params['active_drivers'] = activeDrivers;
        if (totalOrders != null) params['total_orders'] = totalOrders;
        if (totalRevenue != null) params['total_revenue'] = totalRevenue;
        if (ratingAverage != null) params['rating_average'] = ratingAverage;
        if (ratingCount != null) params['rating_count'] = ratingCount;
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _DriverOrgEndpoint.adminOrganizationStats(id),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }

  // Admin - Users
  @override
  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>>
  getOrganizationUsersAdmin(int id, {int offset = 0, int limit = 100}) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _DriverOrgEndpoint.adminOrganizationUsers(id),
          queryParameters: {'offset': offset, 'limit': limit},
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => UnifiedUserResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<UserWithRolesResponse>> createDriverUserAdmin(
    int id,
    UserCreateForOrg request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _DriverOrgEndpoint.adminOrganizationUsers(id),
          data: request.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => UserWithRolesResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> assignRoleToUserAdmin(
    int id,
    RoleAssignmentRequest request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _DriverOrgEndpoint.adminOrganizationAssignRole(id),
          data: request.toJson(),
        );
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }

  // Non-admin
  @override
  Future<NetworkResponse<DriverOrganizationResponse>>
  getMyOrganization() async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_DriverOrgEndpoint.myOrganization());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => DriverOrganizationResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<UserWithRolesResponse>> createDriverUser(
    UserCreateForOrg request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_DriverOrgEndpoint.orgUsers(), data: request.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => UserWithRolesResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>>
  getOrganizationUsers({int offset = 0, int limit = 100}) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _DriverOrgEndpoint.orgUsers(),
          queryParameters: {'offset': offset, 'limit': limit},
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => UnifiedUserResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> assignRoleToUser(
    RoleAssignmentRequest request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_DriverOrgEndpoint.orgAssignRole(), data: request.toJson());
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }
}
