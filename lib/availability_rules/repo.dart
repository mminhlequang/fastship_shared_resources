import 'package:internal_network/network_resources/resources.dart';

import 'app_api.dart';
import 'models/models.dart';
import '../models/models.dart';

class AvailabilityRulesRepo {
  AvailabilityRulesRepo._();
  static AvailabilityRulesRepo? _instance;

  factory AvailabilityRulesRepo([AvailabilityRulesApi? api]) {
    _instance ??= AvailabilityRulesRepo._();
    _instance!._api = api ?? AvailabilityRulesApiImpl();
    return _instance!;
  }

  late AvailabilityRulesApi _api;

  Future<NetworkResponse<AvailabilityRuleResponse>> createAvailabilityRule(
          AvailabilityRuleInput create) =>
      _api.createAvailabilityRule(create);

  Future<NetworkResponse<ListResponse<AvailabilityRuleResponse>>>
      getAvailabilityRules({
    String? ruleType,
    String? referenceId,
    String? dayOfWeek,
    int offset = 0,
    int limit = 100,
  }) =>
          _api.getAvailabilityRules(
            ruleType: ruleType,
            referenceId: referenceId,
            dayOfWeek: dayOfWeek,
            offset: offset,
            limit: limit,
          );

  Future<NetworkResponse<AvailabilityRuleResponse>> getAvailabilityRule(
          String ruleId) =>
      _api.getAvailabilityRule(ruleId);

  Future<NetworkResponse<AvailabilityRuleResponse>> updateAvailabilityRule(
          String ruleId, AvailabilityRuleInput update) =>
      _api.updateAvailabilityRule(ruleId, update);

  Future<NetworkResponse<void>> deleteAvailabilityRule(String ruleId) =>
      _api.deleteAvailabilityRule(ruleId);
}
