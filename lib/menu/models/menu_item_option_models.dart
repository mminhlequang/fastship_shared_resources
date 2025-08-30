/// Model input cho MenuItemOption (dùng cho create/update)
class MenuItemOptionInput {
  String? id; // id của option (dùng cho update)
  String? optionId; // option_id (có thể dùng cho update hoặc mapping)
  String? name;
  bool? isRequired;
  int? minSelect;
  int? maxSelect;
  int? sortOrder;
  String? menuItemId; // menu_item_id (liên kết với món ăn)

  MenuItemOptionInput({
    this.id,
    this.optionId,
    this.name,
    this.isRequired,
    this.minSelect,
    this.maxSelect,
    this.sortOrder,
    this.menuItemId,
  });

  /// Tạo object từ JSON
  factory MenuItemOptionInput.fromJson(Map<String, dynamic> json) {
    return MenuItemOptionInput(
      id: json['id'],
      optionId: json['option_id'],
      name: json['name'],
      isRequired: json['is_required'],
      minSelect: json['min_select'],
      maxSelect: json['max_select'],
      sortOrder: json['sort_order'],
      menuItemId: json['menu_item_id'],
    );
  }

  /// Chuyển object sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) data['id'] = id;
    if (optionId != null) data['option_id'] = optionId;
    if (name != null) data['name'] = name;
    if (isRequired != null) data['is_required'] = isRequired;
    if (minSelect != null) data['min_select'] = minSelect;
    if (maxSelect != null) data['max_select'] = maxSelect;
    if (sortOrder != null) data['sort_order'] = sortOrder;
    if (menuItemId != null) data['menu_item_id'] = menuItemId;
    return data;
  }
}

/// Model phản hồi cho MenuItemOption, cập nhật theo JSON thực tế từ API
class MenuItemOptionResponse {
  String? id;
  String? name;
  bool? isRequired;
  int? minSelect;
  int? maxSelect;
  int? sortOrder;
  String? menuItemId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<MenuItemOptionValueResponse>? optionValues;

  MenuItemOptionResponse({
    this.id,
    this.name,
    this.isRequired,
    this.minSelect,
    this.maxSelect,
    this.sortOrder,
    this.menuItemId,
    this.createdAt,
    this.updatedAt,
    this.optionValues,
  });

  /// Tạo object từ JSON thực tế
  factory MenuItemOptionResponse.fromJson(Map<String, dynamic> json) {
    return MenuItemOptionResponse(
      id: json['id'],
      name: json['name'],
      isRequired: json['is_required'],
      minSelect: json['min_select'],
      maxSelect: json['max_select'],
      sortOrder: json['sort_order'],
      menuItemId: json['menu_item_id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      optionValues: json['option_values'] != null
          ? List<MenuItemOptionValueResponse>.from(
              (json['option_values'] as List)
                  .map((v) => MenuItemOptionValueResponse.fromJson(v)),
            )
          : [],
    );
  }

  /// Chuyển object sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['is_required'] = isRequired;
    data['min_select'] = minSelect;
    data['max_select'] = maxSelect;
    data['sort_order'] = sortOrder;
    data['menu_item_id'] = menuItemId;
    data['created_at'] = createdAt?.toIso8601String();
    data['updated_at'] = updatedAt?.toIso8601String();
    data['option_values'] = optionValues?.map((v) => v.toJson()).toList();
    return data;
  }
} 

/// Model dùng để tạo hoặc cập nhật giá trị option của menu item (MenuItemOptionValue)
class MenuItemOptionValueInput {
  String? id;
  String? valueId;
  String? name;
  double? extraPrice;
  bool? isDefault;
  int? sortOrder;
  String? optionId;

  MenuItemOptionValueInput({
    this.id,
    this.valueId,
    this.name,
    this.extraPrice,
    this.isDefault,
    this.sortOrder,
    this.optionId,
  });

  /// Tạo object từ JSON thực tế
  factory MenuItemOptionValueInput.fromJson(Map<String, dynamic> json) {
    return MenuItemOptionValueInput(
      id: json['id'],
      valueId: json['value_id'],
      name: json['name'],
      extraPrice: (json['extra_price'] as num?)?.toDouble(),
      isDefault: json['is_default'],
      sortOrder: json['sort_order'],
      optionId: json['option_id'],
    );
  }

  /// Chuyển object sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) data['id'] = id;
    if (valueId != null) data['value_id'] = valueId;
    if (name != null) data['name'] = name;
    if (extraPrice != null) data['extra_price'] = extraPrice;
    if (isDefault != null) data['is_default'] = isDefault;
    if (sortOrder != null) data['sort_order'] = sortOrder;
    if (optionId != null) data['option_id'] = optionId;
    return data;
  }
}

/// Model phản hồi cho giá trị option của menu item (MenuItemOptionValue)
class MenuItemOptionValueResponse {
  String? id;
  String? name;
  double? extraPrice;
  bool? isDefault;
  int? sortOrder;
  String? optionId;
  DateTime? createdAt;
  DateTime? updatedAt;

  MenuItemOptionValueResponse({
    this.id,
    this.name,
    this.extraPrice,
    this.isDefault,
    this.sortOrder,
    this.optionId,
    this.createdAt,
    this.updatedAt,
  });

  /// Tạo object từ JSON thực tế
  factory MenuItemOptionValueResponse.fromJson(Map<String, dynamic> json) {
    return MenuItemOptionValueResponse(
      id: json['id'],
      name: json['name'],
      extraPrice: (json['extra_price'] as num?)?.toDouble(),
      isDefault: json['is_default'],
      sortOrder: json['sort_order'],
      optionId: json['option_id'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  /// Chuyển object sang JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['extra_price'] = extraPrice;
    data['is_default'] = isDefault;
    data['sort_order'] = sortOrder;
    data['option_id'] = optionId;
    data['created_at'] = createdAt?.toIso8601String();
    data['updated_at'] = updatedAt?.toIso8601String();
    return data;
  }
}
