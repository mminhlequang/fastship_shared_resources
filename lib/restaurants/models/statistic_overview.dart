class RestaurantStatisticOverview {
  int? totalCompletedOrders;
  int? totalCancelledOrders;
  int? totalRevenue;
  List<MenuItemStatistics>? menuItemStatistics;
  List<ActiveOrders>? activeOrders;
  String? startPeriod;
  String? endPeriod;
  int? restaurantId;

  RestaurantStatisticOverview({
    this.totalCompletedOrders,
    this.totalCancelledOrders,
    this.totalRevenue,
    this.menuItemStatistics,
    this.activeOrders,
    this.startPeriod,
    this.endPeriod,
    this.restaurantId,
  });

  RestaurantStatisticOverview.fromJson(Map<String, dynamic> json) {
    totalCompletedOrders = json["total_completed_orders"];
    totalCancelledOrders = json["total_cancelled_orders"];
    totalRevenue = json["total_revenue"];
    menuItemStatistics =
        json["menu_item_statistics"] == null
            ? null
            : (json["menu_item_statistics"] as List)
                .map((e) => MenuItemStatistics.fromJson(e))
                .toList();
    activeOrders =
        json["active_orders"] == null
            ? null
            : (json["active_orders"] as List)
                .map((e) => ActiveOrders.fromJson(e))
                .toList();
    startPeriod = json["start_period"];
    endPeriod = json["end_period"];
    restaurantId = json["restaurant_id"];
  }

  static List<RestaurantStatisticOverview> fromList(
    List<Map<String, dynamic>> list,
  ) {
    return list.map(RestaurantStatisticOverview.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total_completed_orders"] = totalCompletedOrders;
    _data["total_cancelled_orders"] = totalCancelledOrders;
    _data["total_revenue"] = totalRevenue;
    if (menuItemStatistics != null) {
      _data["menu_item_statistics"] =
          menuItemStatistics?.map((e) => e.toJson()).toList();
    }
    if (activeOrders != null) {
      _data["active_orders"] = activeOrders?.map((e) => e.toJson()).toList();
    }
    _data["start_period"] = startPeriod;
    _data["end_period"] = endPeriod;
    _data["restaurant_id"] = restaurantId;
    return _data;
  }
}

class ActiveOrders {
  String? id;
  String? customerId;
  String? status;
  int? subtotal;
  int? totalAmount;
  String? paymentMethod;
  String? paymentStatus;
  String? createdAt;

  ActiveOrders({
    this.id,
    this.customerId,
    this.status,
    this.subtotal,
    this.totalAmount,
    this.paymentMethod,
    this.paymentStatus,
    this.createdAt,
  });

  ActiveOrders.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    customerId = json["customer_id"];
    status = json["status"];
    subtotal = json["subtotal"];
    totalAmount = json["total_amount"];
    paymentMethod = json["payment_method"];
    paymentStatus = json["payment_status"];
    createdAt = json["created_at"];
  }

  static List<ActiveOrders> fromList(List<Map<String, dynamic>> list) {
    return list.map(ActiveOrders.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["customer_id"] = customerId;
    _data["status"] = status;
    _data["subtotal"] = subtotal;
    _data["total_amount"] = totalAmount;
    _data["payment_method"] = paymentMethod;
    _data["payment_status"] = paymentStatus;
    _data["created_at"] = createdAt;
    return _data;
  }
}

class MenuItemStatistics {
  String? menuItemId;
  String? menuItemName;
  int? totalQuantity;
  int? totalOrders;
  int? totalRevenue;

  MenuItemStatistics({
    this.menuItemId,
    this.menuItemName,
    this.totalQuantity,
    this.totalOrders,
    this.totalRevenue,
  });

  MenuItemStatistics.fromJson(Map<String, dynamic> json) {
    menuItemId = json["menu_item_id"];
    menuItemName = json["menu_item_name"];
    totalQuantity = json["total_quantity"];
    totalOrders = json["total_orders"];
    totalRevenue = json["total_revenue"];
  }

  static List<MenuItemStatistics> fromList(List<Map<String, dynamic>> list) {
    return list.map(MenuItemStatistics.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["menu_item_id"] = menuItemId;
    _data["menu_item_name"] = menuItemName;
    _data["total_quantity"] = totalQuantity;
    _data["total_orders"] = totalOrders;
    _data["total_revenue"] = totalRevenue;
    return _data;
  }
}
