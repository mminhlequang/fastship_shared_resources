class MenuItemTranslationCreate {
  String? languageCode;
  String? name;
  String? description;
  Map<String, dynamic>? metadata;

  MenuItemTranslationCreate({
    this.languageCode,
    this.name,
    this.description,
    this.metadata,
  });

  factory MenuItemTranslationCreate.fromJson(Map<String, dynamic> json) {
    return MenuItemTranslationCreate(
      languageCode: json['language_code'],
      name: json['name'],
      description: json['description'],
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (languageCode != null) data['language_code'] = languageCode;
    if (name != null) data['name'] = name;
    if (description != null) data['description'] = description;
    if (metadata != null) data['metadata'] = metadata;
    return data;
  }
}

class MenuItemTranslationUpdate {
  String? name;
  String? description;
  Map<String, dynamic>? metadata;

  MenuItemTranslationUpdate({
    this.name,
    this.description,
    this.metadata,
  });

  factory MenuItemTranslationUpdate.fromJson(Map<String, dynamic> json) {
    return MenuItemTranslationUpdate(
      name: json['name'],
      description: json['description'],
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (description != null) data['description'] = description;
    if (metadata != null) data['metadata'] = metadata;
    return data;
  }
}

class MenuItemTranslationResponse {
  String? id;
  String? languageCode;
  String? name;
  String? description;
  Map<String, dynamic>? metadata;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? itemId;

  MenuItemTranslationResponse({
    this.id,
    this.languageCode,
    this.name,
    this.description,
    this.metadata,
    this.createdAt,
    this.updatedAt,
    this.itemId,
  });

  factory MenuItemTranslationResponse.fromJson(Map<String, dynamic> json) {
    return MenuItemTranslationResponse(
      id: json['id'],
      languageCode: json['language_code'],
      name: json['name'],
      description: json['description'],
      metadata: json['metadata'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      itemId: json['item_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['language_code'] = languageCode;
    data['name'] = name;
    data['description'] = description;
    data['metadata'] = metadata;
    data['created_at'] = createdAt?.toIso8601String();
    data['updated_at'] = updatedAt?.toIso8601String();
    data['item_id'] = itemId;
    return data;
  }
}
