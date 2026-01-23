import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_resources/restaurants/models/models.dart';
import 'package:shared_resources/shared_resources.dart';
import 'package:easy_localization/easy_localization.dart';

/// Model cho địa chỉ giao hàng trong request thanh toán
class CheckoutRequestDeliveryAddress {
  final String? address;
  final double lat;
  final double lng;
  final String? city;
  final String? district;
  final String? ward;

  CheckoutRequestDeliveryAddress({
    this.address,
    required this.lat,
    required this.lng,
    this.city,
    this.district,
    this.ward,
  });

  factory CheckoutRequestDeliveryAddress.fromJson(Map<String, dynamic> json) {
    return CheckoutRequestDeliveryAddress(
      address: json['address'] as String?,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      city: json['city'] as String?,
      district: json['district'] as String?,
      ward: json['ward'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'lat': lat,
      'lng': lng,
      'city': city,
      'district': district,
      'ward': ward,
    };
  }
}

/// Model cho request thanh toán (checkout)
class CheckoutRequest {
  final List<CheckoutCart> carts;
  final String paymentMethod;
  final String? couponCode;
  final CheckoutRequestDeliveryAddress? deliveryAddress;
  final String? deliveryInstructions;
  final bool? usePaymentIntent;

  CheckoutRequest({
    required this.carts,
    required this.paymentMethod,
    this.couponCode,
    this.deliveryAddress,
    this.deliveryInstructions,
    this.usePaymentIntent,
  });

  /// Chuyển sang JSON
  Map<String, dynamic> toJson() {
    return {
      'carts': carts.map((e) => e.toJson()).toList(),
      'payment_method': paymentMethod,
      'coupon_code': couponCode,
      'delivery_address': deliveryAddress?.toJson(),
      'delivery_instructions': deliveryInstructions,
      'use_payment_intent': usePaymentIntent,
    };
  }
}

/// Model cho từng giỏ hàng trong request thanh toán
class CheckoutCart {
  final String cartId;
  final int restaurantId;
  final List<CheckoutCartItem> items;

  CheckoutCart({
    required this.cartId,
    required this.restaurantId,
    required this.items,
  });

