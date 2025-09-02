import 'package:internal_network/network_resources/resources.dart';

import 'app_api.dart';
import 'models/models.dart';
import '../models/models.dart';

class RestaurantsRepo {
  RestaurantsRepo._();
  static RestaurantsRepo? _instance;

  factory RestaurantsRepo([RestaurantsApi? api]) {
    _instance ??= RestaurantsRepo._();
    _instance!._api = api ?? RestaurantsApiImpl();
    return _instance!;
  }

  late RestaurantsApi _api;

  // Admin CRUD
  Future<NetworkResponse<RestaurantResponse>> createRestaurantAdmin(
    RestaurantInput create,
  ) => _api.createRestaurantAdmin(create);

  Future<NetworkResponse<ListResponse<RestaurantResponse>>>
  getRestaurantsAdmin({
    int offset = 0,
    int limit = 100,
    int? restaurantOrgId,
    bool? isActive,
    bool? isOpen,
    bool? isFeatured,
    bool? isVerified,
    bool? isChain,
    bool? isHalal,
    bool? isVegetarianFriendly,
    String? search,
  }) => _api.getRestaurantsAdmin(
    offset: offset,
    limit: limit,
    restaurantOrgId: restaurantOrgId,
    isActive: isActive,
    isOpen: isOpen,
    isFeatured: isFeatured,
    isVerified: isVerified,
    isChain: isChain,
    isHalal: isHalal,
    isVegetarianFriendly: isVegetarianFriendly,
    search: search,
  );

  Future<NetworkResponse<RestaurantResponse>> getRestaurantAdmin(int id) =>
      _api.getRestaurantAdmin(id);
  Future<NetworkResponse<RestaurantResponse>> updateRestaurantAdmin(
    int id,
    RestaurantInput update,
  ) => _api.updateRestaurantAdmin(id, update);
  Future<NetworkResponse<void>> deleteRestaurantAdmin(int id) =>
      _api.deleteRestaurantAdmin(id);

  // Customer APIs
  Future<NetworkResponse<ListResponse<RestaurantResponse>>>
  getRestaurantsCustomer({
    double? lat,
    double? lng,
    RestaurantSortBy? sortBy,
    String? cuisineType,
    bool? isOpen,
    bool? isFeatured,
    bool? isVerified,
    double? minRating,
    double? maxDistance,
    int? limit,
    int? offset,
  }) => _api.getRestaurantsCustomer(
    lat: lat,
    lng: lng,
    sortBy: sortBy,
    cuisineType: cuisineType,
    isOpen: isOpen,
    isFeatured: isFeatured,
    isVerified: isVerified,
    minRating: minRating,
    maxDistance: maxDistance,
    limit: limit,
    offset: offset,
  );

  Future<NetworkResponse<RestaurantResponse>> getRestaurantCustomer(
    String restaurantId,
  ) => _api.getRestaurantCustomer(restaurantId);
}
