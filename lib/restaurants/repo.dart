import 'package:internal_core/network/network_resources/resources.dart';

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
    String? onboardingStatus,
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
    onboardingStatus: onboardingStatus,
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
    List<int>? cuisineTypeIds, // Danh sách ID loại ẩm thực (có thể null)
    List<String>?
    cuisineTypeStrings, // Danh sách tên loại ẩm thực để tìm kiếm (có thể null)
    bool? isOpen,
    bool? isActive,
    bool? isFeatured,
    bool? isVerified,
    double? minRating,
    double? maxDistance,
    int? limit,
    int? offset,
    String? search,
    RestaurantResponseOptions? responseOptions,
  }) => _api.getRestaurantsCustomer(
    lat: lat,
    lng: lng,
    sortBy: sortBy,
    cuisineTypeIds: cuisineTypeIds,
    cuisineTypeStrings: cuisineTypeStrings,
    isOpen: isOpen,
    isActive: isActive,
    isFeatured: isFeatured,
    isVerified: isVerified,
    minRating: minRating,
    maxDistance: maxDistance,
    limit: limit,
    offset: offset,
    search: search,
    responseOptions: responseOptions,
  );

  Future<NetworkResponse<RestaurantResponse>> getRestaurantCustomer(
    String restaurantId, {
    double? lat,
    double? lng,
  }) => _api.getRestaurantCustomer(restaurantId, lat: lat, lng: lng);

  // Admin Statistics
  Future<NetworkResponse<RestaurantStatisticOverview>>
  getRestaurantStatisticsOverview(
    int restaurantId,
    String startPeriod,
    String endPeriod,
  ) => _api.getRestaurantStatisticsOverview(
    restaurantId,
    startPeriod,
    endPeriod,
  );

  Future<NetworkResponse<RestaurantStatisticOrderAnalytics>>
  getRestaurantStatisticsOrderAnalytics(
    int restaurantId,
    String startPeriod,
    String endPeriod,
  ) => _api.getRestaurantStatisticsOrderAnalytics(
    restaurantId,
    startPeriod,
    endPeriod,
  );

  Future<NetworkResponse<RestaurantStatisticEarnings>>
  getRestaurantStatisticsEarnings(
    int restaurantId,
    String startPeriod,
    String endPeriod,
  ) => _api.getRestaurantStatisticsEarnings(
    restaurantId,
    startPeriod,
    endPeriod,
  );
}
