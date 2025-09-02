import '../../addresses/models/models.dart';
import '../../availability_rules/models/models.dart';
import '../../common_assets/models/models.dart';

/// Enum for restaurant sorting criteria
enum RestaurantSortBy { distance, rating, popular, orders, revenue, newest, featured }
 

/// Model class for restaurant input, used for creating or updating a restaurant.
/// Các trường được map theo JSON yêu cầu.
class RestaurantInput {
  String? name;
  int? restaurantOrgId;
  String? onboardingStatus;
  String? contactEmail;
  String? contactPhone;
  String? websiteUrl;
  String? taxCode;
  String? businessLicense;
  String? addressId;
  int? minOrderAmount;
  int? maxOrderAmount;
  int? preparationTime;
  int? maxPreparationTime;
  int? totalOrders;
  int? completedOrders;
  int? cancelledOrders;
  int? totalRevenue;
  double? averageOrderValue;
  double? ratingAverage;
  int? ratingCount;
  double? onTimeDeliveryRate;
  bool? isActive;
  bool? isOpen;
  bool? isFeatured;
  bool? isVerified;
  bool? isChain;
  bool? isHalal;
  bool? isVegetarianFriendly;
  String? description;
  List<String>? cuisineType;
  List<String>? highlights;
  List<String>? amenities;
  int? minimumAge;

  RestaurantInput({
    this.name,
    this.restaurantOrgId,
    this.onboardingStatus,
    this.contactEmail,
    this.contactPhone,
    this.websiteUrl,
    this.taxCode,
    this.businessLicense,
    this.addressId,
    this.minOrderAmount,
    this.maxOrderAmount,
    this.preparationTime,
    this.maxPreparationTime,
    this.totalOrders,
    this.completedOrders,
    this.cancelledOrders,
    this.totalRevenue,
    this.averageOrderValue,
    this.ratingAverage,
    this.ratingCount,
    this.onTimeDeliveryRate,
    this.isActive,
    this.isOpen,
    this.isFeatured,
    this.isVerified,
    this.isChain,
    this.isHalal,
    this.isVegetarianFriendly,
    this.description,
    this.highlights,
    this.amenities,
    this.cuisineType,
    this.minimumAge,
  });

