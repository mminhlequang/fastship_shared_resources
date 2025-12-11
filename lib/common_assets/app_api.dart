import 'package:internal_core/internal_core.dart';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'package:internal_core/network/network.dart';

import 'package:internal_core/network/network_resources/resources.dart';
import '../../common_assets/models/models.dart';
import '../models/list_response.dart';

class _CommonAssetsEndpoint {
  _CommonAssetsEndpoint._();

  static String base() => "/api/v1/common-assets/";
  static String byId(String assetId) => "/api/v1/common-assets/$assetId";
  static String upload() => "/api/v1/common-assets/upload";
}

abstract class CommonAssetsApi {
  Future<NetworkResponse<CommonAssetResponse>> uploadCommonAsset({
    required String refType,
    required String refId,
    required String fileType,
    required Uint8List fileBytes,
    required String fileName,
  });

  Future<NetworkResponse<ListResponse<CommonAssetResponse>>> getCommonAssets({
    String? refType,
    String? refId,
    String? fileType,
    int limit = 10,
    int offset = 0,
  });

  Future<NetworkResponse<void>> deleteCommonAsset(String assetId);
}

class CommonAssetsApiImpl extends CommonAssetsApi {
  @override
  Future<NetworkResponse<CommonAssetResponse>> uploadCommonAsset({
    required String refType,
    required String refId,
    String? fileType,
    required Uint8List fileBytes,
    required String fileName,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final formData = FormData.fromMap({
          'ref_type': refType,
          'ref_id': refId,
          'file_type': fileType,
          'file': MultipartFile.fromBytes(fileBytes, filename: fileName),
        });

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_CommonAssetsEndpoint.upload(), data: formData);

        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CommonAssetResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<CommonAssetResponse>>> getCommonAssets({
    String? refType,
    String? refId,
    String? fileType,
    int limit = 10,
    int offset = 0,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'limit': limit, 'offset': offset};
        void put(String k, dynamic v) {
          if (v != null) params[k] = v;
        }

        put('ref_type', refType);
        put('ref_id', refId);
        put('file_type', fileType);

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_CommonAssetsEndpoint.base(), queryParameters: params);

        return NetworkResponse.fromResponse(
          response,
          converter: (json) {
            return ListResponse<CommonAssetResponse>.fromJson(
              json,
              (item) =>
                  CommonAssetResponse.fromJson(item as Map<String, dynamic>),
            );
          },
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteCommonAsset(String assetId) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_CommonAssetsEndpoint.byId(assetId));

        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }
}
