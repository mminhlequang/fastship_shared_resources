import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:shared_resources/common_assets/common_assets.dart';

import '../../restaurants/restaurants.dart';
import '../menu.dart';

/// Enum for menu item sorting criteria
enum MenuItemSortBy {
  distance,
  rating,
  popular,
  orders,
  revenue,
  newest,
  featured,
}

class MenuItemInput {
  String? name;
  String? description;
  bool? isActive;
  double? price;

  Uint8List? imageFileBytes;
  String? imageFileName;

  String? imageUrl;
  int? sortOrder;
  String? categoryId;

  MenuItemInput({
    this.name,
    this.description,
    this.isActive,
    this.price,
    this.imageFileBytes,
    this.imageFileName,
    this.imageUrl,
    this.sortOrder,
    this.categoryId,
  });

  FormData toFormData() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (description != null) data['description'] = description;
    if (isActive != null) data['is_active'] = isActive;
    if (price != null) data['price'] = price;
    if (imageFileBytes != null && imageFileName != null) {
      data['image'] = MultipartFile.fromBytes(
        imageFileBytes!,
        filename: imageFileName!,
      );
    } else if (imageUrl != null) {
      data['image_url'] = imageUrl;
    }
    if (sortOrder != null) data['sort_order'] = sortOrder;
    if (categoryId != null) data['category_id'] = categoryId;
    return FormData.fromMap(data);
  }
}

class MenuItemResponse {
  String? id;
  String? name;
  String? description;
  bool? isActive;
  double? price;
  int? sortOrder;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? categoryId;

  List<MenuItemVariantResponse>? variants;
  List<MenuItemOptionResponse>? options;

  RestaurantResponse? restaurant;
  double? distance_km;

  CommonAssetResponse? image;

  String? get imageUrl => image?.fileCompressedUrl ?? image?.fileUrl;

  MenuItemResponse({
    this.id,
    this.name,
    this.description,
    this.isActive,
    this.price,
    this.sortOrder,
    this.variants,
    this.options,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.restaurant,
    this.distance_km,
    this.image,
  });

  factory MenuItemResponse.fromJson(Map<String, dynamic> json) {
    return MenuItemResponse(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isActive: json['is_active'],
      price: (json['price'] as num?)?.toDouble(),
      image:
          json['image'] != null
              ? CommonAssetResponse.fromJson(json['image'])
              : json['image_url'] != null
              ? CommonAssetResponse(id: "", fileUrl: json['image_url'])
              : null,

      sortOrder: json['sort_order'],
      variants:
          json['variants'] != null
              ? (json['variants'] as List)
                  .map((v) => MenuItemVariantResponse.fromJson(v))
                  .toList()
              : null,
      options:
          json['options'] != null
              ? (json['options'] as List)
                  .map((v) => MenuItemOptionResponse.fromJson(v))
                  .toList()
              : null,
      createdAt:
          json['created_at'] != null
              ? DateTime.parse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.parse(json['updated_at'])
              : null,
      categoryId: json['category_id'],
      restaurant:
          json['restaurant'] != null
              ? RestaurantResponse.fromJson(json['restaurant'])
              : null,
      distance_km: (json['distance_km'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['is_active'] = isActive;
    data['price'] = price;
    data['image'] = image?.toJson();
    data['sort_order'] = sortOrder;
    data['variants'] = variants?.map((v) => v.toJson()).toList();
    data['options'] = options?.map((o) => o.toJson()).toList();
    data['created_at'] = createdAt?.toIso8601String();
    data['updated_at'] = updatedAt?.toIso8601String();
    data['category_id'] = categoryId;
    data['restaurant'] = restaurant?.toJson();
    data['distance_km'] = distance_km;
    return data;
  }
}
