class RestaurantStatisticOrderAnalytics {
  Summary? summary;
  List<Orders>? orders;
  ChartData? chartData;
  String? startPeriod;
  String? endPeriod;
  num? restaurantId;

  RestaurantStatisticOrderAnalytics({
    this.summary,
    this.orders,
    this.chartData,
    this.startPeriod,
    this.endPeriod,
    this.restaurantId,
  });

  RestaurantStatisticOrderAnalytics.fromJson(Map<String, dynamic> json) {
    summary =
        json["summary"] == null ? null : Summary.fromJson(json["summary"]);
    orders =
        json["orders"] == null
            ? null
            : (json["orders"] as List).map((e) => Orders.fromJson(e)).toList();
    chartData =
        json["chart_data"] == null
            ? null
            : ChartData.fromJson(json["chart_data"]);
    startPeriod = json["start_period"];
    endPeriod = json["end_period"];
    restaurantId = json["restaurant_id"];
  }

  static List<RestaurantStatisticOrderAnalytics> fromList(
    List<Map<String, dynamic>> list,
  ) {
    return list.map(RestaurantStatisticOrderAnalytics.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (summary != null) {
      _data["summary"] = summary?.toJson();
    }
    if (orders != null) {
      _data["orders"] = orders?.map((e) => e.toJson()).toList();
    }
    if (chartData != null) {
      _data["chart_data"] = chartData?.toJson();
    }
    _data["start_period"] = startPeriod;
    _data["end_period"] = endPeriod;
    _data["restaurant_id"] = restaurantId;
    return _data;
  }
}

class ChartData {
  List<ItemAnalytics>? itemAnalytics;
  List<StatusAnalytics>? statusAnalytics;
  List<PaymentMethodAnalytics>? paymentMethodAnalytics;
  List<DailyAnalytics>? dailyAnalytics;

  ChartData({
    this.itemAnalytics,
    this.statusAnalytics,
    this.paymentMethodAnalytics,
    this.dailyAnalytics,
  });

  ChartData.fromJson(Map<String, dynamic> json) {
    itemAnalytics =
        json["item_analytics"] == null
            ? null
            : (json["item_analytics"] as List)
                .map((e) => ItemAnalytics.fromJson(e))
                .toList();
    statusAnalytics =
        json["status_analytics"] == null
            ? null
            : (json["status_analytics"] as List)
                .map((e) => StatusAnalytics.fromJson(e))
                .toList();
    paymentMethodAnalytics =
        json["payment_method_analytics"] == null
            ? null
            : (json["payment_method_analytics"] as List)
                .map((e) => PaymentMethodAnalytics.fromJson(e))
                .toList();
    dailyAnalytics =
        json["daily_analytics"] == null
            ? null
            : (json["daily_analytics"] as List)
                .map((e) => DailyAnalytics.fromJson(e))
                .toList();
  }

