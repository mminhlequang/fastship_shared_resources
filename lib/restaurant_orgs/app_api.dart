import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';
import 'package:dio/dio.dart';
import 'package:shared_resources/admin/admin.dart';

import '../models/models.dart';
import '../admin/models/models.dart'
    show RoleAssignmentRequest, UserWithRolesResponse, UnifiedUserResponse;
import 'models/models.dart';

class _RestaurantOrgEndpoint {
  _RestaurantOrgEndpoint._();

  // Admin base
  static String adminOrganizations() => "/api/v1/admin/restaurant-org/";
  static String adminOrganizationDetail(int id) =>
      "/api/v1/admin/restaurant-org//$id";
  static String adminOrganizationUsers() =>
      "/api/v1/admin/restaurant-org/users";
  static String adminOrganizationAssignRole() =>
      "/api/v1/admin/restaurant-org/roles/assign";
}

abstract class RestaurantOrgsApi {
  Future<NetworkResponse<RestaurantOrganizationResponse>>
  createOrganizationAdmin(RestaurantOrganizationInput create);
  Future<NetworkResponse<ListResponse<RestaurantOrganizationResponse>>>
  listOrganizationsAdmin({
    int offset,
    int limit,
    String? search,
    bool? isActive,
    bool? isVerified,
    String? businessType,
    String? verificationStatus,
    bool? isChain,
  });
  Future<NetworkResponse<RestaurantOrganizationResponse>> getOrganizationAdmin(
    int id,
  );
  Future<NetworkResponse<RestaurantOrganizationResponse>>
  updateOrganizationAdmin(int id, RestaurantOrganizationInput update);
  Future<NetworkResponse<void>> deleteOrganizationAdmin(int id);

  // Admin - Users within organization
  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>>
  getOrganizationUsersAdmin({
    int offset,
    int limit,
    int? organizationId,
    int? restaurantId,
  });
  Future<NetworkResponse<UserWithRolesResponse>> createRestaurantUserAdmin(
    UserCreateForOrg request,
  );
  Future<NetworkResponse<void>> assignRoleToUserAdmin(
    RoleAssignmentRequest request,
  );
}

class RestaurantOrgsApiImpl extends RestaurantOrgsApi {
  // Admin - Organizations CRUD
  @override
  Future<NetworkResponse<RestaurantOrganizationResponse>>
  createOrganizationAdmin(RestaurantOrganizationInput create) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _RestaurantOrgEndpoint.adminOrganizations(),
          data: create.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RestaurantOrganizationResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<RestaurantOrganizationResponse>>>
  listOrganizationsAdmin({
    int offset = 0,
    int limit = 100,
    String? search,
    bool? isActive,
    bool? isVerified,
    String? businessType,
    String? verificationStatus,
    bool? isChain,
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
        if (isChain != null) params['is_chain'] = isChain;

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _RestaurantOrgEndpoint.adminOrganizations(),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => RestaurantOrganizationResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<RestaurantOrganizationResponse>> getOrganizationAdmin(
    int id,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_RestaurantOrgEndpoint.adminOrganizationDetail(id));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RestaurantOrganizationResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<RestaurantOrganizationResponse>>
  updateOrganizationAdmin(int id, RestaurantOrganizationInput update) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _RestaurantOrgEndpoint.adminOrganizationDetail(id),
          data: update.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RestaurantOrganizationResponse.fromJson(json),
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
        ).delete(_RestaurantOrgEndpoint.adminOrganizationDetail(id));
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }

  // Admin - Users
  @override
  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>>
  getOrganizationUsersAdmin({
    int? organizationId,
    int offset = 0,
    int limit = 100,
    int? restaurantId,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        if (restaurantId != null) params['restaurant_id'] = restaurantId;
        if (organizationId != null) params['restaurant_org_id'] = organizationId;
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _RestaurantOrgEndpoint.adminOrganizationUsers(),
          queryParameters: params,
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
  Future<NetworkResponse<UserWithRolesResponse>> createRestaurantUserAdmin(
    UserCreateForOrg request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _RestaurantOrgEndpoint.adminOrganizationUsers(),
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
    RoleAssignmentRequest request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _RestaurantOrgEndpoint.adminOrganizationAssignRole(),
          data: request.toJson(),
        );
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }
}
