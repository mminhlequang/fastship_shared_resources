import 'dart:typed_data';

import 'package:dio/dio.dart';

class SearchSuggestionResponse {
  String? imageUrl;
  bool? isActive;
  String? languageCode;
  String? name;
  int? id;

  SearchSuggestionResponse({
    this.imageUrl,
    this.isActive,
    this.languageCode,
    this.name,
    this.id,
  });

  SearchSuggestionResponse.fromJson(Map<String, dynamic> json) {
    imageUrl = json["image_url"];
    isActive = json["is_active"];
    languageCode = json["language_code"];
    name = json["name"];
    id = json["id"];
  }

  static List<SearchSuggestionResponse> fromList(
    List<Map<String, dynamic>> list,
  ) {
    return list.map(SearchSuggestionResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["image_url"] = imageUrl;
    _data["is_active"] = isActive;
    _data["language_code"] = languageCode;
    _data["name"] = name;
    _data["id"] = id;
    return _data;
  }
}

class SearchSuggestionInput {
  String? name;
  String? languageCode;
  bool? isActive;
  bool? isHomePage;
  bool? isSearchPage;
  String? imageName;
  Uint8List? imageFileBytes;

  SearchSuggestionInput({
    this.name,
    this.languageCode,
    this.isActive,
    this.isHomePage,
    this.isSearchPage,
    this.imageName,
    this.imageFileBytes,
  });

  FormData toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["language_code"] = languageCode;
    _data["is_active"] = isActive;
    _data["is_home_page"] = isHomePage;
    _data["is_search_page"] = isSearchPage;
    if (imageFileBytes != null && imageName != null) {
      _data["image"] = MultipartFile.fromBytes(
        imageFileBytes!,
        filename: imageName!,
      );
    }
    return FormData.fromMap(_data);
  }
}

class SearchSuggestionUpdate {
  String? name;
  String? languageCode;
  bool? isActive;
  bool? isHomePage;
  bool? isSearchPage;
  String? imageName;
  Uint8List? imageFileBytes;

  SearchSuggestionUpdate({
    this.name,
    this.languageCode,
    this.isActive,
    this.isHomePage,
    this.isSearchPage,
    this.imageName,
    this.imageFileBytes,
  });

  FormData toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (name != null) _data["name"] = name;
    if (languageCode != null) _data["language_code"] = languageCode;
    if (isActive != null) _data["is_active"] = isActive;
    if (isHomePage != null) _data["is_home_page"] = isHomePage;
    if (isSearchPage != null) _data["is_search_page"] = isSearchPage;
    if (imageFileBytes != null && imageName != null) {
      _data["image"] = MultipartFile.fromBytes(
        imageFileBytes!,
        filename: imageName!,
      );
    }
    return FormData.fromMap(_data);
  }
}