  /// Parse from JSON
  factory RestaurantInput.fromJson(Map<String, dynamic> json) {
    return RestaurantInput(
      name: json['name'] as String?,
      restaurantOrgId: json['restaurant_org_id'] as int?,
      onboardingStatus: json['onboarding_status'] as String?,
      contactEmail: json['contact_email'] as String?,
      contactPhone: json['contact_phone'] as String?,
      websiteUrl: json['website_url'] as String?,
      taxCode: json['tax_code'] as String?,
      businessLicense: json['business_license'] as String?,
      addressId: json['address_id'] as String?,
      minOrderAmount: json['min_order_amount'] as int?,
      maxOrderAmount: json['max_order_amount'] as int?,
      preparationTime: json['preparation_time'] as int?,
      maxPreparationTime: json['max_preparation_time'] as int?,
      totalOrders: json['total_orders'] as int?,
      completedOrders: json['completed_orders'] as int?,
      cancelledOrders: json['cancelled_orders'] as int?,
      totalRevenue: json['total_revenue'] as int?,
      averageOrderValue: (json['average_order_value'] as num?)?.toDouble(),
      ratingAverage: (json['rating_average'] as num?)?.toDouble(),
      ratingCount: json['rating_count'] as int?,
      onTimeDeliveryRate: (json['on_time_delivery_rate'] as num?)?.toDouble(),
      isActive: json['is_active'] as bool?,
      isOpen: json['is_open'] as bool?,
      isFeatured: json['is_featured'] as bool?,
      isVerified: json['is_verified'] as bool?,
      isChain: json['is_chain'] as bool?,
      isHalal: json['is_halal'] as bool?,
      isVegetarianFriendly: json['is_vegetarian_friendly'] as bool?,
      description: json['description'] as String?,
      highlights:
          (json['highlights'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      amenities:
          (json['amenities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      cuisineType:
          (json['cuisine_type'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      minimumAge: json['minimum_age'] as int?,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'restaurant_org_id': restaurantOrgId,
      'onboarding_status': onboardingStatus,
      'contact_email': contactEmail,
      'contact_phone': contactPhone,
      'website_url': websiteUrl,
      'tax_code': taxCode,
      'business_license': businessLicense,
      'address_id': addressId,
      'min_order_amount': minOrderAmount,
      'max_order_amount': maxOrderAmount,
      'preparation_time': preparationTime,
      'max_preparation_time': maxPreparationTime,
      'total_orders': totalOrders,
      'completed_orders': completedOrders,
      'cancelled_orders': cancelledOrders,
      'total_revenue': totalRevenue,
      'average_order_value': averageOrderValue,
      'rating_average': ratingAverage,
      'rating_count': ratingCount,
      'on_time_delivery_rate': onTimeDeliveryRate,
      'is_active': isActive,
      'is_open': isOpen,
      'is_featured': isFeatured,
      'is_verified': isVerified,
      'is_chain': isChain,
      'is_halal': isHalal,
      'is_vegetarian_friendly': isVegetarianFriendly,
      'description': description,
      'highlights': highlights,
      'amenities': amenities,
      'cuisine_type': cuisineType,
      'minimum_age': minimumAge,
    };
  }
}

class RestaurantResponse {
  int? id;
  String? name;
  int? restaurantOrgId;
  String? onboardingStatus;
  String? contactEmail;
  String? contactPhone;
  String? websiteUrl;
  String? taxCode;
  String? businessLicense;
  String? addressId;
  double? minOrderAmount;
  double? maxOrderAmount;
  int? preparationTime;
  int? maxPreparationTime;
  int? totalOrders;
  int? completedOrders;
  int? cancelledOrders;
  double? totalRevenue;
  double? averageOrderValue;
  double? ratingAverage;
  int? ratingCount;
  double? onTimeDeliveryRate;
  bool? isActive;
  bool? isOpen;
  bool? isFeatured;
  bool? isVerified;
  bool? isChain;
  bool? isHalal;
  bool? isVegetarianFriendly;
  String? description;
  List<String>? highlights;
  List<String>? amenities;
  List<String>? cuisineType;
  int? minimumAge;
  String? availabilityRuleId;

  AddressResponse? addressDetails;
  List<AvailabilityRuleResponse>? availabilityRules;

  CommonAssetResponse? restaurantLogo;
  List<CommonAssetResponse>? restaurantBanners;

  DateTime? createdAt;
  DateTime? updatedAt;

  RestaurantResponse({
    this.id,
    this.name,
    this.onboardingStatus,
    this.contactEmail,
    this.contactPhone,
    this.websiteUrl,
    this.taxCode,
    this.businessLicense,
    this.addressId,
    this.minOrderAmount,
    this.restaurantOrgId,
    this.preparationTime,
    this.maxPreparationTime,
    this.totalOrders,
    this.completedOrders,
    this.cancelledOrders,
    this.totalRevenue,
    this.isActive,
    this.isOpen,
    this.isFeatured,
    this.isVerified,
    this.isChain,
    this.isHalal,
    this.isVegetarianFriendly,
    this.description,
    this.highlights,
    this.amenities,
    this.cuisineType,
    this.minimumAge,
    this.ratingAverage,
    this.ratingCount,
    this.addressDetails,
    this.availabilityRules,
    this.restaurantLogo,
    this.restaurantBanners,
    this.createdAt,
    this.updatedAt,
  });

  RestaurantResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    onboardingStatus = json['onboarding_status'];
    contactEmail = json['contact_email'];
    contactPhone = json['contact_phone'];
    websiteUrl = json['website_url'];
    taxCode = json['tax_code'];
    businessLicense = json['business_license'];
    addressId = json['address_id'];
    minOrderAmount = json['min_order_amount'];
    maxOrderAmount = json['max_order_amount'];
    preparationTime = json['preparation_time'];
    maxPreparationTime = json['max_preparation_time'];
    totalOrders = json['total_orders'];
    completedOrders = json['completed_orders'];
    cancelledOrders = json['cancelled_orders'];
    totalRevenue = json['total_revenue'];
    averageOrderValue = (json['average_order_value'] as num?)?.toDouble();
    ratingAverage = (json['rating_average'] as num?)?.toDouble();
    ratingCount = json['rating_count'];
    onTimeDeliveryRate = (json['on_time_delivery_rate'] as num?)?.toDouble();
    restaurantOrgId = json['restaurant_org_id'];
    description = json['description'];
    highlights =
        json['highlights'] != null
            ? (json['highlights'] as List).map((e) => e as String).toList()
            : null;
    amenities =
        json['amenities'] != null
            ? (json['amenities'] as List).map((e) => e as String).toList()
            : null;
    cuisineType =
        json['cuisine_type'] != null
            ? (json['cuisine_type'] as List).map((e) => e as String).toList()
            : null;
    minimumAge = json['minimum_age'];
    availabilityRuleId = json['availability_rule_id'];
    isActive = json['is_active'];
    isOpen = json['is_open'];
    isFeatured = json['is_featured'];
    isVerified = json['is_verified'];
    isChain = json['is_chain'];
    isHalal = json['is_halal'];
    isVegetarianFriendly = json['is_vegetarian_friendly'];
    ratingAverage = (json['rating_average'] as num?)?.toDouble();
    ratingCount = json['rating_count'];
    addressDetails =
        json['address_details'] != null
            ? AddressResponse.fromJson(json['address_details'])
            : null;
    availabilityRules =
        json['availability_rules'] != null
            ? (json['availability_rules'] as List)
                .map((e) => AvailabilityRuleResponse.fromJson(e))
                .toList()
            : null;
    restaurantLogo =
        json['restaurant_logo'] != null
            ? CommonAssetResponse.fromJson(json['restaurant_logo'])
            : null;
    restaurantBanners =
        json['restaurant_banners'] != null
            ? (json['restaurant_banners'] as List)
                .map((e) => CommonAssetResponse.fromJson(e))
                .toList()
            : null;
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    updatedAt =
        json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['restaurant_org_id'] = restaurantOrgId;
    data['onboarding_status'] = onboardingStatus;
    data['contact_email'] = contactEmail;
    data['contact_phone'] = contactPhone;
    data['website_url'] = websiteUrl;
    data['tax_code'] = taxCode;
    data['business_license'] = businessLicense;
    data['address_id'] = addressId;
    data['min_order_amount'] = minOrderAmount;
    data['restaurant_org_id'] = restaurantOrgId;
    data['preparation_time'] = preparationTime;
    data['max_preparation_time'] = maxPreparationTime;
    data['total_orders'] = totalOrders;
    data['completed_orders'] = completedOrders;
    data['cancelled_orders'] = cancelledOrders;
    data['total_revenue'] = totalRevenue;
    data['restaurant_logo'] = restaurantLogo?.toJson();
    data['restaurant_banners'] =
        restaurantBanners?.map((e) => e.toJson()).toList();
    data['is_active'] = isActive;
    data['is_open'] = isOpen;
    data['is_featured'] = isFeatured;
    data['is_verified'] = isVerified;
    data['is_chain'] = isChain;
    data['is_halal'] = isHalal;
    data['is_vegetarian_friendly'] = isVegetarianFriendly;
    data['description'] = description;
    data['highlights'] = highlights;
    data['amenities'] = amenities;
    data['minimum_age'] = minimumAge;
    data['availability_rule_id'] = availabilityRuleId;
    data['rating_average'] = ratingAverage;
    data['rating_count'] = ratingCount;
    data['address_details'] = addressDetails?.toJson();
    data['availability_rules'] =
        availabilityRules?.map((e) => e.toJson()).toList();
    data['restaurant_logo'] = restaurantLogo?.toJson();
    data['restaurant_banners'] =
        restaurantBanners?.map((e) => e.toJson()).toList();
    data['created_at'] = createdAt?.toIso8601String();
    data['updated_at'] = updatedAt?.toIso8601String();
    return data;
  }
}
