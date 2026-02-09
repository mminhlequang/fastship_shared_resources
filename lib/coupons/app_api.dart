import 'package:internal_core/internal_core.dart';
import 'package:internal_core/network/network.dart';
import 'package:internal_core/network/network_resources/resources.dart';

import '../models/list_response.dart';
import 'models/models.dart';

class _CouponEndpoint {
  _CouponEndpoint._();

  // Admin / general authenticated endpoints
  static String coupons() => '/api/v1/coupons/';
  static String couponDetail(String id) => '/api/v1/coupons/$id';
  static String activeCoupons() => '/api/v1/coupons/active';
  static String validateCoupon() => '/api/v1/coupons/validate';
  static String couponStatistics(String id) => '/api/v1/coupons/$id/statistics';
}

abstract class CouponApi {
  Future<NetworkResponse<CouponResponse>> createCoupon(CouponCreateInput input);
  Future<NetworkResponse<ListResponse<CouponResponse>>> getCoupons({
    int offset,
    int limit,
    int? restaurantId,
    String? createdBy,
    bool? isActive,
  });
  Future<NetworkResponse<ListResponse<CouponResponse>>> getActiveCoupons({
    int offset,
    int limit,
    int? restaurantId,
  });
  Future<NetworkResponse<CouponResponse>> getCouponById(String id);
  Future<NetworkResponse<CouponResponse>> updateCoupon(
    String id,
    CouponUpdateInput input,
  );
  Future<NetworkResponse<void>> deleteCoupon(String id);
  Future<NetworkResponse<CouponValidationResponse>> validateCoupon(
    CouponValidationRequest input,
  );
  Future<NetworkResponse<CouponUsageStats>> getCouponStatistics(String id);
}

class CouponApiImpl extends CouponApi {
  @override
  Future<NetworkResponse<CouponResponse>> createCoupon(
    CouponCreateInput input,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_CouponEndpoint.coupons(), data: input.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CouponResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<CouponResponse>>> getCoupons({
    int offset = 0,
    int limit = 100,
    int? restaurantId,
    String? createdBy,
    bool? isActive,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        if (restaurantId != null) params['restaurant_id'] = restaurantId;
        if (createdBy != null) params['created_by'] = createdBy;
        if (isActive != null) params['is_active'] = isActive;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_CouponEndpoint.coupons(), queryParameters: params);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => CouponResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<CouponResponse>>> getActiveCoupons({
    int offset = 0,
    int limit = 100,
    int? restaurantId,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        if (restaurantId != null) params['restaurant_id'] = restaurantId;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_CouponEndpoint.activeCoupons(), queryParameters: params);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => CouponResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<CouponResponse>> getCouponById(String id) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_CouponEndpoint.couponDetail(id));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CouponResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<CouponResponse>> updateCoupon(
    String id,
    CouponUpdateInput input,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(_CouponEndpoint.couponDetail(id), data: input.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CouponResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteCoupon(String id) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_CouponEndpoint.couponDetail(id));
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }

  @override
  Future<NetworkResponse<CouponValidationResponse>> validateCoupon(
    CouponValidationRequest input,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_CouponEndpoint.validateCoupon(), data: input.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CouponValidationResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<CouponUsageStats>> getCouponStatistics(
    String id,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_CouponEndpoint.couponStatistics(id));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CouponUsageStats.fromJson(json),
        );
      },
    );
  }
}
