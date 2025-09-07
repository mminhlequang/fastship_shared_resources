/// Model cho request thanh toán (checkout)
class CheckoutRequest {
  final List<CheckoutCart> carts;
  final String? paymentMethod;
  final String? couponCode;
  final String? deliveryAddress;
  final String? deliveryInstructions;

  CheckoutRequest({
    required this.carts,
    this.paymentMethod,
    this.couponCode,
    this.deliveryAddress,
    this.deliveryInstructions,
  });

  /// Parse từ JSON
  factory CheckoutRequest.fromJson(Map<String, dynamic> json) {
    return CheckoutRequest(
      carts:
          (json['carts'] as List)
              .map((e) => CheckoutCart.fromJson(e as Map<String, dynamic>))
              .toList(),
      paymentMethod: json['payment_method'] as String?,
      couponCode: json['coupon_code'] as String?,
      deliveryAddress: json['delivery_address'] as String?,
      deliveryInstructions: json['delivery_instructions'] as String?,
    );
  }

  /// Chuyển sang JSON
  Map<String, dynamic> toJson() {
    return {
      'carts': carts.map((e) => e.toJson()).toList(),
      'payment_method': paymentMethod,
      'coupon_code': couponCode,
      'delivery_address': deliveryAddress,
      'delivery_instructions': deliveryInstructions,
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

/// Model for checkout calculation response
class CheckoutCalculationResponse {
  final List<RestaurantCheckout> restaurantCheckouts;
  final double grandTotal;
  final double totalDeliveryFee;
  final double totalTax;
  final double totalDiscount;

  CheckoutCalculationResponse({
    required this.restaurantCheckouts,
    required this.grandTotal,
    required this.totalDeliveryFee,
    required this.totalTax,
    required this.totalDiscount,
  });

  /// Parse from JSON
  factory CheckoutCalculationResponse.fromJson(Map<String, dynamic> json) {
    return CheckoutCalculationResponse(
      restaurantCheckouts:
          (json['restaurant_checkouts'] as List)
              .map((e) => RestaurantCheckout.fromJson(e))
              .toList(),
      grandTotal: (json['grand_total'] as num).toDouble(),
      totalDeliveryFee: (json['total_delivery_fee'] as num).toDouble(),
      totalTax: (json['total_tax'] as num).toDouble(),
      totalDiscount: (json['total_discount'] as num).toDouble(),
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'restaurant_checkouts':
          restaurantCheckouts.map((e) => e.toJson()).toList(),
      'grand_total': grandTotal,
      'total_delivery_fee': totalDeliveryFee,
      'total_tax': totalTax,
      'total_discount': totalDiscount,
    };
  }
}

/// Model for restaurant checkout
class RestaurantCheckout {
  final int restaurantId;
  final String restaurantName;
  final String? restaurantImageUrl;
  final double? restaurantRating;
  final int? restaurantRatingCount;
  final double subtotal;
  final double deliveryFee;
  final double tax;
  final double discount;
  final double total;
  final List<CheckoutItem> items;

  RestaurantCheckout({
    required this.restaurantId,
    required this.restaurantName,
    this.restaurantImageUrl,
    this.restaurantRating,
    this.restaurantRatingCount,
    required this.subtotal,
    required this.deliveryFee,
    required this.tax,
    required this.discount,
    required this.total,
    required this.items,
  });

  /// Parse from JSON
  factory RestaurantCheckout.fromJson(Map<String, dynamic> json) {
    return RestaurantCheckout(
      restaurantId: json['restaurant_id'] as int,
      restaurantName: json['restaurant_name'] as String,
      restaurantImageUrl: json['restaurant_image_url'] as String?,
      restaurantRating:
          json['restaurant_rating'] != null
              ? (json['restaurant_rating'] as num).toDouble()
              : null,
      restaurantRatingCount: json['restaurant_rating_count'] as int?,
      subtotal: (json['subtotal'] as num).toDouble(),
      deliveryFee: (json['delivery_fee'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      items:
          (json['items'] as List).map((e) => CheckoutItem.fromJson(e)).toList(),
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'restaurant_id': restaurantId,
      'restaurant_name': restaurantName,
      'restaurant_image_url': restaurantImageUrl,
      'restaurant_rating': restaurantRating,
      'restaurant_rating_count': restaurantRatingCount,
      'subtotal': subtotal,
      'delivery_fee': deliveryFee,
      'tax': tax,
      'discount': discount,
      'total': total,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}

/// Model for checkout item
class CheckoutItem {
  final String id;
  final String menuItemId;
  final String menuItemName;
  final String? menuItemImageUrl;
  final double menuItemPrice;
  final int quantity;
  final String? variantId;
  final String? variantName;
  final double? variantPrice;
  final List<String>? optionIds;
  final List<String>? optionNames;
  final double? optionPrice;
  final String? notes;
  final double totalPrice;

  CheckoutItem({
    required this.id,
    required this.menuItemId,
    required this.menuItemName,
    this.menuItemImageUrl,
    required this.menuItemPrice,
    required this.quantity,
    this.variantId,
    this.variantName,
    this.variantPrice,
    this.optionIds,
    this.optionNames,
    this.optionPrice,
    this.notes,
    required this.totalPrice,
  });

  /// Parse from JSON
  factory CheckoutItem.fromJson(Map<String, dynamic> json) {
    return CheckoutItem(
      id: json['id'] as String,
      menuItemId: json['menu_item_id'] as String,
      menuItemName: json['menu_item_name'] as String,
      menuItemImageUrl: json['menu_item_image_url'] as String?,
      menuItemPrice: (json['menu_item_price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      variantId: json['variant_id'] as String?,
      variantName: json['variant_name'] as String?,
      variantPrice:
          json['variant_price'] != null
              ? (json['variant_price'] as num).toDouble()
              : null,
      optionIds:
          json['option_ids'] != null
              ? (json['option_ids'] as List).map((e) => e as String).toList()
              : null,
      optionNames:
          json['option_names'] != null
              ? (json['option_names'] as List).map((e) => e as String).toList()
              : null,
      optionPrice:
          json['option_price'] != null
              ? (json['option_price'] as num).toDouble()
              : null,
      notes: json['notes'] as String?,
      totalPrice: (json['total_price'] as num).toDouble(),
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menu_item_id': menuItemId,
      'menu_item_name': menuItemName,
      'menu_item_image_url': menuItemImageUrl,
      'menu_item_price': menuItemPrice,
      'quantity': quantity,
      'variant_id': variantId,
      'variant_name': variantName,
      'variant_price': variantPrice,
      'option_ids': optionIds,
      'option_names': optionNames,
      'option_price': optionPrice,
      'notes': notes,
      'total_price': totalPrice,
    };
  }
}

/// Model for checkout response
class CheckoutResponse {
  final List<OrderResponse> orders;
  final double grandTotal;
  final String checkoutId;

  CheckoutResponse({
    required this.orders,
    required this.grandTotal,
    required this.checkoutId,
  });

  /// Parse from JSON
  factory CheckoutResponse.fromJson(Map<String, dynamic> json) {
    return CheckoutResponse(
      orders:
          (json['orders'] as List)
              .map((e) => OrderResponse.fromJson(e))
              .toList(),
      grandTotal: (json['grand_total'] as num).toDouble(),
      checkoutId: json['checkout_id'] as String,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'orders': orders.map((e) => e.toJson()).toList(),
      'grand_total': grandTotal,
      'checkout_id': checkoutId,
    };
  }
}

/// Model for order response
class OrderResponse {
  final String id;
  final int restaurantId;
  final String restaurantName;
  final String? restaurantImageUrl;
  final String customerId;
  final String status;
  final double subtotal;
  final double deliveryFee;
  final double tax;
  final double discount;
  final double total;
  final String? deliveryAddressId;
  final String? paymentMethodId;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<OrderItem> items;

  OrderResponse({
    required this.id,
    required this.restaurantId,
    required this.restaurantName,
    this.restaurantImageUrl,
    required this.customerId,
    required this.status,
    required this.subtotal,
    required this.deliveryFee,
    required this.tax,
    required this.discount,
    required this.total,
    this.deliveryAddressId,
    this.paymentMethodId,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
  });

  /// Parse from JSON
  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      id: json['id'] as String,
      restaurantId: json['restaurant_id'] as int,
      restaurantName: json['restaurant_name'] as String,
      restaurantImageUrl: json['restaurant_image_url'] as String?,
      customerId: json['customer_id'] as String,
      status: json['status'] as String,
      subtotal: (json['subtotal'] as num).toDouble(),
      deliveryFee: (json['delivery_fee'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      deliveryAddressId: json['delivery_address_id'] as String?,
      paymentMethodId: json['payment_method_id'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      items: (json['items'] as List).map((e) => OrderItem.fromJson(e)).toList(),
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'restaurant_id': restaurantId,
      'restaurant_name': restaurantName,
      'restaurant_image_url': restaurantImageUrl,
      'customer_id': customerId,
      'status': status,
      'subtotal': subtotal,
      'delivery_fee': deliveryFee,
      'tax': tax,
      'discount': discount,
      'total': total,
      'delivery_address_id': deliveryAddressId,
      'payment_method_id': paymentMethodId,
      'notes': notes,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}

/// Model for order item
class OrderItem {
  final String id;
  final String menuItemId;
  final String menuItemName;
  final String? menuItemImageUrl;
  final double menuItemPrice;
  final int quantity;
  final String? variantId;
  final String? variantName;
  final double? variantPrice;
  final List<String>? optionIds;
  final List<String>? optionNames;
  final double? optionPrice;
  final String? notes;
  final double totalPrice;

  OrderItem({
    required this.id,
    required this.menuItemId,
    required this.menuItemName,
    this.menuItemImageUrl,
    required this.menuItemPrice,
    required this.quantity,
    this.variantId,
    this.variantName,
    this.variantPrice,
    this.optionIds,
    this.optionNames,
    this.optionPrice,
    this.notes,
    required this.totalPrice,
  });

  /// Parse from JSON
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] as String,
      menuItemId: json['menu_item_id'] as String,
      menuItemName: json['menu_item_name'] as String,
      menuItemImageUrl: json['menu_item_image_url'] as String?,
      menuItemPrice: (json['menu_item_price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      variantId: json['variant_id'] as String?,
      variantName: json['variant_name'] as String?,
      variantPrice:
          json['variant_price'] != null
              ? (json['variant_price'] as num).toDouble()
              : null,
      optionIds:
          json['option_ids'] != null
              ? (json['option_ids'] as List).map((e) => e as String).toList()
              : null,
      optionNames:
          json['option_names'] != null
              ? (json['option_names'] as List).map((e) => e as String).toList()
              : null,
      optionPrice:
          json['option_price'] != null
              ? (json['option_price'] as num).toDouble()
              : null,
      notes: json['notes'] as String?,
      totalPrice: (json['total_price'] as num).toDouble(),
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menu_item_id': menuItemId,
      'menu_item_name': menuItemName,
      'menu_item_image_url': menuItemImageUrl,
      'menu_item_price': menuItemPrice,
      'quantity': quantity,
      'variant_id': variantId,
      'variant_name': variantName,
      'variant_price': variantPrice,
      'option_ids': optionIds,
      'option_names': optionNames,
      'option_price': optionPrice,
      'notes': notes,
      'total_price': totalPrice,
    };
  }
}
