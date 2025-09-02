/// Driver Organizations network layer
/// - Defines endpoints, API contract, and implementation
/// - Covers Admin and non-admin flows
/// - Follows the same style as `restaurant_orgs` module

import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';
import 'package:dio/dio.dart';

import '../models/models.dart';
import 'models/models.dart';

class _DriverOrgEndpoint {
  _DriverOrgEndpoint._();

  // Admin base
  static String adminOrganizations() => "/api/v1/admin/driver-org/";
  static String adminOrganizationDetail(int id) =>
      "/api/v1/admin/driver-org/$id";
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
}
