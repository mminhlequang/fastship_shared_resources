class CouponResponse {
  String? id;
  String? code;
  String? name;
  String? description;
  String? type; // fixed, percent, free_shipping
  int? discountValue;
  int? maxDiscount;
  int? usageLimit;
  int? usageLimitPerUser;
  int? minOrderAmount;
  String? applicableOn; // order, menu_item, category, delivery_fee
  String? createdBy; // system, restaurant
  int? restaurantId;
  String? validFrom;
  String? validTo;
  bool? isActive;
  bool? isAutoApply;
  bool? isStackable;
  String? targetAudience;
  bool? firstTimeOnly;
  bool? birthdayOnly;
  bool? referralOnly;
  int? currentUsage;
  bool? isValid;
  String? createdAt;
  String? updatedAt;

  CouponResponse({
    this.id,
    this.code,
    this.name,
    this.description,
    this.type,
    this.discountValue,
    this.maxDiscount,
    this.usageLimit,
    this.usageLimitPerUser,
    this.minOrderAmount,
    this.applicableOn,
    this.createdBy,
    this.restaurantId,
    this.validFrom,
    this.validTo,
    this.isActive,
    this.isAutoApply,
    this.isStackable,
    this.targetAudience,
    this.firstTimeOnly,
    this.birthdayOnly,
    this.referralOnly,
    this.currentUsage,
    this.isValid,
    this.createdAt,
    this.updatedAt,
  });

  CouponResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    discountValue = json['discount_value'];
    maxDiscount = json['max_discount'];
    usageLimit = json['usage_limit'];
    usageLimitPerUser = json['usage_limit_per_user'];
    minOrderAmount = json['min_order_amount'];
    applicableOn = json['applicable_on'];
    createdBy = json['created_by'];
    restaurantId = json['restaurant_id'];
    validFrom = json['valid_from'];
    validTo = json['valid_to'];
    isActive = json['is_active'];
    isAutoApply = json['is_auto_apply'];
    isStackable = json['is_stackable'];
    targetAudience = json['target_audience'];
    firstTimeOnly = json['first_time_only'];
    birthdayOnly = json['birthday_only'];
    referralOnly = json['referral_only'];
    currentUsage = json['current_usage'];
    isValid = json['is_valid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  static List<CouponResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(CouponResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['description'] = description;
    data['type'] = type;
    data['discount_value'] = discountValue;
    data['max_discount'] = maxDiscount;
    data['usage_limit'] = usageLimit;
    data['usage_limit_per_user'] = usageLimitPerUser;
    data['min_order_amount'] = minOrderAmount;
    data['applicable_on'] = applicableOn;
    data['created_by'] = createdBy;
    data['restaurant_id'] = restaurantId;
    data['valid_from'] = validFrom;
    data['valid_to'] = validTo;
    data['is_active'] = isActive;
    data['is_auto_apply'] = isAutoApply;
    data['is_stackable'] = isStackable;
    data['target_audience'] = targetAudience;
    data['first_time_only'] = firstTimeOnly;
    data['birthday_only'] = birthdayOnly;
    data['referral_only'] = referralOnly;
    data['current_usage'] = currentUsage;
    data['is_valid'] = isValid;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  /// Human-readable discount text
  String get discountText {
    if (type == 'percent') {
      final maxText = maxDiscount != null ? ' (max ${maxDiscount})' : '';
      return '${discountValue}%$maxText';
    } else if (type == 'free_shipping') {
      return 'Free Shipping';
    } else {
      return '${discountValue ?? 0}';
    }
  }

  /// Check if coupon is currently valid based on dates
  bool get isCurrentlyValid {
    if (isValid == false) return false;
    if (isActive != true) return false;
    final now = DateTime.now().toUtc();
    if (validFrom != null) {
      final from = DateTime.tryParse(validFrom!);
      if (from != null && now.isBefore(from)) return false;
    }
    if (validTo != null) {
      final to = DateTime.tryParse(validTo!);
      if (to != null && now.isAfter(to)) return false;
    }
    return true;
  }
}

class CouponCreateInput {
  String? code;
  String? name;
  String? description;
  String? type;
  int? discountValue;
  int? maxDiscount;
  int? usageLimit;
  int? usageLimitPerUser;
  int? minOrderAmount;
  String? applicableOn;
  String? createdBy;
  int? restaurantId;
  String? validFrom;
  String? validTo;
  bool? isActive;
  bool? isAutoApply;
  bool? isStackable;
  String? targetAudience;
  bool? firstTimeOnly;
  bool? birthdayOnly;
  bool? referralOnly;
  List<String>? menuItemIds;
  List<String>? categoryIds;
  List<String>? zoneIds;

  CouponCreateInput({
    this.code,
    this.name,
    this.description,
    this.type,
    this.discountValue,
    this.maxDiscount,
    this.usageLimit,
    this.usageLimitPerUser,
    this.minOrderAmount,
    this.applicableOn,
    this.createdBy,
    this.restaurantId,
    this.validFrom,
    this.validTo,
    this.isActive,
    this.isAutoApply,
    this.isStackable,
    this.targetAudience,
    this.firstTimeOnly,
    this.birthdayOnly,
    this.referralOnly,
    this.menuItemIds,
    this.categoryIds,
    this.zoneIds,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['description'] = description;
    data['type'] = type;
    data['discount_value'] = discountValue;
    if (maxDiscount != null) data['max_discount'] = maxDiscount;
    if (usageLimit != null) data['usage_limit'] = usageLimit;
    if (usageLimitPerUser != null) data['usage_limit_per_user'] = usageLimitPerUser;
    if (minOrderAmount != null) data['min_order_amount'] = minOrderAmount;
    data['applicable_on'] = applicableOn;
    data['created_by'] = createdBy;
    if (restaurantId != null) data['restaurant_id'] = restaurantId;
    data['valid_from'] = validFrom;
    data['valid_to'] = validTo;
    data['is_active'] = isActive ?? true;
    data['is_auto_apply'] = isAutoApply ?? false;
    data['is_stackable'] = isStackable ?? false;
    if (targetAudience != null) data['target_audience'] = targetAudience;
    data['first_time_only'] = firstTimeOnly ?? false;
    data['birthday_only'] = birthdayOnly ?? false;
    data['referral_only'] = referralOnly ?? false;
    if (menuItemIds != null) data['menu_item_ids'] = menuItemIds;
    if (categoryIds != null) data['category_ids'] = categoryIds;
    if (zoneIds != null) data['zone_ids'] = zoneIds;
    return data;
  }
}

class CouponUpdateInput {
  String? code;
  String? name;
  String? description;
  String? type;
  int? discountValue;
  int? maxDiscount;
  int? usageLimit;
  int? usageLimitPerUser;
  int? minOrderAmount;
  String? applicableOn;
  String? validFrom;
  String? validTo;
  bool? isActive;
  bool? isAutoApply;
  bool? isStackable;
  String? targetAudience;
  bool? firstTimeOnly;
  bool? birthdayOnly;
  bool? referralOnly;
  List<String>? menuItemIds;
  List<String>? categoryIds;
  List<String>? zoneIds;

  CouponUpdateInput({
    this.code,
    this.name,
    this.description,
    this.type,
    this.discountValue,
    this.maxDiscount,
    this.usageLimit,
    this.usageLimitPerUser,
    this.minOrderAmount,
    this.applicableOn,
    this.validFrom,
    this.validTo,
    this.isActive,
    this.isAutoApply,
    this.isStackable,
    this.targetAudience,
    this.firstTimeOnly,
    this.birthdayOnly,
    this.referralOnly,
    this.menuItemIds,
    this.categoryIds,
    this.zoneIds,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (code != null) data['code'] = code;
    if (name != null) data['name'] = name;
    if (description != null) data['description'] = description;
    if (type != null) data['type'] = type;
    if (discountValue != null) data['discount_value'] = discountValue;
    if (maxDiscount != null) data['max_discount'] = maxDiscount;
    if (usageLimit != null) data['usage_limit'] = usageLimit;
    if (usageLimitPerUser != null) data['usage_limit_per_user'] = usageLimitPerUser;
    if (minOrderAmount != null) data['min_order_amount'] = minOrderAmount;
    if (applicableOn != null) data['applicable_on'] = applicableOn;
    if (validFrom != null) data['valid_from'] = validFrom;
    if (validTo != null) data['valid_to'] = validTo;
    if (isActive != null) data['is_active'] = isActive;
    if (isAutoApply != null) data['is_auto_apply'] = isAutoApply;
    if (isStackable != null) data['is_stackable'] = isStackable;
    if (targetAudience != null) data['target_audience'] = targetAudience;
    if (firstTimeOnly != null) data['first_time_only'] = firstTimeOnly;
    if (birthdayOnly != null) data['birthday_only'] = birthdayOnly;
    if (referralOnly != null) data['referral_only'] = referralOnly;
    if (menuItemIds != null) data['menu_item_ids'] = menuItemIds;
    if (categoryIds != null) data['category_ids'] = categoryIds;
    if (zoneIds != null) data['zone_ids'] = zoneIds;
    return data;
  }
}

class CouponValidationRequest {
  String? code;
  String? userId;
  int? orderAmount;
  int? restaurantId;
  List<String>? menuItemIds;
  String? deliveryZone;

  CouponValidationRequest({
    this.code,
    this.userId,
    this.orderAmount,
    this.restaurantId,
    this.menuItemIds,
    this.deliveryZone,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['user_id'] = userId;
    data['order_amount'] = orderAmount;
    if (restaurantId != null) data['restaurant_id'] = restaurantId;
    if (menuItemIds != null) data['menu_item_ids'] = menuItemIds;
    if (deliveryZone != null) data['delivery_zone'] = deliveryZone;
    return data;
  }
}

class CouponValidationResponse {
  bool? isValid;
  CouponResponse? coupon;
  int? discountAmount;
  String? errorMessage;

  CouponValidationResponse({
    this.isValid,
    this.coupon,
    this.discountAmount,
    this.errorMessage,
  });

  CouponValidationResponse.fromJson(Map<String, dynamic> json) {
    isValid = json['is_valid'];
    coupon = json['coupon'] != null
        ? CouponResponse.fromJson(json['coupon'])
        : null;
    discountAmount = json['discount_amount'];
    errorMessage = json['error_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_valid'] = isValid;
    data['coupon'] = coupon?.toJson();
    data['discount_amount'] = discountAmount;
    data['error_message'] = errorMessage;
    return data;
  }
}

class CouponUsageStats {
  int? totalUsage;
  int? uniqueUsers;
  int? totalDiscount;
  int? averageDiscount;

  CouponUsageStats({
    this.totalUsage,
    this.uniqueUsers,
    this.totalDiscount,
    this.averageDiscount,
  });

  CouponUsageStats.fromJson(Map<String, dynamic> json) {
    totalUsage = json['total_usage'];
    uniqueUsers = json['unique_users'];
    totalDiscount = json['total_discount'];
    averageDiscount = json['average_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_usage'] = totalUsage;
    data['unique_users'] = uniqueUsers;
    data['total_discount'] = totalDiscount;
    data['average_discount'] = averageDiscount;
    return data;
  }
}
