import 'package:internal_core/network/network_resources/resources.dart';

import 'app_api.dart';
import 'models/models.dart';
import '../models/models.dart';

class CustomersRepo {
  CustomersRepo._();
  static CustomersRepo? _instance;

  factory CustomersRepo([CustomersApi? api]) {
    _instance ??= CustomersRepo._();
    _instance!._api = api ?? CustomersApiImpl();
    return _instance!;
  }

  late CustomersApi _api;

  Future<NetworkResponse<ListResponse<CustomerResponse>>> getCustomersAdmin({
    int offset = 0,
    int limit = 100,
    bool? isActive,
    bool? isOnline,
    String? accountStatus,
  }) => _api.getCustomersAdmin(
    offset: offset,
    limit: limit,
    isActive: isActive,
    isOnline: isOnline,
    accountStatus: accountStatus,
  );

  Future<NetworkResponse<CustomerResponse>> updateCustomerAdmin(
    String customerId,
    CustomerUpdate update,
  ) => _api.updateCustomerAdmin(customerId, update);

  Future<NetworkResponse<void>> deleteCustomerAdmin(String customerId) =>
      _api.deleteCustomerAdmin(customerId);
}
