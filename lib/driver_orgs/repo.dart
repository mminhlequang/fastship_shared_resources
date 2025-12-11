import 'package:internal_core/network/network_resources/resources.dart';

import 'app_api.dart';
import 'models/models.dart';
import '../models/models.dart' show ListResponse;

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
}
