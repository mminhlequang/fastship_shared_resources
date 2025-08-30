import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';

import '../models/models.dart';
import 'models/models.dart';

class _RestaurantsEndpoint {
  _RestaurantsEndpoint._();

  // Admin
  static String adminRestaurants() => "/api/v1/restaurants/admin";
  static String adminRestaurantDetail(int id) =>
      "/api/v1/restaurants/admin/$id";
  static String adminRestaurantStats(int id) =>
      "/api/v1/restaurants/admin/$id/stats";
  static String adminRestaurantsByOrg(int orgId) =>
      "/api/v1/restaurants/admin/organization/$orgId";
  static String adminFeatured() => "/api/v1/restaurants/admin/featured";
  static String adminSearchCriteria() =>
      "/api/v1/restaurants/admin/search/criteria";
}

abstract class RestaurantsApi {
  // Admin CRUD
  Future<NetworkResponse<RestaurantResponse>> createRestaurantAdmin(
    RestaurantInput create,
  );
  Future<NetworkResponse<ListResponse<RestaurantResponse>>>
  getRestaurantsAdmin({
    int offset,
    int limit,
    int? restaurantOrgId,
    bool? isActive,
    bool? isOpen,
    bool? isFeatured,
    bool? isVerified,
    bool? isChain,
    bool? isHalal,
    bool? isVegetarianFriendly,
    String? search,
  });
  Future<NetworkResponse<RestaurantResponse>> getRestaurantAdmin(int id);
  Future<NetworkResponse<RestaurantResponse>> updateRestaurantAdmin(
    int id,
    RestaurantInput update,
  );
  Future<NetworkResponse<void>> deleteRestaurantAdmin(int id);
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
  });

  // Optional extras (admin)
  Future<NetworkResponse<List<RestaurantResponse>>>
  getRestaurantsByOrganizationAdmin(int orgId, {int offset, int limit});
  Future<NetworkResponse<List<RestaurantResponse>>>
  getFeaturedRestaurantsAdmin({int limit});
  Future<NetworkResponse<List<RestaurantResponse>>>
  getRestaurantsByCriteriaAdmin({
    bool? isHalal,
    bool? isVegetarianFriendly,
    double? minRating,
    int? maxPreparationTime,
    int limit,
  });
}

class RestaurantsApiImpl extends RestaurantsApi {
  @override
  Future<NetworkResponse<RestaurantResponse>> createRestaurantAdmin(
    RestaurantInput create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_RestaurantsEndpoint.adminRestaurants(), data: create.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RestaurantResponse.fromJson(json),
        );
      },
    );
  }

  @override
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
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        if (restaurantOrgId != null)
          params['restaurant_org_id'] = restaurantOrgId;
        if (isActive != null) params['is_active'] = isActive;
        if (isOpen != null) params['is_open'] = isOpen;
        if (isFeatured != null) params['is_featured'] = isFeatured;
        if (isVerified != null) params['is_verified'] = isVerified;
        if (isChain != null) params['is_chain'] = isChain;
        if (isHalal != null) params['is_halal'] = isHalal;
        if (isVegetarianFriendly != null)
          params['is_vegetarian_friendly'] = isVegetarianFriendly;
        if (search != null) params['search'] = search;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_RestaurantsEndpoint.adminRestaurants(), queryParameters: params);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => RestaurantResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<RestaurantResponse>> getRestaurantAdmin(int id) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_RestaurantsEndpoint.adminRestaurantDetail(id));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RestaurantResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<RestaurantResponse>> updateRestaurantAdmin(
    int id,
    RestaurantInput update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Map<String, dynamic> data = update.toJson();
        data.removeWhere((key, value) => value == null);
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _RestaurantsEndpoint.adminRestaurantDetail(id),
          data: data,
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RestaurantResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteRestaurantAdmin(int id) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_RestaurantsEndpoint.adminRestaurantDetail(id));
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }

  @override
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
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{};
        if (totalOrders != null) params['total_orders'] = totalOrders;
        if (completedOrders != null)
          params['completed_orders'] = completedOrders;
        if (cancelledOrders != null)
          params['cancelled_orders'] = cancelledOrders;
        if (totalRevenue != null) params['total_revenue'] = totalRevenue;
        if (averageOrderValue != null)
          params['average_order_value'] = averageOrderValue;
        if (ratingAverage != null) params['rating_average'] = ratingAverage;
        if (ratingCount != null) params['rating_count'] = ratingCount;
        if (onTimeDeliveryRate != null)
          params['on_time_delivery_rate'] = onTimeDeliveryRate;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _RestaurantsEndpoint.adminRestaurantStats(id),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RestaurantResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<List<RestaurantResponse>>>
  getRestaurantsByOrganizationAdmin(
    int orgId, {
    int offset = 0,
    int limit = 100,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _RestaurantsEndpoint.adminRestaurantsByOrg(orgId),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) =>
                  (json as List)
                      .map((e) => RestaurantResponse.fromJson(e))
                      .toList(),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<List<RestaurantResponse>>>
  getFeaturedRestaurantsAdmin({int limit = 10}) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _RestaurantsEndpoint.adminFeatured(),
          queryParameters: {'limit': limit},
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) =>
                  (json as List)
                      .map((e) => RestaurantResponse.fromJson(e))
                      .toList(),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<List<RestaurantResponse>>>
  getRestaurantsByCriteriaAdmin({
    bool? isHalal,
    bool? isVegetarianFriendly,
    double? minRating,
    int? maxPreparationTime,
    int limit = 20,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'limit': limit};
        if (isHalal != null) params['is_halal'] = isHalal;
        if (isVegetarianFriendly != null)
          params['is_vegetarian_friendly'] = isVegetarianFriendly;
        if (minRating != null) params['min_rating'] = minRating;
        if (maxPreparationTime != null)
          params['max_preparation_time'] = maxPreparationTime;
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _RestaurantsEndpoint.adminSearchCriteria(),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) =>
                  (json as List)
                      .map((e) => RestaurantResponse.fromJson(e))
                      .toList(),
        );
      },
    );
  }
}
