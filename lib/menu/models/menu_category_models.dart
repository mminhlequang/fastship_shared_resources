import '../menu.dart';

class MenuCategoryInput {
  String? name;
  String? description;
  bool? isActive;
  int? sortOrder;
  String? menuId;

  MenuCategoryInput({
    this.name,
    this.description,
    this.isActive,
    this.sortOrder,
    this.menuId,
  });

  factory MenuCategoryInput.fromJson(Map<String, dynamic> json) {
    return MenuCategoryInput(
      name: json['name'],
      description: json['description'],
      isActive: json['is_active'],
      sortOrder: json['sort_order'],
      menuId: json['menu_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (description != null) data['description'] = description;
    if (isActive != null) data['is_active'] = isActive;
    if (sortOrder != null) data['sort_order'] = sortOrder;
    if (menuId != null) data['menu_id'] = menuId;
    return data;
  }
}

class MenuCategoryResponse {
  String? id;
  String? name;
  String? description;
  bool? isActive;
  int? sortOrder;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? menuId;
  List<MenuItemResponse>? items;

  MenuCategoryResponse({
    this.id,
    this.name,
    this.description,
    this.isActive,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
    this.menuId,
    this.items,
  });

  factory MenuCategoryResponse.fromJson(Map<String, dynamic> json) {
    return MenuCategoryResponse(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isActive: json['is_active'],
      sortOrder: json['sort_order'],
      createdAt:
          json['created_at'] != null
              ? DateTime.parse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.parse(json['updated_at'])
              : null,
      menuId: json['menu_id'],
      items:
          json['items'] != null
              ? (json['items'] as List)
                  .map((item) => MenuItemResponse.fromJson(item))
                  .toList()
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['is_active'] = isActive;
    data['sort_order'] = sortOrder;
    data['created_at'] = createdAt?.toIso8601String();
    data['updated_at'] = updatedAt?.toIso8601String();
    data['menu_id'] = menuId;
    data['items'] = items?.map((item) => item.toJson()).toList();
    return data;
  }
}
