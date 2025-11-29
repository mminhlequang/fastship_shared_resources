import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';

import '../models/models.dart';
import 'models/models.dart';

class _RestaurantsEndpoint {
  _RestaurantsEndpoint._();

  // Admin
  static String adminRestaurants() => "/api/v1/admin/restaurants/";
  static String adminRestaurantDetail(int id) =>
      "/api/v1/admin/restaurants/$id";
  static String adminRestaurantStatisticsOverview(int restaurantId) =>
      "/api/v1/admin/restaurants/$restaurantId/statistics_overview";
  static String adminRestaurantStatisticsOrderAnalytics(int restaurantId) =>
      "/api/v1/admin/restaurants/$restaurantId/statistics_order_analytics";
  static String adminRestaurantStatisticsEarnings(int restaurantId) =>
      "/api/v1/admin/restaurants/$restaurantId/statistics_earnings";

  // Customer
  static String customerRestaurants() => "/api/v1/customer/restaurants/";
  static String customerRestaurantDetail(String restaurantId) =>
      "/api/v1/customer/restaurants/$restaurantId";
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
    String? onboardingStatus,
  });
  Future<NetworkResponse<RestaurantResponse>> getRestaurantAdmin(int id);
  Future<NetworkResponse<RestaurantResponse>> updateRestaurantAdmin(
    int id,
    RestaurantInput update,
  );
  Future<NetworkResponse<void>> deleteRestaurantAdmin(int id);

  // Customer APIs
  Future<NetworkResponse<ListResponse<RestaurantResponse>>>
  getRestaurantsCustomer({
    double? lat,
    double? lng,
    RestaurantSortBy? sortBy,
    List<int>? cuisineTypeIds, // Danh sách ID loại ẩm thực (có thể null)
    List<String>?
    cuisineTypeStrings, // Danh sách tên loại ẩm thực để tìm kiếm (có thể null)
    bool? isActive,
    bool? isOpen,
    bool? isFeatured,
    bool? isVerified,
    double? minRating,
    double? maxDistance,
    int? limit,
    int? offset,
    String? search,
    RestaurantResponseOptions? responseOptions,
  });
  Future<NetworkResponse<RestaurantResponse>> getRestaurantCustomer(
    String restaurantId, {
    double? lat,
    double? lng,
  });

  // Admin Statistics
  Future<NetworkResponse<RestaurantStatisticOverview>>
  getRestaurantStatisticsOverview(
    int restaurantId,
    String startPeriod,
    String endPeriod,
  );
  Future<NetworkResponse<RestaurantStatisticOrderAnalytics>>
  getRestaurantStatisticsOrderAnalytics(
    int restaurantId,
    String startPeriod,
    String endPeriod,
  );
  Future<NetworkResponse<RestaurantStatisticEarnings>>
  getRestaurantStatisticsEarnings(
    int restaurantId,
    String startPeriod,
    String endPeriod,
  );
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
    String? onboardingStatus,
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
        if (onboardingStatus != null)
          params['onboarding_status'] = onboardingStatus;
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
        ).put(_RestaurantsEndpoint.adminRestaurantDetail(id), data: data);
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
  Future<NetworkResponse<ListResponse<RestaurantResponse>>>
  getRestaurantsCustomer({
    double? lat,
    double? lng,
    RestaurantSortBy? sortBy,
    List<int>? cuisineTypeIds, // Danh sách ID loại ẩm thực (có thể null)
    List<String>?
    cuisineTypeStrings, // Danh sách tên loại ẩm thực để tìm kiếm (có thể null)
    bool? isActive,
    bool? isOpen,
    bool? isFeatured,
    bool? isVerified,
    double? minRating,
    double? maxDistance,
    int? limit,
    int? offset,
    String? search,
    RestaurantResponseOptions? responseOptions,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{};
        if (lat != null) params['lat'] = lat;
        if (lng != null) params['lng'] = lng;
        if (sortBy != null) params['sort_by'] = sortBy.name;
        if (cuisineTypeIds != null) params['cuisine_type_ids'] = cuisineTypeIds;
        if (cuisineTypeStrings != null) {
          params['cuisine_type_strings'] = cuisineTypeStrings;
        }
        if (isActive != null) params['is_active'] = isActive;
        if (isOpen != null) params['is_open'] = isOpen;
        if (isFeatured != null) params['is_featured'] = isFeatured;
        if (isVerified != null) params['is_verified'] = isVerified;
        if (minRating != null) params['min_rating'] = minRating;
        if (maxDistance != null) params['max_distance'] = maxDistance;
        if (limit != null) params['limit'] = limit;
        if (offset != null) params['offset'] = offset;
        if (search != null) params['search'] = search;
        if (responseOptions != null) {
          params['response_availability_rules'] =
              responseOptions.availabilityRules;
          params['response_restaurant_logo'] = responseOptions.restaurantLogo;
          params['response_restaurant_banners'] =
              responseOptions.restaurantBanners;
          params['response_cuisine_types'] = responseOptions.cuisineTypes;
        }
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _RestaurantsEndpoint.customerRestaurants(),
          queryParameters: params,
        );
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
  Future<NetworkResponse<RestaurantResponse>> getRestaurantCustomer(
    String restaurantId, {
    double? lat,
    double? lng,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{};
        if (lat != null) params['lat'] = lat;
        if (lng != null) params['lng'] = lng;
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _RestaurantsEndpoint.customerRestaurantDetail(restaurantId),
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
  Future<NetworkResponse<RestaurantStatisticOverview>>
  getRestaurantStatisticsOverview(
    int restaurantId,
    String startPeriod,
    String endPeriod,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{
          'start_period': startPeriod,
          'end_period': endPeriod,
        };

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _RestaurantsEndpoint.adminRestaurantStatisticsOverview(restaurantId),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RestaurantStatisticOverview.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<RestaurantStatisticOrderAnalytics>>
  getRestaurantStatisticsOrderAnalytics(
    int restaurantId,
    String startPeriod,
    String endPeriod,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{
          'start_period': startPeriod,
          'end_period': endPeriod,
        };

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _RestaurantsEndpoint.adminRestaurantStatisticsOrderAnalytics(
            restaurantId,
          ),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RestaurantStatisticOrderAnalytics.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<RestaurantStatisticEarnings>>
  getRestaurantStatisticsEarnings(
    int restaurantId,
    String startPeriod,
    String endPeriod,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{
          'start_period': startPeriod,
          'end_period': endPeriod,
        };

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _RestaurantsEndpoint.adminRestaurantStatisticsEarnings(restaurantId),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RestaurantStatisticEarnings.fromJson(json),
        );
      },
    );
  }
}
