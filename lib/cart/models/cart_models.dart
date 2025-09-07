import 'package:shared_resources/menu/menu.dart';

/// Model for cart item add request
/// Model cho request thêm item vào giỏ hàng, phù hợp với API mới
class CartItemAddRequest {
  final int restaurantId;
  final String menuItemId;
  final int quantity;
  final String? note;
  final List<String>? selectedVariantIds;
  final List<String>? selectedOptionIds;

  CartItemAddRequest({
    required this.restaurantId,
    required this.menuItemId,
    required this.quantity,
    this.note,
    this.selectedVariantIds,
    this.selectedOptionIds,
  });

  /// Parse từ JSON
  factory CartItemAddRequest.fromJson(Map<String, dynamic> json) {
    return CartItemAddRequest(
      restaurantId: json['restaurant_id'] as int,
      menuItemId: json['menu_item_id'] as String,
      quantity: json['quantity'] as int,
      note: json['note'] as String?,
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
    );
  }

  /// Chuyển sang JSON
  Map<String, dynamic> toJson() {
    return {
      'restaurant_id': restaurantId,
      'menu_item_id': menuItemId,
      'quantity': quantity,
      'note': note,
      'selected_variant_ids': selectedVariantIds,
      'selected_option_ids': selectedOptionIds,
    };
  }
}

/// Model for cart item update request
class CartItemUpdateRequest {
  final String cartItemId;
  final int quantity;
  final String? note;
  final List<String>? selectedVariantIds;
  final List<String>? selectedOptionIds;

  CartItemUpdateRequest({
    required this.cartItemId,
    required this.quantity,
    this.note,
    this.selectedVariantIds,
    this.selectedOptionIds,
  });

  /// Parse from JSON
  factory CartItemUpdateRequest.fromJson(Map<String, dynamic> json) {
    return CartItemUpdateRequest(
      cartItemId: json['cart_item_id'] as String,
      quantity: json['quantity'] as int,
      note: json['note'] as String?,
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
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'cart_item_id': cartItemId,
      'quantity': quantity,
      'note': note,
      'selected_variant_ids': selectedVariantIds,
      'selected_option_ids': selectedOptionIds,
    };
  }
}

class CartModel {
  String? cartId;
  int? restaurantId;
  String? restaurantName;
  String? restaurantAddress;
  String? restaurantImageUrl;
  List<CartItemModel>? items;
  num? totalItems;
  num? totalPrice;
  String? createdAt;
  String? updatedAt;

  CartModel({
    this.cartId,
    this.restaurantId,
    this.restaurantName,
    this.restaurantAddress,
    this.restaurantImageUrl,
    this.items,
    this.totalItems,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    cartId = json["cart_id"];
    restaurantId = json["restaurant_id"];
    restaurantName = json["restaurant_name"];
    restaurantAddress = json["restaurant_address"];
    restaurantImageUrl = json["restaurant_image_url"];
    items =
        json["items"] == null
            ? null
            : (json["items"] as List)
                .map((e) => CartItemModel.fromJson(e))
                .toList();
    totalItems = json["total_items"];
    totalPrice = json["total_price"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  static List<CartModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["cart_id"] = cartId;
    _data["restaurant_id"] = restaurantId;
    _data["restaurant_name"] = restaurantName;
    _data["restaurant_address"] = restaurantAddress;
    _data["restaurant_image_url"] = restaurantImageUrl;
    if (items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    _data["total_items"] = totalItems;
    _data["total_price"] = totalPrice;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class CartItemModel {
  String? id;
  String? menuItemId;
  int? quantity;
  String? note;
  List<MenuItemVariantValueResponse>? selectedVariants;
  List<MenuItemOptionValueResponse>? selectedOptions;
  String? menuItemName;
  num? menuItemPrice;
  String? menuItemImageUrl;
  num? totalPrice;

  CartItemModel({
    this.id,
    this.menuItemId,
    this.quantity,
    this.note,
    this.selectedVariants,
    this.selectedOptions,
    this.menuItemName,
    this.menuItemPrice,
    this.menuItemImageUrl,
    this.totalPrice,
  });

  CartItemModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    menuItemId = json["menu_item_id"];
    quantity = json["quantity"];
    note = json["note"];
    selectedVariants =
        json["selected_variants"] == null
            ? null
            : (json["selected_variants"] as List)
                .map((e) => MenuItemVariantValueResponse.fromJson(e))
                .toList();
    selectedOptions =
        json["selected_options"] == null
            ? null
            : (json["selected_options"] as List)
                .map((e) => MenuItemOptionValueResponse.fromJson(e))
                .toList();
    menuItemName = json["menu_item_name"];
    menuItemPrice = json["menu_item_price"];
    menuItemImageUrl = json["menu_item_image_url"];
    totalPrice = json["total_price"];
  }

  static List<CartItemModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartItemModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["menu_item_id"] = menuItemId;
    _data["quantity"] = quantity;
    _data["note"] = note;
    if (selectedVariants != null) {
      _data["selected_variants"] =
          selectedVariants?.map((e) => e.toJson()).toList();
    }
    if (selectedOptions != null) {
      _data["selected_options"] =
          selectedOptions?.map((e) => e.toJson()).toList();
    }
    _data["menu_item_name"] = menuItemName;
    _data["menu_item_price"] = menuItemPrice;
    _data["menu_item_image_url"] = menuItemImageUrl;
    _data["total_price"] = totalPrice;
    return _data;
  }
}
