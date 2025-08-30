import 'package:internal_network/network_resources/resources.dart';
import 'package:shared_resources/admin/admin.dart';

import 'app_api.dart';
import 'models/models.dart';
import '../admin/models/models.dart'
    show RoleAssignmentRequest, UserWithRolesResponse, UnifiedUserResponse;
import '../models/models.dart';

class RestaurantOrgsRepo {
  RestaurantOrgsRepo._();
  static RestaurantOrgsRepo? _instance;

  factory RestaurantOrgsRepo([RestaurantOrgsApi? api]) {
    _instance ??= RestaurantOrgsRepo._();
    _instance!._api = api ?? RestaurantOrgsApiImpl();
    return _instance!;
  }

  late RestaurantOrgsApi _api;

  // Admin - Organizations
  Future<NetworkResponse<RestaurantOrganizationResponse>>
  createOrganizationAdmin(RestaurantOrganizationInput create) async =>
      _api.createOrganizationAdmin(create);

  Future<NetworkResponse<ListResponse<RestaurantOrganizationResponse>>>
  listOrganizationsAdmin({
    int offset = 0,
    int limit = 100,
    String? search,
    bool? isActive,
    bool? isVerified,
    String? verificationStatus,
    bool? isChain,
  }) async => _api.listOrganizationsAdmin(
    offset: offset,
    limit: limit,
    search: search,
    isActive: isActive,
    isVerified: isVerified,
    verificationStatus: verificationStatus,
    isChain: isChain,
  );

  Future<NetworkResponse<RestaurantOrganizationResponse>> getOrganizationAdmin(
    int id,
  ) async => _api.getOrganizationAdmin(id);

  Future<NetworkResponse<RestaurantOrganizationResponse>>
  updateOrganizationAdmin(int id, RestaurantOrganizationInput update) async =>
      _api.updateOrganizationAdmin(id, update);

  Future<NetworkResponse<void>> deleteOrganizationAdmin(int id) async =>
      _api.deleteOrganizationAdmin(id);
}