  static List<ChartData> fromList(List<Map<String, dynamic>> list) {
    return list.map(ChartData.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (itemAnalytics != null) {
      _data["item_analytics"] = itemAnalytics?.map((e) => e.toJson()).toList();
    }
    if (statusAnalytics != null) {
      _data["status_analytics"] =
          statusAnalytics?.map((e) => e.toJson()).toList();
    }
    if (paymentMethodAnalytics != null) {
      _data["payment_method_analytics"] =
          paymentMethodAnalytics?.map((e) => e.toJson()).toList();
    }
    if (dailyAnalytics != null) {
      _data["daily_analytics"] =
          dailyAnalytics?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class DailyAnalytics {
  String? date;
  num? ordersCount;
  num? revenue;
  num? completedOrders;

  DailyAnalytics({
    this.date,
    this.ordersCount,
    this.revenue,
    this.completedOrders,
  });

  DailyAnalytics.fromJson(Map<String, dynamic> json) {
    date = json["date"];
    ordersCount = json["orders_count"];
    revenue = json["revenue"];
    completedOrders = json["completed_orders"];
  }

  static List<DailyAnalytics> fromList(List<Map<String, dynamic>> list) {
    return list.map(DailyAnalytics.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["date"] = date;
    _data["orders_count"] = ordersCount;
    _data["revenue"] = revenue;
    _data["completed_orders"] = completedOrders;
    return _data;
  }
}

class PaymentMethodAnalytics {
  String? paymentMethod;
  num? count;
  num? percentage;
  num? totalAmount;

  PaymentMethodAnalytics({
    this.paymentMethod,
    this.count,
    this.percentage,
    this.totalAmount,
  });

  PaymentMethodAnalytics.fromJson(Map<String, dynamic> json) {
    paymentMethod = json["payment_method"];
    count = json["count"];
    percentage = json["percentage"];
    totalAmount = json["total_amount"];
  }

  static List<PaymentMethodAnalytics> fromList(
    List<Map<String, dynamic>> list,
  ) {
    return list.map(PaymentMethodAnalytics.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["payment_method"] = paymentMethod;
    _data["count"] = count;
    _data["percentage"] = percentage;
    _data["total_amount"] = totalAmount;
    return _data;
  }
}

class StatusAnalytics {
  String? status;
  num? count;
  num? percentage;
  num? totalRevenue;

  StatusAnalytics({
    this.status,
    this.count,
    this.percentage,
    this.totalRevenue,
  });

  StatusAnalytics.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    count = json["count"];
    percentage = json["percentage"];
    totalRevenue = json["total_revenue"];
  }

  static List<StatusAnalytics> fromList(List<Map<String, dynamic>> list) {
    return list.map(StatusAnalytics.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["count"] = count;
    _data["percentage"] = percentage;
    _data["total_revenue"] = totalRevenue;
    return _data;
  }
}

class ItemAnalytics {
  String? menuItemId;
  String? menuItemName;
  num? orderCount;
  num? totalQuantity;
  num? totalRevenue;
  num? averageQuantityPerOrder;

  ItemAnalytics({
    this.menuItemId,
    this.menuItemName,
    this.orderCount,
    this.totalQuantity,
    this.totalRevenue,
    this.averageQuantityPerOrder,
  });

  ItemAnalytics.fromJson(Map<String, dynamic> json) {
    menuItemId = json["menu_item_id"];
    menuItemName = json["menu_item_name"];
    orderCount = json["order_count"];
    totalQuantity = json["total_quantity"];
    totalRevenue = json["total_revenue"];
    averageQuantityPerOrder = json["average_quantity_per_order"];
  }

  static List<ItemAnalytics> fromList(List<Map<String, dynamic>> list) {
    return list.map(ItemAnalytics.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["menu_item_id"] = menuItemId;
    _data["menu_item_name"] = menuItemName;
    _data["order_count"] = orderCount;
    _data["total_quantity"] = totalQuantity;
    _data["total_revenue"] = totalRevenue;
    _data["average_quantity_per_order"] = averageQuantityPerOrder;
    return _data;
  }
}

class Orders {
  String? orderId;
  String? customerId;
  String? status;
  num? subtotal;
  num? totalAmount;
  String? paymentMethod;
  String? paymentStatus;
  String? createdAt;
  String? updatedAt;

  Orders({
    this.orderId,
    this.customerId,
    this.status,
    this.subtotal,
    this.totalAmount,
    this.paymentMethod,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
  });

  Orders.fromJson(Map<String, dynamic> json) {
    orderId = json["order_id"];
    customerId = json["customer_id"];
    status = json["status"];
    subtotal = json["subtotal"];
    totalAmount = json["total_amount"];
    paymentMethod = json["payment_method"];
    paymentStatus = json["payment_status"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  static List<Orders> fromList(List<Map<String, dynamic>> list) {
    return list.map(Orders.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["order_id"] = orderId;
    _data["customer_id"] = customerId;
    _data["status"] = status;
    _data["subtotal"] = subtotal;
    _data["total_amount"] = totalAmount;
    _data["payment_method"] = paymentMethod;
    _data["payment_status"] = paymentStatus;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Summary {
  num? totalOrders;
  num? completedOrders;
  num? cancelledOrders;
  num? pendingOrders;
  num? preparingOrders;
  num? readyOrders;
  num? averageOrderValue;
  num? totalRevenue;

  Summary({
    this.totalOrders,
    this.completedOrders,
    this.cancelledOrders,
    this.pendingOrders,
    this.preparingOrders,
    this.readyOrders,
    this.averageOrderValue,
    this.totalRevenue,
  });

  Summary.fromJson(Map<String, dynamic> json) {
    totalOrders = json["total_orders"];
    completedOrders = json["completed_orders"];
    cancelledOrders = json["cancelled_orders"];
    pendingOrders = json["pending_orders"];
    preparingOrders = json["preparing_orders"];
    readyOrders = json["ready_orders"];
    averageOrderValue = json["average_order_value"];
    totalRevenue = json["total_revenue"];
  }

  static List<Summary> fromList(List<Map<String, dynamic>> list) {
    return list.map(Summary.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total_orders"] = totalOrders;
    _data["completed_orders"] = completedOrders;
    _data["cancelled_orders"] = cancelledOrders;
    _data["pending_orders"] = pendingOrders;
    _data["preparing_orders"] = preparingOrders;
    _data["ready_orders"] = readyOrders;
    _data["average_order_value"] = averageOrderValue;
    _data["total_revenue"] = totalRevenue;
    return _data;
  }
}
