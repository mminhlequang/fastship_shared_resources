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
    bool? isOpen,
    bool? isFeatured,
    bool? isVerified,
    double? minRating,
    double? maxDistance,
    int? limit,
    int? offset,
  });
  Future<NetworkResponse<RestaurantResponse>> getRestaurantCustomer(
    String restaurantId,
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
    bool? isOpen,
    bool? isFeatured,
    bool? isVerified,
    double? minRating,
    double? maxDistance,
    int? limit,
    int? offset,
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
        if (isOpen != null) params['is_open'] = isOpen;
        if (isFeatured != null) params['is_featured'] = isFeatured;
        if (isVerified != null) params['is_verified'] = isVerified;
        if (minRating != null) params['min_rating'] = minRating;
        if (maxDistance != null) params['max_distance'] = maxDistance;
        if (limit != null) params['limit'] = limit;
        if (offset != null) params['offset'] = offset;

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
    String restaurantId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_RestaurantsEndpoint.customerRestaurantDetail(restaurantId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RestaurantResponse.fromJson(json),
        );
      },
    );
  }
}
