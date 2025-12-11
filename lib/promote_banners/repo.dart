import 'package:internal_core/network/network_resources/resources.dart';

import 'app_api.dart';
import 'models/models.dart';
import '../models/models.dart';

class PromoteBannersRepo {
  PromoteBannersRepo._();
  static PromoteBannersRepo? _instance;

  factory PromoteBannersRepo([PromoteBannersApi? api]) {
    _instance ??= PromoteBannersRepo._();
    _instance!._api = api ?? PromoteBannersApiImpl();
    return _instance!;
  }

  late PromoteBannersApi _api;

  // Admin CRUD
  Future<NetworkResponse<PromoteBannerResponse>> createPromoteBannerAdmin(
    PromoteBannerInput create,
  ) => _api.createPromoteBannerAdmin(create);

  Future<NetworkResponse<ListResponse<PromoteBannerResponse>>>
  getPromoteBannersAdmin({
    int offset = 0,
    int limit = 100,
    String? countryCode,
    bool? isActive,
    String? positionInapp,
  }) => _api.getPromoteBannersAdmin(
    offset: offset,
    limit: limit,
    countryCode: countryCode,
    isActive: isActive,
    positionInapp: positionInapp,
  );

  Future<NetworkResponse<PromoteBannerResponse>> getPromoteBannerAdmin(
    int id,
  ) => _api.getPromoteBannerAdmin(id);

  Future<NetworkResponse<PromoteBannerResponse>> updatePromoteBannerAdmin(
    int id,
    PromoteBannerInput update,
  ) => _api.updatePromoteBannerAdmin(id, update);

  Future<NetworkResponse<void>> deletePromoteBannerAdmin(int id) =>
      _api.deletePromoteBannerAdmin(id);

  // Customer
  Future<NetworkResponse<ListResponse<PromoteBannerResponse>>>
  getPromoteBannersCustomer({String? countryCode, String? positionInapp}) =>
      _api.getPromoteBannersCustomer(
        countryCode: countryCode,
        positionInapp: positionInapp,
      );
}
