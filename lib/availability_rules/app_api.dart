import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';

import '../models/list_response.dart';
import 'models/models.dart';

class _AvailabilityRulesEndpoint {
  _AvailabilityRulesEndpoint._();

  static String base() => "/api/v1/availability/rules";
  static String byId(String ruleId) => "/api/v1/availability/rules/$ruleId";
}

abstract class AvailabilityRulesApi {
  Future<NetworkResponse<AvailabilityRuleResponse>> createAvailabilityRule(
    AvailabilityRuleInput create,
  );

  Future<NetworkResponse<ListResponse<AvailabilityRuleResponse>>>
  getAvailabilityRules({
    String? refType,
    String? refId,
    String? dayOfWeek,
    int offset = 0,
    int limit = 100,
  });

  Future<NetworkResponse<AvailabilityRuleResponse>> getAvailabilityRule(
    String ruleId,
  );

  Future<NetworkResponse<AvailabilityRuleResponse>> updateAvailabilityRule(
    String ruleId,
    AvailabilityRuleInput update,
  );

  Future<NetworkResponse<void>> deleteAvailabilityRule(String ruleId);
}

class AvailabilityRulesApiImpl extends AvailabilityRulesApi {
  @override
  Future<NetworkResponse<AvailabilityRuleResponse>> createAvailabilityRule(
    AvailabilityRuleInput create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_AvailabilityRulesEndpoint.base(), data: create.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => AvailabilityRuleResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<AvailabilityRuleResponse>>>
  getAvailabilityRules({
    String? refType,
    String? refId,
    String? dayOfWeek,
    int offset = 0,
    int limit = 100,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        void put(String k, dynamic v) {
          if (v != null) params[k] = v;
        }

        put('ref_type', refType);
        put('ref_id', refId);
        put('day_of_week', dayOfWeek);

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_AvailabilityRulesEndpoint.base(), queryParameters: params);

        return NetworkResponse.fromResponse(
          response,
          converter: (json) {
            return ListResponse<AvailabilityRuleResponse>.fromJson(
              json,
              (item) => AvailabilityRuleResponse.fromJson(
                item as Map<String, dynamic>,
              ),
            );
          },
        );
      },
    );
  }

  @override
  Future<NetworkResponse<AvailabilityRuleResponse>> getAvailabilityRule(
    String ruleId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_AvailabilityRulesEndpoint.byId(ruleId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => AvailabilityRuleResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<AvailabilityRuleResponse>> updateAvailabilityRule(
    String ruleId,
    AvailabilityRuleInput update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(_AvailabilityRulesEndpoint.byId(ruleId), data: update.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => AvailabilityRuleResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteAvailabilityRule(String ruleId) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_AvailabilityRulesEndpoint.byId(ruleId));
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }
}
