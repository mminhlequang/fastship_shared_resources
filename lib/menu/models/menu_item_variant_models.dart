/// Model input cho MenuItemVariant (dùng cho create/update)
class MenuItemVariantInput {
  String? id;
  String? name;
  String? description;
  bool? isRequired;
  int? minSelect;
  int? maxSelect;
  int? sortOrder;
  bool? isActive;
  String? menuItemId;

  MenuItemVariantInput({
    this.id,
    this.name,
    this.description,
    this.isRequired,
    this.minSelect,
    this.maxSelect,
    this.sortOrder,
    this.isActive,
    this.menuItemId,
  });

  /// Tạo object từ JSON
  factory MenuItemVariantInput.fromJson(Map<String, dynamic> json) {
    return MenuItemVariantInput(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isRequired: json['is_required'],
      minSelect: json['min_select'],
      maxSelect: json['max_select'],
      sortOrder: json['sort_order'],
      isActive: json['is_active'],
      menuItemId: json['menu_item_id'],
    );
  }

  /// Chuyển object sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;
    if (description != null) data['description'] = description;
    if (isRequired != null) data['is_required'] = isRequired;
    if (minSelect != null) data['min_select'] = minSelect;
    if (maxSelect != null) data['max_select'] = maxSelect;
    if (sortOrder != null) data['sort_order'] = sortOrder;
    if (isActive != null) data['is_active'] = isActive;
    if (menuItemId != null) data['menu_item_id'] = menuItemId;
    return data;
  }
}

/// Model phản hồi cho MenuItemVariant, cập nhật theo JSON thực tế từ API
class MenuItemVariantResponse {
  String? id;
  String? name;
  String? description;
  bool? isRequired;
  int? minSelect;
  int? maxSelect;
  int? sortOrder;
  bool? isActive;
  String? menuItemId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<MenuItemVariantValueResponse>?
  variantValues; // Có thể thay dynamic bằng model cụ thể nếu có

  MenuItemVariantResponse({
    this.id,
    this.name,
    this.description,
    this.isRequired,
    this.minSelect,
    this.maxSelect,
    this.sortOrder,
    this.isActive,
    this.menuItemId,
    this.createdAt,
    this.updatedAt,
    this.variantValues,
  });

  /// Tạo object từ JSON thực tế
  factory MenuItemVariantResponse.fromJson(Map<String, dynamic> json) {
    return MenuItemVariantResponse(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isRequired: json['is_required'],
      minSelect: json['min_select'],
      maxSelect: json['max_select'],
      sortOrder: json['sort_order'],
      isActive: json['is_active'],
      menuItemId: json['menu_item_id'],
      createdAt:
          json['created_at'] != null
              ? DateTime.parse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.parse(json['updated_at'])
              : null,
      variantValues:
          json['variant_values'] != null
              ? List<MenuItemVariantValueResponse>.from(
                json['variant_values'].map(
                  (x) => MenuItemVariantValueResponse.fromJson(x),
                ),
              )
              : [],
    );
  }

  /// Chuyển object sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['is_required'] = isRequired;
    data['min_select'] = minSelect;
    data['max_select'] = maxSelect;
    data['sort_order'] = sortOrder;
    data['is_active'] = isActive;
    data['menu_item_id'] = menuItemId;
    data['created_at'] = createdAt?.toIso8601String();
    data['updated_at'] = updatedAt?.toIso8601String();
    data['variant_values'] = variantValues?.map((x) => x.toJson()).toList();
    return data;
  }
}

/// Model dùng để tạo hoặc cập nhật giá trị biến thể của menu item (MenuItemVariantValue)
class MenuItemVariantValueInput {
  String? id;
  String? valueId;
  String? name;
  String? description;
  double? extraPrice;
  bool? isDefault;
  bool? isAvailable;
  int? sortOrder;
  String? imageUrl;
  String? variantId;
  DateTime? createdAt;
  DateTime? updatedAt;

  MenuItemVariantValueInput({
    this.id,
    this.valueId,
    this.name,
    this.description,
    this.extraPrice,
    this.isDefault,
    this.isAvailable,
    this.sortOrder,
    this.imageUrl,
    this.variantId,
    this.createdAt,
    this.updatedAt,
  });

  /// Tạo object từ JSON thực tế
  factory MenuItemVariantValueInput.fromJson(Map<String, dynamic> json) {
    return MenuItemVariantValueInput(
      id: json['id'],
      valueId: json['value_id'],
      name: json['name'],
      description: json['description'],
      extraPrice: (json['extra_price'] as num?)?.toDouble(),
      isDefault: json['is_default'],
      isAvailable: json['is_available'],
      sortOrder: json['sort_order'],
      imageUrl: json['image_url'],
      variantId: json['variant_id'],
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.tryParse(json['updated_at'])
              : null,
    );
  }

  /// Chuyển object sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) data['id'] = id;
    if (valueId != null) data['value_id'] = valueId;
    if (name != null) data['name'] = name;
    if (description != null) data['description'] = description;
    if (extraPrice != null) data['extra_price'] = extraPrice;
    if (isDefault != null) data['is_default'] = isDefault;
    if (isAvailable != null) data['is_available'] = isAvailable;
    if (sortOrder != null) data['sort_order'] = sortOrder;
    if (imageUrl != null) data['image_url'] = imageUrl;
    if (variantId != null) data['variant_id'] = variantId;
    if (createdAt != null) data['created_at'] = createdAt!.toIso8601String();
    if (updatedAt != null) data['updated_at'] = updatedAt!.toIso8601String();
    return data;
  }
}

/// Model phản hồi cho giá trị biến thể của món ăn (MenuItemVariantValue)
class MenuItemVariantValueResponse {
  String? id;
  String? name;
  String? description;
  double? extraPrice;
  bool? isDefault;
  bool? isAvailable;
  int? sortOrder;
  String? imageUrl;
  String? variantId;
  DateTime? createdAt;
  DateTime? updatedAt;

  MenuItemVariantValueResponse({
    this.id,
    this.name,
    this.description,
    this.extraPrice,
    this.isDefault,
    this.isAvailable,
    this.sortOrder,
    this.imageUrl,
    this.variantId,
    this.createdAt,
    this.updatedAt,
  });

  /// Tạo object từ JSON thực tế
  factory MenuItemVariantValueResponse.fromJson(Map<String, dynamic> json) {
    return MenuItemVariantValueResponse(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      extraPrice: (json['extra_price'] as num?)?.toDouble(),
      isDefault: json['is_default'],
      isAvailable: json['is_available'],
      sortOrder: json['sort_order'],
      imageUrl: json['image_url'],
      variantId: json['variant_id'],
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.tryParse(json['updated_at'])
              : null,
    );
  }

  /// Chuyển object sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;
    if (description != null) data['description'] = description;
    if (extraPrice != null) data['extra_price'] = extraPrice;
    if (isDefault != null) data['is_default'] = isDefault;
    if (isAvailable != null) data['is_available'] = isAvailable;
    if (sortOrder != null) data['sort_order'] = sortOrder;
    if (imageUrl != null) data['image_url'] = imageUrl;
    if (variantId != null) data['variant_id'] = variantId;
    if (createdAt != null) data['created_at'] = createdAt!.toIso8601String();
    if (updatedAt != null) data['updated_at'] = updatedAt!.toIso8601String();
    return data;
  }
}
