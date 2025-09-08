import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';

import '../models/models.dart' show ListResponse;
import 'models/models.dart';

class _SystemEndpoint {
  _SystemEndpoint._();

  // Admin APIs
  static String adminSettings() => "/api/v1/admin/settings";
  static String adminSettingDetail(String namespace, String key) =>
      "/api/v1/admin/settings/$namespace/$key";

  // Public APIs
  static String publicSettings() => "/api/v1/settings/public";
}

abstract class SystemApi {
  // Admin APIs (yêu cầu authentication)
  Future<NetworkResponse<ListResponse<SystemSettingResponse>>> getAllSettings({
    int? limit,
    int? offset,
    List<String>? namespaces,
    List<String>? keys,
    bool? allowPublic,
  });
  Future<NetworkResponse<SystemSettingResponse>> createSetting(
    SystemSettingCreate request,
  );
  Future<NetworkResponse<SystemSettingResponse>> updateSetting(
    String namespace,
    String key,
    SystemSettingUpdate request,
  );
  Future<NetworkResponse<SystemSettingResponse>> deleteSetting(
    String namespace,
    String key,
  );

  // Public APIs (không cần authentication)
  Future<NetworkResponse<ListResponse<SystemSettingResponse>>>
  getPublicSettings({
    int? limit,
    int? offset,
    List<String>? namespaces,
    List<String>? keys,
  });
}

class SystemApiImpl extends SystemApi {
  @override
  Future<NetworkResponse<ListResponse<SystemSettingResponse>>> getAllSettings({
    int? limit,
    int? offset,
    List<String>? namespaces,
    List<String>? keys,
    bool? allowPublic,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final queryParams = <String, dynamic>{};
        if (limit != null) queryParams['limit'] = limit;
        if (offset != null) queryParams['offset'] = offset;
        if (namespaces != null) queryParams['namespaces'] = namespaces;
        if (keys != null) queryParams['keys'] = keys;
        if (allowPublic != null) queryParams['allow_public'] = allowPublic;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_SystemEndpoint.adminSettings(), queryParameters: queryParams);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse<SystemSettingResponse>.fromJson(
                json,
                (item) => SystemSettingResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<SystemSettingResponse>> createSetting(
    SystemSettingCreate request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_SystemEndpoint.adminSettings(), data: request.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => SystemSettingResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<SystemSettingResponse>> updateSetting(
    String namespace,
    String key,
    SystemSettingUpdate request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _SystemEndpoint.adminSettingDetail(namespace, key),
          data: request.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => SystemSettingResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<SystemSettingResponse>> deleteSetting(
    String namespace,
    String key,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_SystemEndpoint.adminSettingDetail(namespace, key));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => SystemSettingResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<SystemSettingResponse>>>
  getPublicSettings({
    int? limit,
    int? offset,
    List<String>? namespaces,
    List<String>? keys,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final queryParams = <String, dynamic>{};
        if (limit != null) queryParams['limit'] = limit;
        if (offset != null) queryParams['offset'] = offset;
        if (namespaces != null) queryParams['namespaces'] = namespaces;
        if (keys != null) queryParams['keys'] = keys;

        final response = await AppClient().get(
          _SystemEndpoint.publicSettings(),
          queryParameters: queryParams,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse<SystemSettingResponse>.fromJson(
                json,
                (item) => SystemSettingResponse.fromJson(item),
              ),
        );
      },
    );
  }
}
