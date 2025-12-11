import 'dart:typed_data';

import '../../common_assets/app_api.dart';
import '../../common_assets/models/models.dart';

import 'package:internal_core/network/network_resources/resources.dart';
import '../models/list_response.dart';

class CommonAssetsRepo {
  CommonAssetsRepo._();
  static CommonAssetsRepo? _instance;

  factory CommonAssetsRepo([CommonAssetsApiImpl? api]) {
    _instance ??= CommonAssetsRepo._();
    _instance!._api = api ?? CommonAssetsApiImpl();
    return _instance!;
  }

  late CommonAssetsApiImpl _api;

  /// Upload a new common asset
  Future<NetworkResponse<CommonAssetResponse>> uploadCommonAsset({
    required String refType,
    required String refId,
    String? fileType,
    required Uint8List fileBytes,
    required String fileName,
  }) async {
    return await _api.uploadCommonAsset(
      refType: refType,
      refId: refId,
      fileType: fileType,
      fileBytes: fileBytes,
      fileName: fileName,
    );
  }

  /// Get common assets with filtering and pagination
  Future<NetworkResponse<ListResponse<CommonAssetResponse>>> getCommonAssets({
    String? refType,
    String? refId,
    String? fileType,
    int limit = 10,
    int offset = 0,
  }) async {
    return await _api.getCommonAssets(
      refType: refType,
      refId: refId,
      fileType: fileType,
      limit: limit,
      offset: offset,
    );
  }

  /// Delete a common asset
  Future<NetworkResponse<void>> deleteCommonAsset(String assetId) async {
    return await _api.deleteCommonAsset(assetId);
  }
}
