import 'package:internal_core/internal_core.dart';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';
import '../../common_assets/models/models.dart';
import '../models/list_response.dart';
import 'models/models.dart';

class _CuisineTypesEndpoint {
  _CuisineTypesEndpoint._();

  // Admin
  static String adminCuisineTypes() => "/api/v1/admin/cuisine-types/";
  static String adminCuisineTypeDetail(int id) =>
      "/api/v1/admin/cuisine-types/$id";
  static String adminCuisineTypeTranslations(int id) =>
      "/api/v1/admin/cuisine-types/$id/translations";
  static String adminCuisineTypeTranslationDetail(
    int id,
    String languageCode,
  ) => "/api/v1/admin/cuisine-types/$id/translations/$languageCode";

  // Public API
  static String getCuisineTypes() => "/api/v1/customer/cuisine-types/";
}

abstract class CuisineTypesApi {
  // Admin CRUD
  Future<NetworkResponse<CuisineTypeResponse>> createCuisineTypeAdmin(
    CuisineTypeInput create,
  );
  Future<NetworkResponse<ListResponse<CuisineTypeResponse>>>
  getCuisineTypesAdmin({
    int offset,
    int limit,
    bool? isActive,
    bool? isHomePage,
  });
  Future<NetworkResponse<CuisineTypeResponse>> getCuisineTypeAdmin(int id);
  Future<NetworkResponse<CuisineTypeResponse>> updateCuisineTypeAdmin(
    int id,
    CuisineTypeUpdate update,
  );
  Future<NetworkResponse<void>> deleteCuisineTypeAdmin(int id);

  // Admin Translation CRUD
  Future<NetworkResponse<CuisineTypeResponseTranslation>> addTranslation(
    int cuisineTypeId,
    CuisineTypeTranslationInput translation,
  );
  Future<NetworkResponse<CuisineTypeResponseTranslation>> updateTranslation(
    int cuisineTypeId,
    String languageCode,
    CuisineTypeTranslationUpdate translation,
  );
  Future<NetworkResponse<void>> deleteTranslation(
    int cuisineTypeId,
    String languageCode,
  );

  // Public API
  Future<NetworkResponse<ListResponse<CuisineTypeResponse>>> getCuisineTypes({
    required String languageCode,
    bool? isHomePage,
    bool? countRestaurants,
    bool? countMenuItems,
    bool? isCountRestaurantActive,
    bool? isCountRestaurantOpen,
  });
}

class CuisineTypesApiImpl extends CuisineTypesApi {
  @override
  Future<NetworkResponse<CuisineTypeResponse>> createCuisineTypeAdmin(
    CuisineTypeInput create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _CuisineTypesEndpoint.adminCuisineTypes(),
          data: create.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CuisineTypeResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<CuisineTypeResponse>>>
  getCuisineTypesAdmin({
    int offset = 0,
    int limit = 100,
    bool? isActive,
    bool? isHomePage,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        if (isActive != null) params['is_active'] = isActive;
        if (isHomePage != null) params['is_home_page'] = isHomePage;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _CuisineTypesEndpoint.adminCuisineTypes(),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => CuisineTypeResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<CuisineTypeResponse>> getCuisineTypeAdmin(
    int id,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_CuisineTypesEndpoint.adminCuisineTypeDetail(id));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CuisineTypeResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<CuisineTypeResponse>> updateCuisineTypeAdmin(
    int id,
    CuisineTypeUpdate update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _CuisineTypesEndpoint.adminCuisineTypeDetail(id),
          data: update.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CuisineTypeResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteCuisineTypeAdmin(int id) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_CuisineTypesEndpoint.adminCuisineTypeDetail(id));
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }

  @override
  Future<NetworkResponse<CuisineTypeResponseTranslation>> addTranslation(
    int cuisineTypeId,
    CuisineTypeTranslationInput translation,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _CuisineTypesEndpoint.adminCuisineTypeTranslations(cuisineTypeId),
          data: translation.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CuisineTypeResponseTranslation.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<CuisineTypeResponseTranslation>> updateTranslation(
    int cuisineTypeId,
    String languageCode,
    CuisineTypeTranslationUpdate translation,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _CuisineTypesEndpoint.adminCuisineTypeTranslationDetail(
            cuisineTypeId,
            languageCode,
          ),
          data: translation.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CuisineTypeResponseTranslation.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteTranslation(
    int cuisineTypeId,
    String languageCode,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(
          _CuisineTypesEndpoint.adminCuisineTypeTranslationDetail(
            cuisineTypeId,
            languageCode,
          ),
        );
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<CuisineTypeResponse>>> getCuisineTypes({
    required String languageCode,
    bool? isHomePage,
    bool? countRestaurants,
    bool? countMenuItems,
    bool? isCountRestaurantActive,
    bool? isCountRestaurantOpen,
  }) async {
    Map<String, dynamic> queryParameters = {'language_code': languageCode};
    if (isHomePage != null) {
      queryParameters['is_home_page'] = isHomePage;
    }
    if (countRestaurants != null) {
      queryParameters['count_restaurants'] = countRestaurants;
    }
    if (countMenuItems != null) {
      queryParameters['count_menu_items'] = countMenuItems;
    }

    if (isCountRestaurantOpen != null) {
      queryParameters['is_count_restaurant_open'] = isCountRestaurantOpen;
    }

    if (isCountRestaurantActive != null) {
      queryParameters['is_count_restaurant_active'] = isCountRestaurantActive;
    }

    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _CuisineTypesEndpoint.getCuisineTypes(),
          queryParameters: queryParameters,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse<CuisineTypeResponse>.fromJson(
                json,
                (item) => CuisineTypeResponse.fromJson(item),
              ),
        );
      },
    );
  }
}
