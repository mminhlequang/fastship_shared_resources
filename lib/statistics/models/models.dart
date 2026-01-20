/// Model cho response overview thống kê nhà hàng (hôm nay)
class RestaurantStatisticOverviewResponse {
  final OrderCounts orders;
  final double todayEarning;

  RestaurantStatisticOverviewResponse({
    required this.orders,
    required this.todayEarning,
  });

  factory RestaurantStatisticOverviewResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return RestaurantStatisticOverviewResponse(
      orders: OrderCounts.fromJson(json['orders'] as Map<String, dynamic>),
      todayEarning: (json['today_earning'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'orders': orders.toJson(), 'today_earning': todayEarning};
  }
}

/// Model cho số lượng đơn hàng theo trạng thái
class OrderCounts {
  final int pending;
  final int confirmed;
  final int completed;

  OrderCounts({
    required this.pending,
    required this.confirmed,
    required this.completed,
  });

  factory OrderCounts.fromJson(Map<String, dynamic> json) {
    return OrderCounts(
      pending: json['pending'] as int,
      confirmed: json['confirmed'] as int,
      completed: json['completed'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'pending': pending, 'confirmed': confirmed, 'completed': completed};
  }
}

/// Model cho response chi tiết thống kê nhà hàng
class RestaurantStatisticDetailResponse {
  final StatisticStats stats;

  RestaurantStatisticDetailResponse({required this.stats});

  factory RestaurantStatisticDetailResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return RestaurantStatisticDetailResponse(
      stats: StatisticStats.fromJson(json['stats'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'stats': stats.toJson()};
  }
}

/// Model cho thống kê theo các giai đoạn thời gian
class StatisticStats {
  final PeriodStatistics today;
  final PeriodStatistics week;
  final PeriodStatistics month;

  StatisticStats({
    required this.today,
    required this.week,
    required this.month,
  });

  factory StatisticStats.fromJson(Map<String, dynamic> json) {
    return StatisticStats(
      today: PeriodStatistics.fromJson(json['today'] as Map<String, dynamic>),
      week: PeriodStatistics.fromJson(json['week'] as Map<String, dynamic>),
      month: PeriodStatistics.fromJson(json['month'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'today': today.toJson(),
      'week': week.toJson(),
      'month': month.toJson(),
    };
  }
}

/// Model cho thống kê của một giai đoạn thời gian
class PeriodStatistics {
  final SummaryStats summary;
  final OrderTypeStats orderType;
  final RevenueChart revenueChart;
  final List<TopItem> topItems;

  PeriodStatistics({
    required this.summary,
    required this.orderType,
    required this.revenueChart,
    required this.topItems,
  });

  factory PeriodStatistics.fromJson(Map<String, dynamic> json) {
    return PeriodStatistics(
      summary: SummaryStats.fromJson(json['summary'] as Map<String, dynamic>),
      orderType: OrderTypeStats.fromJson(
        json['orderType'] as Map<String, dynamic>,
      ),
      revenueChart: RevenueChart.fromJson(
        json['revenueChart'] as Map<String, dynamic>,
      ),
      topItems:
          (json['topItems'] as List)
              .map((e) => TopItem.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'summary': summary.toJson(),
      'orderType': orderType.toJson(),
      'revenueChart': revenueChart.toJson(),
      'topItems': topItems.map((e) => e.toJson()).toList(),
    };
  }
}

/// Model cho tóm tắt thống kê
class SummaryStats {
  final double totalRevenue;
  final double revenueChangePercent;
  final int totalOrders;
  final double avgOrderValue;
  final double completionRatePercent;

  SummaryStats({
    required this.totalRevenue,
    required this.revenueChangePercent,
    required this.totalOrders,
    required this.avgOrderValue,
    required this.completionRatePercent,
  });

  factory SummaryStats.fromJson(Map<String, dynamic> json) {
    return SummaryStats(
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      revenueChangePercent: (json['revenueChangePercent'] as num).toDouble(),
      totalOrders: json['totalOrders'] as int,
      avgOrderValue: (json['avgOrderValue'] as num).toDouble(),
      completionRatePercent: (json['completionRatePercent'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalRevenue': totalRevenue,
      'revenueChangePercent': revenueChangePercent,
      'totalOrders': totalOrders,
      'avgOrderValue': avgOrderValue,
      'completionRatePercent': completionRatePercent,
    };
  }
}

/// Model cho thống kê theo loại đơn hàng
class OrderTypeStats {
  final OrderTypeDetail pickup;
  final OrderTypeDetail delivery;

  OrderTypeStats({required this.pickup, required this.delivery});

  factory OrderTypeStats.fromJson(Map<String, dynamic> json) {
    return OrderTypeStats(
      pickup: OrderTypeDetail.fromJson(json['pickup'] as Map<String, dynamic>),
      delivery: OrderTypeDetail.fromJson(
        json['delivery'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'pickup': pickup.toJson(), 'delivery': delivery.toJson()};
  }
}

/// Model cho chi tiết loại đơn hàng
class OrderTypeDetail {
  final int orders;
  final double revenue;

  OrderTypeDetail({required this.orders, required this.revenue});

  factory OrderTypeDetail.fromJson(Map<String, dynamic> json) {
    return OrderTypeDetail(
      orders: json['orders'] as int,
      revenue: (json['revenue'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'orders': orders, 'revenue': revenue};
  }
}

/// Model cho biểu đồ doanh thu
class RevenueChart {
  final List<ChartData> daily;

  RevenueChart({required this.daily});

  factory RevenueChart.fromJson(Map<String, dynamic> json) {
    return RevenueChart(
      daily:
          (json['daily'] as List)
              .map((e) => ChartData.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'daily': daily.map((e) => e.toJson()).toList()};
  }
}

/// Model cho dữ liệu biểu đồ
class ChartData {
  final String label;
  final double value;

  ChartData({required this.label, required this.value});

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      label: json['label'] as String,
      value: (json['value'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'label': label, 'value': value};
  }
}

/// Model cho mục hàng top
class TopItem {
  final int? id;
  final String? name;
  final int? quantity;
  final double? revenue;

  TopItem({this.id, this.name, this.quantity, this.revenue});

  factory TopItem.fromJson(Map<String, dynamic> json) {
    return TopItem(
      id: json['id'] as int?,
      name: json['name'] as String?,
      quantity: json['quantity'] as int?,
      revenue:
          json['revenue'] != null ? (json['revenue'] as num).toDouble() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'quantity': quantity, 'revenue': revenue};
  }
}
