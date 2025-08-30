class MenuInput {
  String? name;
  String? description;
  bool? isActive;

  MenuInput({this.name, this.description, this.isActive});

  factory MenuInput.fromJson(Map<String, dynamic> json) {
    return MenuInput(
      name: json['name'],
      description: json['description'],
      isActive: json['is_active'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (description != null) data['description'] = description;
    if (isActive != null) data['is_active'] = isActive;
    return data;
  }
}

class MenuResponse {
  String? id;
  String? name;
  String? description;
  bool? isActive;
  String? imageUrl;

  DateTime? createdAt;
  DateTime? updatedAt;
  int? restaurantId;

  MenuResponse({
    this.id,
    this.name,
    this.description,
    this.isActive,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.restaurantId,
  });

  factory MenuResponse.fromJson(Map<String, dynamic> json) {
    return MenuResponse(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isActive: json['is_active'],
      imageUrl: json['image_url'],
      createdAt:
          json['created_at'] != null
              ? DateTime.parse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.parse(json['updated_at'])
              : null,
      restaurantId: json['restaurant_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['is_active'] = isActive;
    data['image_url'] = imageUrl;
    data['created_at'] = createdAt?.toIso8601String();
    data['updated_at'] = updatedAt?.toIso8601String();
    data['restaurant_id'] = restaurantId;
    return data;
  }
}
