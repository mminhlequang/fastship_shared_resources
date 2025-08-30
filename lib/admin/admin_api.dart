import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';
import 'package:dio/dio.dart';
import '../models/models.dart';
import 'models/models.dart';

class _AdminEndpoint {
  _AdminEndpoint._();

  // User Management
  static String users() => "/api/v1/admin/users";
  static String userDetail(String userId) => "/api/v1/admin/users/$userId";

  // Role Management Endpoints
  static String roles() => "/api/v1/admin/roles";
  static String roleDetail(int roleId) => "/api/v1/admin/roles/$roleId";

  // Registration Request Endpoints
  static String guestSubmit() => "/api/v1/registration-requests/guest_submit";
  static String registrationRequests() =>
      "/api/v1/registration-requests/admin/";
  static String registrationRequestDetail(int requestId) =>
      "/api/v1/registration-requests/admin/$requestId";
  static String registrationRequestApprove(int requestId) =>
      "/api/v1/registration-requests/admin/$requestId/approve";
  static String registrationRequestReject(int requestId) =>
      "/api/v1/registration-requests/admin/$requestId/reject";
  static String registrationStatistics() =>
      "/api/v1/registration-requests/admin/statistics";
}

abstract class AdminApi {
  // User Management
  Future<NetworkResponse<UnifiedUserResponse>> createUser(
    UserCreateByAdmin userCreate,
  );
  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>> getUsers({
    int offset = 0,
    int limit = 100,
    int? driverOrgId,
    int? restaurantOrgId,
    String? userType,
    String? role,
    String? search,
  });
  Future<NetworkResponse<UnifiedUserResponse>> getUserDetail(String userId);
  Future<NetworkResponse<UnifiedUserResponse>> updateUser(
    String userId,
    UserUpdate userUpdate,
  );
  Future<NetworkResponse<void>> deleteUser(String userId);

  // Role Management
  Future<NetworkResponse<RoleResponse>> createRole(RoleCreate roleCreate);
  Future<NetworkResponse<ListResponse<RoleResponse>>> getRoles({
    int offset = 0,
    int limit = 100,
    String? scope,
    String? search,
  });
  Future<NetworkResponse<RoleDetailResponse>> getRoleDetail(int roleId);
  Future<NetworkResponse<RoleDetailResponse>> updateRole(
    int roleId,
    RoleUpdate roleUpdate,
  );
  Future<NetworkResponse<void>> deleteRole(int roleId);

  // Registration Request Management
  Future<NetworkResponse<RegistrationRequestResponse>>
  submitRegistrationRequest(Map<String, dynamic> request);

  Future<NetworkResponse<ListResponse<RegistrationRequestResponse>>>
  getRegistrationRequests({
    int offset = 0,
    int limit = 100,
    String? status,
    String? applicantType,
    String? search,
  });
  Future<NetworkResponse<RegistrationStatistics>> getRegistrationStatistics();
  Future<NetworkResponse<RegistrationRequestResponse>>
  getRegistrationRequestDetail(int requestId);
  Future<NetworkResponse<RegistrationRequestResponse>>
  updateRegistrationRequest(
    int requestId,
    RegistrationRequestUpdate requestUpdate,
  );
  Future<NetworkResponse<void>> deleteRegistrationRequest(int requestId);
  Future<NetworkResponse<RegistrationRequestResponse>>
  approveRegistrationRequest(int requestId, {String? note});
  Future<NetworkResponse<RegistrationRequestResponse>>
  rejectRegistrationRequest(int requestId, {String? note});
}

