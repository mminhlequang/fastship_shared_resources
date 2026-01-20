import 'package:internal_core/internal_core.dart';
import 'package:internal_core/network/network.dart';

import 'package:internal_core/network/network_resources/resources.dart';

import 'models/models.dart';

class _StatisticsEndpoint {
  _StatisticsEndpoint._();

  // Partner Mobile Statistics APIs
  static String restaurantStatisticDetail() =>
      "/api/v1/statistic/partner-mobile/restaurant-statistic-detail";
  static String restaurantStatisticOverview() =>
      "/api/v1/statistic/partner-mobile/restaurant-statistic-overview";
}

abstract class StatisticsApi {
  /// Lấy chi tiết thống kê nhà hàng
  /// Bao gồm doanh thu, đơn hàng, và các mục hàng top
  Future<NetworkResponse<RestaurantStatisticDetailResponse>>
  getRestaurantStatisticDetail(int restaurantId);

  /// Lấy tổng quan thống kê nhà hàng hôm nay
  /// Bao gồm số lượng đơn hàng theo trạng thái và doanh thu hôm nay
  Future<NetworkResponse<RestaurantStatisticOverviewResponse>>
  getRestaurantStatisticOverview(int restaurantId);
}

class StatisticsApiImpl extends StatisticsApi {
  @override
  Future<NetworkResponse<RestaurantStatisticDetailResponse>>
  getRestaurantStatisticDetail(int restaurantId) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _StatisticsEndpoint.restaurantStatisticDetail(),
          queryParameters: {'restaurant_id': restaurantId},
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => RestaurantStatisticDetailResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<RestaurantStatisticOverviewResponse>>
  getRestaurantStatisticOverview(int restaurantId) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _StatisticsEndpoint.restaurantStatisticOverview(),
          queryParameters: {'restaurant_id': restaurantId},
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => RestaurantStatisticOverviewResponse.fromJson(json),
        );
      },
    );
  }
}
