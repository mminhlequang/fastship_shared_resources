import 'dart:typed_data';

import 'package:dio/dio.dart';

class CuisineTypeResponse {
  String? slugCode;
  String? iconUrl;
  bool? isActive;
  int? id;
  List<CuisineTypeResponseTranslation>? translations;

  String getName(String languageCode) {
    return translations
            ?.firstWhere(
              (e) => e.languageCode == languageCode,
              orElse:
                  () => translations?.first ?? CuisineTypeResponseTranslation(),
            )
            .name ??
        '';
  }

  String getDescription(String languageCode) {
    return translations
            ?.firstWhere(
              (e) => e.languageCode == languageCode,
              orElse:
                  () => translations?.first ?? CuisineTypeResponseTranslation(),
            )
            .description ??
        '';
  }

  CuisineTypeResponse({
    this.slugCode,
    this.iconUrl,
    this.isActive,
    this.id,
    this.translations,
  });

  CuisineTypeResponse.fromJson(Map<String, dynamic> json) {
    slugCode = json["slug_code"];
    iconUrl = json["icon_url"];
    isActive = json["is_active"];
    id = json["id"];
    translations =
        json["translations"] == null
            ? null
            : (json["translations"] as List)
                .map((e) => CuisineTypeResponseTranslation.fromJson(e))
                .toList();
  }

  static List<CuisineTypeResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(CuisineTypeResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["slug_code"] = slugCode;
    _data["icon_url"] = iconUrl;
    _data["is_active"] = isActive;
    _data["id"] = id;
    if (translations != null) {
      _data["translations"] = translations?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class CuisineTypeResponseTranslation {
  String? languageCode;
  String? name;
  String? description;
  int? id;
  int? cuisineTypeId;

  CuisineTypeResponseTranslation({
    this.languageCode,
    this.name,
    this.description,
    this.id,
    this.cuisineTypeId,
  });

  CuisineTypeResponseTranslation.fromJson(Map<String, dynamic> json) {
    languageCode = json["language_code"];
    name = json["name"];
    description = json["description"];
    id = json["id"];
    cuisineTypeId = json["cuisine_type_id"];
  }

  static List<CuisineTypeResponseTranslation> fromList(
    List<Map<String, dynamic>> list,
  ) {
    return list.map(CuisineTypeResponseTranslation.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["language_code"] = languageCode;
    _data["name"] = name;
    _data["description"] = description;
    _data["id"] = id;
    _data["cuisine_type_id"] = cuisineTypeId;
    return _data;
  }
}

class CuisineTypeInput {
  String? slugCode;
  bool? isActive;
  bool? isHomePage;
  String? iconName;
  Uint8List? iconFileBytes;
  List<CuisineTypeTranslationInput>? translations;

  CuisineTypeInput({
    this.slugCode,
    this.isActive,
    this.isHomePage,
    this.iconName,
    this.iconFileBytes,
    this.translations,
  });

  FormData toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["slug_code"] = slugCode;
    _data["is_active"] = isActive;
    _data["is_home_page"] = isHomePage;
    if (iconFileBytes != null && iconName != null) {
      _data["icon"] = MultipartFile.fromBytes(
        iconFileBytes!,
        filename: iconName!,
      );
    }
    if (translations != null) {
      for (int i = 0; i < translations!.length; i++) {
        final translation = translations![i];
        _data["translations[$i][language_code]"] = translation.languageCode;
        _data["translations[$i][name]"] = translation.name;
        _data["translations[$i][description]"] = translation.description;
      }
    }
    return FormData.fromMap(_data);
  }
}

class CuisineTypeUpdate {
  String? slugCode;
  bool? isActive;
  bool? isHomePage;
  String? iconName;
  Uint8List? iconFileBytes;

  CuisineTypeUpdate({
    this.slugCode,
    this.isActive,
    this.isHomePage,
    this.iconName,
    this.iconFileBytes,
  });

  FormData toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (slugCode != null) _data["slug_code"] = slugCode;
    if (isActive != null) _data["is_active"] = isActive;
    if (isHomePage != null) _data["is_home_page"] = isHomePage;
    if (iconFileBytes != null && iconName != null) {
      _data["icon"] = MultipartFile.fromBytes(
        iconFileBytes!,
        filename: iconName!,
      );
    }
    return FormData.fromMap(_data);
  }
}

class CuisineTypeTranslationInput {
  String? languageCode;
  String? name;
  String? description;

  CuisineTypeTranslationInput({this.languageCode, this.name, this.description});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["language_code"] = languageCode;
    _data["name"] = name;
    _data["description"] = description;
    return _data;
  }
}

class CuisineTypeTranslationUpdate {
  String? name;
  String? description;

  CuisineTypeTranslationUpdate({this.name, this.description});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (name != null) _data["name"] = name;
    if (description != null) _data["description"] = description;
    return _data;
  }
}