class AdminApiImpl extends AdminApi {
  // User Management Implementation
  @override
  Future<NetworkResponse<UnifiedUserResponse>> createUser(
    UserCreateByAdmin userCreate,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_AdminEndpoint.users(), data: userCreate.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => UnifiedUserResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<UnifiedUserResponse>>> getUsers({
    int offset = 0,
    int limit = 100,
    int? driverOrgId,
    int? restaurantOrgId,
    String? userType,
    String? role,
    String? search,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        if (driverOrgId != null) params['driver_org_id'] = driverOrgId;
        if (restaurantOrgId != null)
          params['restaurant_org_id'] = restaurantOrgId;
        if (userType != null) params['user_type'] = userType;
        if (role != null) params['role'] = role;
        if (search != null) params['search'] = search;

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_AdminEndpoint.users(), queryParameters: params);
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
  Future<NetworkResponse<UnifiedUserResponse>> getUserDetail(
    String userId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_AdminEndpoint.userDetail(userId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => UnifiedUserResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<UnifiedUserResponse>> updateUser(
    String userId,
    UserUpdate userUpdate,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(_AdminEndpoint.userDetail(userId), data: userUpdate.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => UnifiedUserResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteUser(String userId) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_AdminEndpoint.userDetail(userId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => null,
        );
      },
    );
  }

  // Role Management Implementation
  @override
  Future<NetworkResponse<RoleResponse>> createRole(
    RoleCreate roleCreate,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_AdminEndpoint.roles(), data: roleCreate.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RoleResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<RoleResponse>>> getRoles({
    int offset = 0,
    int limit = 100,
    String? scope,
    String? search,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        if (scope != null) params['scope'] = scope;
        if (search != null) params['search'] = search;

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_AdminEndpoint.roles(), queryParameters: params);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => RoleResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<RoleDetailResponse>> getRoleDetail(int roleId) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_AdminEndpoint.roleDetail(roleId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RoleDetailResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<RoleDetailResponse>> updateRole(
    int roleId,
    RoleUpdate roleUpdate,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(_AdminEndpoint.roleDetail(roleId), data: roleUpdate.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RoleDetailResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteRole(int roleId) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_AdminEndpoint.roleDetail(roleId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => null,
        );
      },
    );
  }

  // Registration Request Management Implementation
  @override
  Future<NetworkResponse<RegistrationRequestResponse>>
  submitRegistrationRequest(Map<String, dynamic> request) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient().post(
          _AdminEndpoint.guestSubmit(),
          data: request,
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RegistrationRequestResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<RegistrationRequestResponse>>>
  getRegistrationRequests({
    int offset = 0,
    int limit = 100,
    String? status,
    String? applicantType,
    String? search,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        if (status != null) params['status'] = status;
        if (applicantType != null) params['applicant_type'] = applicantType;
        if (search != null) params['search'] = search;

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_AdminEndpoint.registrationRequests(), queryParameters: params);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => RegistrationRequestResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<RegistrationStatistics>>
  getRegistrationStatistics() async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_AdminEndpoint.registrationStatistics());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RegistrationStatistics.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<RegistrationRequestResponse>>
  getRegistrationRequestDetail(int requestId) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_AdminEndpoint.registrationRequestDetail(requestId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RegistrationRequestResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<RegistrationRequestResponse>>
  updateRegistrationRequest(
    int requestId,
    RegistrationRequestUpdate requestUpdate,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _AdminEndpoint.registrationRequestDetail(requestId),
          data: requestUpdate.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RegistrationRequestResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteRegistrationRequest(int requestId) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_AdminEndpoint.registrationRequestDetail(requestId));
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }

  @override
  Future<NetworkResponse<RegistrationRequestResponse>>
  approveRegistrationRequest(int requestId, {String? note}) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{};
        if (note != null) params['note'] = note;

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _AdminEndpoint.registrationRequestApprove(requestId),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RegistrationRequestResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<RegistrationRequestResponse>>
  rejectRegistrationRequest(int requestId, {String? note}) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{};
        if (note != null) params['note'] = note;

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _AdminEndpoint.registrationRequestReject(requestId),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RegistrationRequestResponse.fromJson(json),
        );
      },
    );
  }
}
