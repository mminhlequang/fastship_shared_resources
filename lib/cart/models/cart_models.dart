import 'package:shared_resources/common_assets/common_assets.dart';

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
  bool? restaurantIsActive;
  bool? restaurantIsOpen;
  String? restaurantName;
  CommonAssetResponse? restaurantLogo;
  List<CartItemModel>? items;
  num? totalItems;
  num? totalPrice;
  String? createdAt;
  String? updatedAt;

  CartModel({
    this.cartId,
    this.restaurantId,
    this.restaurantIsActive,
    this.restaurantIsOpen,
    this.restaurantName,
    this.restaurantLogo,
    this.items,
    this.totalItems,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    cartId = json["cart_id"];
    restaurantId = json["restaurant_id"];
    restaurantIsActive = json["restaurant_is_active"];
    restaurantIsOpen = json["restaurant_is_open"];
    restaurantName = json["restaurant_name"];
    restaurantLogo =
        json["restaurant_logo"] != null
            ? CommonAssetResponse.fromJson(json["restaurant_logo"])
            : null;
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
    _data["restaurant_is_active"] = restaurantIsActive;
    _data["restaurant_is_open"] = restaurantIsOpen;
    _data["restaurant_name"] = restaurantName;
    _data["restaurant_logo"] = restaurantLogo?.toJson();
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
  List<CartItemVariant>? selectedVariants;
  List<CartItemOption>? selectedOptions;
  String? menuItemName;
  num? menuItemPrice;
  String? menuItemDescription;
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
    this.menuItemDescription,
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
                .map((e) => CartItemVariant.fromJson(e))
                .toList();
    selectedOptions =
        json["selected_options"] == null
            ? null
            : (json["selected_options"] as List)
                .map((e) => CartItemOption.fromJson(e))
                .toList();
    menuItemName = json["menu_item_name"];
    menuItemPrice = json["menu_item_price"];
    menuItemDescription = json["menu_item_description"];
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
    _data["menu_item_description"] = menuItemDescription;
    _data["menu_item_image_url"] = menuItemImageUrl;
    _data["total_price"] = totalPrice;
    return _data;
  }
}

class CartItemVariant {
  String? variantGroupId;
  String? variantGroupName;
  String? variantGroupDescription;
  bool? variantGroupIsRequired;
  int? variantGroupMinSelect;
  int? variantGroupMaxSelect;
  String? variantValueId;
  String? variantValueName;
  String? variantValueDescription;
  int? variantValueExtraPrice;
  bool? variantValueIsDefault;
  bool? variantValueIsAvailable;
  String? variantValueImageUrl;

  CartItemVariant({
    this.variantGroupId,
    this.variantGroupName,
    this.variantGroupDescription,
    this.variantGroupIsRequired,
    this.variantGroupMinSelect,
    this.variantGroupMaxSelect,
    this.variantValueId,
    this.variantValueName,
    this.variantValueDescription,
    this.variantValueExtraPrice,
    this.variantValueIsDefault,
    this.variantValueIsAvailable,
    this.variantValueImageUrl,
  });

  CartItemVariant.fromJson(Map<String, dynamic> json) {
    variantGroupId = json["variant_group_id"];
    variantGroupName = json["variant_group_name"];
    variantGroupDescription = json["variant_group_description"];
    variantGroupIsRequired = json["variant_group_is_required"];
    variantGroupMinSelect = json["variant_group_min_select"];
    variantGroupMaxSelect = json["variant_group_max_select"];
    variantValueId = json["variant_value_id"];
    variantValueName = json["variant_value_name"];
    variantValueDescription = json["variant_value_description"];
    variantValueExtraPrice = json["variant_value_extra_price"];
    variantValueIsDefault = json["variant_value_is_default"];
    variantValueIsAvailable = json["variant_value_is_available"];
    variantValueImageUrl = json["variant_value_image_url"];
  }

  static List<CartItemVariant> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartItemVariant.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["variant_group_id"] = variantGroupId;
    _data["variant_group_name"] = variantGroupName;
    _data["variant_group_description"] = variantGroupDescription;
    _data["variant_group_is_required"] = variantGroupIsRequired;
    _data["variant_group_min_select"] = variantGroupMinSelect;
    _data["variant_group_max_select"] = variantGroupMaxSelect;
    _data["variant_value_id"] = variantValueId;
    _data["variant_value_name"] = variantValueName;
    _data["variant_value_description"] = variantValueDescription;
    _data["variant_value_extra_price"] = variantValueExtraPrice;
    _data["variant_value_is_default"] = variantValueIsDefault;
    _data["variant_value_is_available"] = variantValueIsAvailable;
    _data["variant_value_image_url"] = variantValueImageUrl;
    return _data;
  }
}

class CartItemOption {
  String? optionGroupId;
  String? optionGroupName;
  bool? optionGroupIsRequired;
  int? optionGroupMinSelect;
  int? optionGroupMaxSelect;
  String? optionValueId;
  String? optionValueName;
  int? optionValueExtraPrice;
  bool? optionValueIsDefault;

  CartItemOption({
    this.optionGroupId,
    this.optionGroupName,
    this.optionGroupIsRequired,
    this.optionGroupMinSelect,
    this.optionGroupMaxSelect,
    this.optionValueId,
    this.optionValueName,
    this.optionValueExtraPrice,
    this.optionValueIsDefault,
  });

  CartItemOption.fromJson(Map<String, dynamic> json) {
    optionGroupId = json["option_group_id"];
    optionGroupName = json["option_group_name"];
    optionGroupIsRequired = json["option_group_is_required"];
    optionGroupMinSelect = json["option_group_min_select"];
    optionGroupMaxSelect = json["option_group_max_select"];
    optionValueId = json["option_value_id"];
    optionValueName = json["option_value_name"];
    optionValueExtraPrice = json["option_value_extra_price"];
    optionValueIsDefault = json["option_value_is_default"];
  }

  static List<CartItemOption> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartItemOption.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["option_group_id"] = optionGroupId;
    _data["option_group_name"] = optionGroupName;
    _data["option_group_is_required"] = optionGroupIsRequired;
    _data["option_group_min_select"] = optionGroupMinSelect;
    _data["option_group_max_select"] = optionGroupMaxSelect;
    _data["option_value_id"] = optionValueId;
    _data["option_value_name"] = optionValueName;
    _data["option_value_extra_price"] = optionValueExtraPrice;
    _data["option_value_is_default"] = optionValueIsDefault;
    return _data;
  }
}
