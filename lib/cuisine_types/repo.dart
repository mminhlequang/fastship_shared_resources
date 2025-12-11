import 'dart:typed_data';

import 'package:internal_core/network/network_resources/resources.dart';
import '../models/list_response.dart';
import 'app_api.dart';
import 'models/models.dart';

class CuisineTypesRepo {
  CuisineTypesRepo._();
  static CuisineTypesRepo? _instance;

  factory CuisineTypesRepo([CuisineTypesApiImpl? api]) {
    _instance ??= CuisineTypesRepo._();
    _instance!._api = api ?? CuisineTypesApiImpl();
    return _instance!;
  }

  late CuisineTypesApiImpl _api;

  // Admin CRUD
  Future<NetworkResponse<CuisineTypeResponse>> createCuisineTypeAdmin(
    CuisineTypeInput create,
  ) => _api.createCuisineTypeAdmin(create);

  Future<NetworkResponse<ListResponse<CuisineTypeResponse>>>
  getCuisineTypesAdmin({
    int offset = 0,
    int limit = 100,
    bool? isActive,
    bool? isHomePage,
  }) => _api.getCuisineTypesAdmin(
    offset: offset,
    limit: limit,
    isActive: isActive,
    isHomePage: isHomePage,
  );

  Future<NetworkResponse<CuisineTypeResponse>> getCuisineTypeAdmin(int id) =>
      _api.getCuisineTypeAdmin(id);

  Future<NetworkResponse<CuisineTypeResponse>> updateCuisineTypeAdmin(
    int id,
    CuisineTypeUpdate update,
  ) => _api.updateCuisineTypeAdmin(id, update);

  Future<NetworkResponse<void>> deleteCuisineTypeAdmin(int id) =>
      _api.deleteCuisineTypeAdmin(id);

  // Admin Translation CRUD
  Future<NetworkResponse<CuisineTypeResponseTranslation>> addTranslation(
    int cuisineTypeId,
    CuisineTypeTranslationInput translation,
  ) => _api.addTranslation(cuisineTypeId, translation);

  Future<NetworkResponse<CuisineTypeResponseTranslation>> updateTranslation(
    int cuisineTypeId,
    String languageCode,
    CuisineTypeTranslationUpdate translation,
  ) => _api.updateTranslation(cuisineTypeId, languageCode, translation);

  Future<NetworkResponse<void>> deleteTranslation(
    int cuisineTypeId,
    String languageCode,
  ) => _api.deleteTranslation(cuisineTypeId, languageCode);

  // Public API
  Future<NetworkResponse<ListResponse<CuisineTypeResponse>>> getCuisineTypes({
    required String languageCode,
    bool? isHomePage,
    bool? countRestaurants,
    bool? countMenuItems,
    bool? isCountRestaurantActive,
    bool? isCountRestaurantOpen,
  }) => _api.getCuisineTypes(
    languageCode: languageCode,
    isHomePage: isHomePage,
    countRestaurants: countRestaurants,
    countMenuItems: countMenuItems,
    isCountRestaurantActive: isCountRestaurantActive,
    isCountRestaurantOpen: isCountRestaurantOpen,
  );
}