  factory CheckoutCart.fromJson(Map<String, dynamic> json) {
    return CheckoutCart(
      cartId: json['cart_id'] as String,
      restaurantId: json['restaurant_id'] as int,
      items:
          (json['items'] as List)
              .map((e) => CheckoutCartItem.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cart_id': cartId,
      'restaurant_id': restaurantId,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}

/// Model cho từng item trong giỏ hàng khi thanh toán
class CheckoutCartItem {
  final String menuItemId;
  final int quantity;
  final List<String>? selectedVariantIds;
  final List<String>? selectedOptionIds;
  final String? note;

  CheckoutCartItem({
    required this.menuItemId,
    required this.quantity,
    this.selectedVariantIds,
    this.selectedOptionIds,
    this.note,
  });

  factory CheckoutCartItem.fromJson(Map<String, dynamic> json) {
    return CheckoutCartItem(
      menuItemId: json['menu_item_id'] as String,
      quantity: json['quantity'] as int,
      selectedVariantIds:
          json['selected_variant_ids'] != null
              ? (json['selected_variant_ids'] as List)
                  .map((e) => e as String)
                  .toList()
              : null,
      selectedOptionIds:
          json['selected_option_ids'] != null
              ? (json['selected_option_ids'] as List)
                  .map((e) => e as String)
                  .toList()
              : null,
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menu_item_id': menuItemId,
      'quantity': quantity,
      'selected_variant_ids': selectedVariantIds,
      'selected_option_ids': selectedOptionIds,
      'note': note,
    };
  }
}

class CheckoutCalculationResponse {
  int? subtotal;
  int? discountAmount;
  int? deliveryFee;
  int? taxAmount;
  int? totalAmount;
  String? currencyCode;
  String? currencySymbol;
  dynamic appliedCoupon;
  List<RestaurantBreakdown>? restaurantBreakdown;

  CheckoutCalculationResponse({
    this.subtotal,
    this.discountAmount,
    this.deliveryFee,
    this.taxAmount,
    this.totalAmount,
    this.currencyCode,
    this.currencySymbol,
    this.appliedCoupon,
    this.restaurantBreakdown,
  });

  CheckoutCalculationResponse.fromJson(Map<String, dynamic> json) {
    subtotal = json["subtotal"];
    discountAmount = json["discount_amount"];
    deliveryFee = json["delivery_fee"];
    taxAmount = json["tax_amount"];
    totalAmount = json["total_amount"];
    currencyCode = json["currency_code"];
    currencySymbol = json["currency_symbol"];
    appliedCoupon = json["applied_coupon"];
    restaurantBreakdown =
        json["restaurant_breakdown"] == null
            ? null
            : (json["restaurant_breakdown"] as List)
                .map((e) => RestaurantBreakdown.fromJson(e))
                .toList();
  }

  static List<CheckoutCalculationResponse> fromList(
    List<Map<String, dynamic>> list,
  ) {
    return list.map(CheckoutCalculationResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["subtotal"] = subtotal;
    _data["discount_amount"] = discountAmount;
    _data["delivery_fee"] = deliveryFee;
    _data["tax_amount"] = taxAmount;
    _data["total_amount"] = totalAmount;
    _data["currency_code"] = currencyCode;
    _data["currency_symbol"] = currencySymbol;
    _data["applied_coupon"] = appliedCoupon;
    if (restaurantBreakdown != null) {
      _data["restaurant_breakdown"] =
          restaurantBreakdown?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class RestaurantBreakdown {
  int? restaurantId;
  int? subtotal;
  int? deliveryFee;
  int? itemCount;

  RestaurantBreakdown({
    this.restaurantId,
    this.subtotal,
    this.deliveryFee,
    this.itemCount,
  });

  RestaurantBreakdown.fromJson(Map<String, dynamic> json) {
    restaurantId = json["restaurant_id"];
    subtotal = json["subtotal"];
    deliveryFee = json["delivery_fee"];
    itemCount = json["item_count"];
  }

  static List<RestaurantBreakdown> fromList(List<Map<String, dynamic>> list) {
    return list.map(RestaurantBreakdown.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["restaurant_id"] = restaurantId;
    _data["subtotal"] = subtotal;
    _data["delivery_fee"] = deliveryFee;
    _data["item_count"] = itemCount;
    return _data;
  }
}

/// Model for checkout response
/// Model cho PaymentIntent (Stripe hoặc các cổng thanh toán khác)
class PaymentIntent {
  final String id;
  final String clientSecret;
  final int amount;
  final String currency;
  final String status;
  final int created;

  PaymentIntent({
    required this.id,
    required this.clientSecret,
    required this.amount,
    required this.currency,
    required this.status,
    required this.created,
  });

  /// Parse từ JSON
  factory PaymentIntent.fromJson(Map<String, dynamic> json) {
    return PaymentIntent(
      id: json['id'] as String,
      clientSecret: json['client_secret'] as String,
      amount: json['amount'] as int,
      currency: json['currency'] as String,
      status: json['status'] as String,
      created: json['created'] as int,
    );
  }

  /// Convert sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'client_secret': clientSecret,
      'amount': amount,
      'currency': currency,
      'status': status,
      'created': created,
    };
  }
}

/// Model cho CheckoutSession (Stripe Checkout hoặc các cổng thanh toán khác)
class CheckoutSession {
  final String id;
  final String url;

  CheckoutSession({required this.id, required this.url});

  /// Parse từ JSON
  factory CheckoutSession.fromJson(Map<String, dynamic> json) {
    return CheckoutSession(
      id: json['id'] as String,
      url: json['url'] as String,
    );
  }

  /// Convert sang JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'url': url};
  }
}

/// Model cho checkout response
class CheckoutResponse {
  final List<OrderResponse> orders;
  final CheckoutCalculationResponse? checkoutCalculation;
  final PaymentIntent? paymentIntent;
  final CheckoutSession? checkoutSession;
  CheckoutResponse({
    required this.orders,
    required this.checkoutCalculation,
    this.paymentIntent,
    this.checkoutSession,
  });

  /// Parse từ JSON
  factory CheckoutResponse.fromJson(Map<String, dynamic> json) {
    return CheckoutResponse(
      orders:
          json['orders'] is List
              ? (json['orders'] as List)
                  .map((e) => OrderResponse.fromJson(e))
                  .toList()
              : [],
      checkoutCalculation:
          json['checkout_calculation'] != null
              ? CheckoutCalculationResponse.fromJson(
                json['checkout_calculation'],
              )
              : null,
      paymentIntent:
          json['payment_intent'] != null
              ? PaymentIntent.fromJson(json['payment_intent'])
              : null,
      checkoutSession:
          json['checkout_session'] != null
              ? CheckoutSession.fromJson(json['checkout_session'])
              : null,
    );
  }

  /// Convert sang JSON
  Map<String, dynamic> toJson() {
    return {
      'orders': orders.map((e) => e.toJson()).toList(),
      'checkout_calculation': checkoutCalculation?.toJson(),
      'payment_intent': paymentIntent?.toJson(),
      'checkout_session': checkoutSession?.toJson(),
    };
  }
}

/// Model thông tin tài xế (driver_info)
class DriverInfo {
  final String? id;
  final String? fullName;
  final String? phone;
  final String? email;
  final String? avatarUrl;
  final bool? isOnline;
  final bool? isAvailable;
  final double? ratingAverage;
  final int? ratingCount;

  DriverInfo({
    this.id,
    this.fullName,
    this.phone,
    this.email,
    this.avatarUrl,
    this.isOnline,
    this.isAvailable,
    this.ratingAverage,
    this.ratingCount,
  });

  factory DriverInfo.fromJson(Map<String, dynamic> json) {
    return DriverInfo(
      id: json['id'] as String?,
      fullName: json['full_name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      isOnline: json['is_online'] as bool?,
      isAvailable: json['is_available'] as bool?,
      ratingAverage:
          json['rating_average'] != null
              ? (json['rating_average'] as num?)?.toDouble()
              : null,
      ratingCount: json['rating_count'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'phone': phone,
      'email': email,
      'avatar_url': avatarUrl,
      'is_online': isOnline,
      'is_available': isAvailable,
      'rating_average': ratingAverage,
      'rating_count': ratingCount,
    };
  }
}

class OrderResponse {
  String? createdAt;
  String? updatedAt;
  String? customerId;
  int? restaurantId;
  String? driverId;
  String? status;
  Map<String, dynamic>? cartSnapshot;
  int? subtotal;
  int? discountAmount;
  int? deliveryFee;
  int? taxAmount;
  int? totalAmount;
  String? paymentMethod;
  String? paymentStatus;
  String? stripeChargeId;
  String? paymentIntentId;
  String? couponId;
  String? id;
  // List<dynamic>? orderItems;
  String? currencyCode;
  String? currencySymbol;
  DriverInfo? driverInfo;
  RestaurantResponse? restaurant;

  OrderResponse({
    this.createdAt,
    this.updatedAt,
    this.customerId,
    this.restaurantId,
    this.driverId,
    this.status,
    this.cartSnapshot,
    this.subtotal,
    this.discountAmount,
    this.deliveryFee,
    this.taxAmount,
    this.totalAmount,
    this.paymentMethod,
    this.paymentStatus,
    this.stripeChargeId,
    this.paymentIntentId,
    this.couponId,
    this.id,
    // this.orderItems,
    this.currencyCode,
    this.currencySymbol,
    this.driverInfo,
    this.restaurant,
  });

  OrderResponse.fromJson(Map<String, dynamic> json) {
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    customerId = json["customer_id"];
    restaurantId = json["restaurant_id"];
    driverId = json["driver_id"];
    status = json["status"];
    cartSnapshot =
        json["cart_snapshot"] == null
            ? null
            : Map<String, dynamic>.from(json["cart_snapshot"]);
    subtotal = json["subtotal"];
    discountAmount = json["discount_amount"];
    deliveryFee = json["delivery_fee"];
    taxAmount = json["tax_amount"];
    totalAmount = json["total_amount"];
    paymentMethod = json["payment_method"];
    paymentStatus = json["payment_status"];
    stripeChargeId = json["stripe_charge_id"];
    paymentIntentId = json["payment_intent_id"];
    couponId = json["coupon_id"];
    id = json["id"];
    // orderItems = json["order_items"] ?? [];
    currencyCode = json["currency_code"];
    currencySymbol = json["currency_symbol"];
    driverInfo =
        json["driver_info"] != null
            ? DriverInfo.fromJson(json["driver_info"])
            : null;
    restaurant =
        json["restaurant_details"] != null
            ? RestaurantResponse.fromJson(json["restaurant_details"])
            : null;
  }

  static List<OrderResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(OrderResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["customer_id"] = customerId;
    _data["restaurant_id"] = restaurantId;
    _data["driver_id"] = driverId;
    _data["status"] = status;
    if (cartSnapshot != null) {
      _data["cart_snapshot"] = cartSnapshot;
    }
    _data["subtotal"] = subtotal;
    _data["discount_amount"] = discountAmount;
    _data["delivery_fee"] = deliveryFee;
    _data["tax_amount"] = taxAmount;
    _data["total_amount"] = totalAmount;
    _data["payment_method"] = paymentMethod;
    _data["payment_status"] = paymentStatus;
    _data["stripe_charge_id"] = stripeChargeId;
    _data["payment_intent_id"] = paymentIntentId;
    _data["coupon_id"] = couponId;
    _data["id"] = id;
    // if (orderItems != null) {
    //   _data["order_items"] = orderItems;
    // }
    _data["currency_code"] = currencyCode;
    _data["currency_symbol"] = currencySymbol;
    if (driverInfo != null) {
      _data["driver_info"] = driverInfo!.toJson();
    }
    if (restaurant != null) {
      _data["restaurant_details"] = restaurant!.toJson();
    }
    return _data;
  }

  String get shortId => id!.substring(0, 8);

  // Getters để lấy thông tin từ cartSnapshot một cách đồng bộ
  String get customerName {
    return cartSnapshot?['customer']?['full_name']?.toString() ?? 'Khách hàng';
  }

  String get customerPhone {
    return cartSnapshot?['customer']?['phone']?.toString() ?? 'N/A';
  }

  String get customerEmail {
    return cartSnapshot?['customer']?['email']?.toString() ?? 'N/A';
  }

  bool get isDelivery {
    return cartSnapshot?['delivery_address'] != null;
  }

  bool get isPickup {
    return cartSnapshot?['delivery_address'] == null;
  }

  String get deliveryAddress {
    return cartSnapshot?['delivery_address']?['address']?.toString() ?? 'N/A';
  }

  double get deliveryAddressLatitude {
    return cartSnapshot?['delivery_address']?['lat']?.toDouble() ?? 0.0;
  }

  double get deliveryAddressLongitude {
    return cartSnapshot?['delivery_address']?['lng']?.toDouble() ?? 0.0;
  }

  String? get deliveryInstructions {
    return cartSnapshot?['delivery_instructions'] ??
        cartSnapshot?['delivery_address']?['note'];
  }

  String get restaurantName {
    return cartSnapshot?['restaurant']?['name']?.toString() ?? 'N/A';
  }

  String? get restaurantLogoUrl {
    return restaurant?.restaurantLogo?.displayUrl ??
        cartSnapshot?['restaurant']?['logo_url'];
  }

  String get restaurantAddress {
    return cartSnapshot?['restaurant']?['formatted_address']?.toString() ??
        'N/A';
  }

  String get restaurantPhone {
    return cartSnapshot?['restaurant']?['contact_phone']?.toString() ?? 'N/A';
  }

  String get restaurantEmail {
    return cartSnapshot?['restaurant']?['contact_email']?.toString() ?? 'N/A';
  }

  int get itemsCount {
    return (cartSnapshot?['items'] as List?)?.length ?? 0;
  }

  List get items {
    return (cartSnapshot?['items'] as List?) ?? [];
  }

  String get formattedCreatedAt {
    if (createdAt == null) return 'N/A';
    try {
      final date = DateTime.parse(createdAt!).toLocal();
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return createdAt!;
    }
  }

  OrderStatus get statusEnum {
    return OrderStatus.values.firstWhere(
      (e) => e.value == status,
      orElse: () => OrderStatus.pending,
    );
  }

  AppPaymentMethod get paymentMethodEnum {
    return AppPaymentMethod.values.firstWhere(
      (e) => e.value == paymentMethod,
      orElse: () => AppPaymentMethod.cash,
    );
  }

  PaymentStatus get paymentStatusEnum {
    return PaymentStatus.values.firstWhere(
      (e) => e.value == paymentStatus,
      orElse: () => PaymentStatus.unpaid,
    );
  }
}

/// Model cho cập nhật order (Admin)
class OrderUpdate {
  String? status;
  String? paymentStatus;
  String? deliveryType;
  String? driverId;
  String? notes;
  double? deliveryFee;
  double? taxAmount;
  double? totalAmount;

  OrderUpdate({
    this.status,
    this.paymentStatus,
    this.deliveryType,
    this.driverId,
    this.notes,
    this.deliveryFee,
    this.taxAmount,
    this.totalAmount,
  });

  factory OrderUpdate.fromJson(Map<String, dynamic> json) {
    return OrderUpdate(
      status: json['status'] as String?,
      paymentStatus: json['payment_status'] as String?,
      deliveryType: json['delivery_type'] as String?,
      driverId: json['driver_id'] as String?,
      notes: json['notes'] as String?,
      deliveryFee:
          json['delivery_fee'] != null
              ? (json['delivery_fee'] as num).toDouble()
              : null,
      taxAmount:
          json['tax_amount'] != null
              ? (json['tax_amount'] as num).toDouble()
              : null,
      totalAmount:
          json['total_amount'] != null
              ? (json['total_amount'] as num).toDouble()
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'payment_status': paymentStatus,
      'delivery_type': deliveryType,
      'driver_id': driverId,
      'notes': notes,
      'delivery_fee': deliveryFee,
      'tax_amount': taxAmount,
      'total_amount': totalAmount,
    };
  }
}
