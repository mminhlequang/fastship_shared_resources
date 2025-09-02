import 'dart:typed_data';

import 'package:dio/dio.dart';

class PromoteBannerResponse {
  String? refType;
  String? refId;
  String? imageUrl;
  bool? isActive;
  String? countryCode;
  String? positionInapp;
  int? id;

  PromoteBannerResponse({
    this.refType,
    this.refId,
    this.imageUrl,
    this.isActive,
    this.countryCode,
    this.positionInapp,
    this.id,
  });

  PromoteBannerResponse.fromJson(Map<String, dynamic> json) {
    refType = json["ref_type"];
    refId = json["ref_id"];
    imageUrl = json["image_url"];
    isActive = json["is_active"];
    countryCode = json["country_code"];
    positionInapp = json["position_inapp"];
    id = json["id"];
  }

  static List<PromoteBannerResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(PromoteBannerResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ref_type"] = refType;
    _data["ref_id"] = refId;
    _data["image_url"] = imageUrl;
    _data["is_active"] = isActive;
    _data["country_code"] = countryCode;
    _data["position_inapp"] = positionInapp;
    _data["id"] = id;
    return _data;
  }
}

class PromoteBannerInput {
  String? refType;
  String? refId;
  String? imageName;
  Uint8List? imageFileBytes;
  bool? isActive;
  String? countryCode;
  String? positionInapp;

  PromoteBannerInput({
    this.refType,
    this.refId,
    this.imageName,
    this.imageFileBytes,
    this.isActive,
    this.countryCode,
    this.positionInapp,
  });

  FormData toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ref_type"] = refType;
    _data["ref_id"] = refId;
    _data["image"] = MultipartFile.fromBytes(
      imageFileBytes!,
      filename: imageName!,
    );
    _data["is_active"] = isActive;
    _data["country_code"] = countryCode;
    _data["position_inapp"] = positionInapp;
    return FormData.fromMap(_data);
  }
}
