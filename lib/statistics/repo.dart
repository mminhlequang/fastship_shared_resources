import 'package:internal_core/network/network_resources/resources.dart';

import 'app_api.dart';
import 'models/models.dart';

class StatisticsRepo {
  StatisticsRepo._();
  static StatisticsRepo? _instance;

  factory StatisticsRepo([StatisticsApi? api]) {
    _instance ??= StatisticsRepo._();
    _instance!._api = api ?? StatisticsApiImpl();
    return _instance!;
  }

  late StatisticsApi _api;

  /// Lấy chi tiết thống kê nhà hàng
  /// Bao gồm doanh thu, đơn hàng, và các mục hàng top
  Future<NetworkResponse<RestaurantStatisticDetailResponse>>
  getRestaurantStatisticDetail(int restaurantId) =>
      _api.getRestaurantStatisticDetail(restaurantId);

  /// Lấy tổng quan thống kê nhà hàng hôm nay
  /// Bao gồm số lượng đơn hàng theo trạng thái và doanh thu hôm nay
  Future<NetworkResponse<RestaurantStatisticOverviewResponse>>
  getRestaurantStatisticOverview(int restaurantId) =>
      _api.getRestaurantStatisticOverview(restaurantId);
}
