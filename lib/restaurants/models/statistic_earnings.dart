class RestaurantStatisticEarnings {
  EarningsBreakdown? earningsBreakdown;
  List<PaymentMethods>? paymentMethods;
  String? startPeriod;
  String? endPeriod;
  num? restaurantId;

  RestaurantStatisticEarnings({
    this.earningsBreakdown,
    this.paymentMethods,
    this.startPeriod,
    this.endPeriod,
    this.restaurantId,
  });

  RestaurantStatisticEarnings.fromJson(Map<String, dynamic> json) {
    earningsBreakdown =
        json["earnings_breakdown"] == null
            ? null
            : EarningsBreakdown.fromJson(json["earnings_breakdown"]);
    paymentMethods =
        json["payment_methods"] == null
            ? null
            : (json["payment_methods"] as List)
                .map((e) => PaymentMethods.fromJson(e))
                .toList();
    startPeriod = json["start_period"];
    endPeriod = json["end_period"];
    restaurantId = json["restaurant_id"];
  }

  static List<RestaurantStatisticEarnings> fromList(
    List<Map<String, dynamic>> list,
  ) {
    return list.map(RestaurantStatisticEarnings.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (earningsBreakdown != null) {
      _data["earnings_breakdown"] = earningsBreakdown?.toJson();
    }
    if (paymentMethods != null) {
      _data["payment_methods"] =
          paymentMethods?.map((e) => e.toJson()).toList();
    }
    _data["start_period"] = startPeriod;
    _data["end_period"] = endPeriod;
    _data["restaurant_id"] = restaurantId;
    return _data;
  }
}

class PaymentMethods {
  String? paymentMethod;
  num? orderCount;
  num? totalAmount;
  num? percentage;

  PaymentMethods({
    this.paymentMethod,
    this.orderCount,
    this.totalAmount,
    this.percentage,
  });

  PaymentMethods.fromJson(Map<String, dynamic> json) {
    paymentMethod = json["payment_method"];
    orderCount = json["order_count"];
    totalAmount = json["total_amount"];
    percentage = json["percentage"];
  }

  static List<PaymentMethods> fromList(List<Map<String, dynamic>> list) {
    return list.map(PaymentMethods.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["payment_method"] = paymentMethod;
    _data["order_count"] = orderCount;
    _data["total_amount"] = totalAmount;
    _data["percentage"] = percentage;
    return _data;
  }
}

class EarningsBreakdown {
  num? totalRevenue;
  num? subtotalRevenue;
  num? deliveryFeeRevenue;
  num? taxRevenue;
  num? discountAmount;
  num? netRevenue;

  EarningsBreakdown({
    this.totalRevenue,
    this.subtotalRevenue,
    this.deliveryFeeRevenue,
    this.taxRevenue,
    this.discountAmount,
    this.netRevenue,
  });

  EarningsBreakdown.fromJson(Map<String, dynamic> json) {
    totalRevenue = json["total_revenue"];
    subtotalRevenue = json["subtotal_revenue"];
    deliveryFeeRevenue = json["delivery_fee_revenue"];
    taxRevenue = json["tax_revenue"];
    discountAmount = json["discount_amount"];
    netRevenue = json["net_revenue"];
  }

  static List<EarningsBreakdown> fromList(List<Map<String, dynamic>> list) {
    return list.map(EarningsBreakdown.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total_revenue"] = totalRevenue;
    _data["subtotal_revenue"] = subtotalRevenue;
    _data["delivery_fee_revenue"] = deliveryFeeRevenue;
    _data["tax_revenue"] = taxRevenue;
    _data["discount_amount"] = discountAmount;
    _data["net_revenue"] = netRevenue;
    return _data;
  }
}
