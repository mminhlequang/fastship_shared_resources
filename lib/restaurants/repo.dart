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

  Future<NetworkResponse<RestaurantResponse>> createRestaurantAdmin(
          RestaurantInput create) =>
      _api.createRestaurantAdmin(create);

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
  }) =>
          _api.getRestaurantsAdmin(
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
          int id, RestaurantInput update) =>
      _api.updateRestaurantAdmin(id, update);
  Future<NetworkResponse<void>> deleteRestaurantAdmin(int id) =>
      _api.deleteRestaurantAdmin(id);

  Future<NetworkResponse<RestaurantResponse>> updateRestaurantStatsAdmin(
    int id, {
    int? totalOrders,
    int? completedOrders,
    int? cancelledOrders,
    int? totalRevenue,
    double? averageOrderValue,
    double? ratingAverage,
    int? ratingCount,
    double? onTimeDeliveryRate,
  }) =>
      _api.updateRestaurantStatsAdmin(
        id,
        totalOrders: totalOrders,
        completedOrders: completedOrders,
        cancelledOrders: cancelledOrders,
        totalRevenue: totalRevenue,
        averageOrderValue: averageOrderValue,
        ratingAverage: ratingAverage,
        ratingCount: ratingCount,
        onTimeDeliveryRate: onTimeDeliveryRate,
      );

  Future<NetworkResponse<List<RestaurantResponse>>>
      getRestaurantsByOrganizationAdmin(int orgId,
              {int offset = 0, int limit = 100}) =>
          _api.getRestaurantsByOrganizationAdmin(orgId,
              offset: offset, limit: limit);
  Future<NetworkResponse<List<RestaurantResponse>>> getFeaturedRestaurantsAdmin(
          {int limit = 10}) =>
      _api.getFeaturedRestaurantsAdmin(limit: limit);
  Future<NetworkResponse<List<RestaurantResponse>>>
      getRestaurantsByCriteriaAdmin({
    bool? isHalal,
    bool? isVegetarianFriendly,
    double? minRating,
    int? maxPreparationTime,
    int limit = 20,
  }) =>
          _api.getRestaurantsByCriteriaAdmin(
            isHalal: isHalal,
            isVegetarianFriendly: isVegetarianFriendly,
            minRating: minRating,
            maxPreparationTime: maxPreparationTime,
            limit: limit,
          );
}
