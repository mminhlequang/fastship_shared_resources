import 'package:internal_network/network_resources/resources.dart';

import '../models/models.dart' show ListResponse;
import 'app_api.dart';
import 'models/models.dart';

class SystemRepo {
  SystemRepo._();
  static SystemRepo? _instance;

  factory SystemRepo([SystemApi? api]) {
    _instance ??= SystemRepo._();
    _instance!._api = api ?? SystemApiImpl();
    return _instance!;
  }

  late SystemApi _api;

  // Admin APIs (yêu cầu authentication)
  Future<NetworkResponse<ListResponse<SystemSettingResponse>>> getAllSettings({
    int? limit,
    int? offset,
    List<String>? namespaces,
    List<String>? keys,
    bool? allowPublic,
  }) => _api.getAllSettings(
    limit: limit,
    offset: offset,
    namespaces: namespaces,
    keys: keys,
    allowPublic: allowPublic,
  );

  Future<NetworkResponse<SystemSettingResponse>> createSetting(
    SystemSettingCreate request,
  ) => _api.createSetting(request);

  Future<NetworkResponse<SystemSettingResponse>> updateSetting(
    String namespace,
    String key,
    SystemSettingUpdate request,
  ) => _api.updateSetting(namespace, key, request);

  Future<NetworkResponse<SystemSettingResponse>> deleteSetting(
    String namespace,
    String key,
  ) => _api.deleteSetting(namespace, key);

  // Public APIs (không cần authentication)
  Future<NetworkResponse<ListResponse<SystemSettingResponse>>>
  getPublicSettings({
    int? limit,
    int? offset,
    List<String>? namespaces,
    List<String>? keys,
  }) => _api.getPublicSettings(
    limit: limit,
    offset: offset,
    namespaces: namespaces,
    keys: keys,
  );
}
