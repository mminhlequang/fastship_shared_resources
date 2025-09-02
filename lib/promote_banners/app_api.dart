import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';

import '../models/models.dart';
import 'models/models.dart';

class _PromoteBannersEndpoint {
  _PromoteBannersEndpoint._();

  // Admin
  static String adminPromoteBanners() => "/api/v1/admin/promote-banners/";
  static String adminPromoteBannerDetail(int id) =>
      "/api/v1/admin/promote-banners/$id";

  // Customer
  static String customerPromoteBanners() => "/api/v1/customer/promote-banners/";
}

abstract class PromoteBannersApi {
  // Admin CRUD
  Future<NetworkResponse<PromoteBannerResponse>> createPromoteBannerAdmin(
    PromoteBannerInput create,
  );
  Future<NetworkResponse<ListResponse<PromoteBannerResponse>>>
  getPromoteBannersAdmin({
    int offset,
    int limit,
    String? countryCode,
    bool? isActive,
    String? positionInapp,
  });
  Future<NetworkResponse<PromoteBannerResponse>> getPromoteBannerAdmin(int id);
  Future<NetworkResponse<PromoteBannerResponse>> updatePromoteBannerAdmin(
    int id,
    PromoteBannerInput update,
  );
  Future<NetworkResponse<void>> deletePromoteBannerAdmin(int id);

  // Customer
  Future<NetworkResponse<ListResponse<PromoteBannerResponse>>>
  getPromoteBannersCustomer({
    String? countryCode,
    String? positionInapp,
  });
}

class PromoteBannersApiImpl extends PromoteBannersApi {
  @override
  Future<NetworkResponse<PromoteBannerResponse>> createPromoteBannerAdmin(
    PromoteBannerInput create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _PromoteBannersEndpoint.adminPromoteBanners(),
          data: create.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => PromoteBannerResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<PromoteBannerResponse>>>
  getPromoteBannersAdmin({
    int offset = 0,
    int limit = 100,
    String? countryCode,
    bool? isActive,
    String? positionInapp,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        if (countryCode != null) params['country_code'] = countryCode;
        if (isActive != null) params['is_active'] = isActive;
        if (positionInapp != null) params['position_inapp'] = positionInapp;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _PromoteBannersEndpoint.adminPromoteBanners(),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => PromoteBannerResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<PromoteBannerResponse>> getPromoteBannerAdmin(
    int id,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_PromoteBannersEndpoint.adminPromoteBannerDetail(id));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => PromoteBannerResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<PromoteBannerResponse>> updatePromoteBannerAdmin(
    int id,
    PromoteBannerInput update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _PromoteBannersEndpoint.adminPromoteBannerDetail(id),
          data: update.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => PromoteBannerResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deletePromoteBannerAdmin(int id) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_PromoteBannersEndpoint.adminPromoteBannerDetail(id));
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<PromoteBannerResponse>>>
  getPromoteBannersCustomer({
    String? countryCode,
    String? positionInapp,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'country_code': countryCode};
        if (positionInapp != null) params['position_inapp'] = positionInapp;

        final response = await AppClient().get(
          _PromoteBannersEndpoint.customerPromoteBanners(),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => PromoteBannerResponse.fromJson(item),
              ),
        );
      },
    );
  }
}
