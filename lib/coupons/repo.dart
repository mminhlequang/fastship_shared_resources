import 'package:internal_core/network/network_resources/resources.dart';

import '../models/list_response.dart';
import 'app_api.dart';
import 'models/models.dart';

class CouponRepo {
  CouponRepo._();
  static CouponRepo? _instance;

  factory CouponRepo([CouponApiImpl? api]) {
    _instance ??= CouponRepo._();
    _instance!._api = api ?? CouponApiImpl();
    return _instance!;
  }

  late CouponApiImpl _api;

  Future<NetworkResponse<CouponResponse>> createCoupon(
    CouponCreateInput input,
  ) => _api.createCoupon(input);

  Future<NetworkResponse<ListResponse<CouponResponse>>> getCoupons({
    int offset = 0,
    int limit = 100,
    int? restaurantId,
    String? createdBy,
    bool? isActive,
    String? couponType,
    String? search,
  }) => _api.getCoupons(
    offset: offset,
    limit: limit,
    restaurantId: restaurantId,
    createdBy: createdBy,
    isActive: isActive,
    couponType: couponType,
    search: search,
  );

  Future<NetworkResponse<ListResponse<CouponResponse>>> getActiveCoupons({
    int offset = 0,
    int limit = 100,
    int? restaurantId,
    String? createdBy,
    String? couponType,
    String? search,
  }) => _api.getActiveCoupons(
    offset: offset,
    limit: limit,
    restaurantId: restaurantId,
    createdBy: createdBy,
    couponType: couponType,
    search: search,
  );

  Future<NetworkResponse<CouponResponse>> getCouponById(String id) =>
      _api.getCouponById(id);

  Future<NetworkResponse<CouponResponse>> updateCoupon(
    String id,
    CouponUpdateInput input,
  ) => _api.updateCoupon(id, input);

  Future<NetworkResponse<void>> deleteCoupon(String id) =>
      _api.deleteCoupon(id);

  Future<NetworkResponse<CouponValidationResponse>> validateCoupon(
    CouponValidationRequest input,
  ) => _api.validateCoupon(input);

  Future<NetworkResponse<CouponUsageStats>> getCouponStatistics(String id) =>
      _api.getCouponStatistics(id);
}
