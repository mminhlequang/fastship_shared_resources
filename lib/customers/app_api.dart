import 'package:internal_core/internal_core.dart';
import 'package:internal_core/network/network.dart';

import 'package:internal_core/network/network_resources/resources.dart';

import '../models/list_response.dart';
import 'models/models.dart';

class _CustomersEndpoint {
  _CustomersEndpoint._();

  static String base() => "/api/v1/customers/admin";
  static String byId(String customerId) =>
      "/api/v1/customers/admin/$customerId";
}

abstract class CustomersApi {
  Future<NetworkResponse<ListResponse<CustomerResponse>>> getCustomersAdmin({
    int offset = 0,
    int limit = 100,
    bool? isActive,
    bool? isOnline,
    String? accountStatus,
  });

  Future<NetworkResponse<CustomerResponse>> updateCustomerAdmin(
    String customerId,
    CustomerUpdate update,
  );

  Future<NetworkResponse<void>> deleteCustomerAdmin(String customerId);
}

class CustomersApiImpl extends CustomersApi {
  @override
  Future<NetworkResponse<ListResponse<CustomerResponse>>> getCustomersAdmin({
    int offset = 0,
    int limit = 100,
    bool? isActive,
    bool? isOnline,
    String? accountStatus,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        void put(String k, dynamic v) {
          if (v != null) params[k] = v;
        }

        put('is_active', isActive);
        put('is_online', isOnline);
        put('account_status', accountStatus);

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_CustomersEndpoint.base(), queryParameters: params);

        return NetworkResponse.fromResponse(
          response,
          converter: (json) {
            return ListResponse<CustomerResponse>.fromJson(
              json,
              (item) => CustomerResponse.fromJson(item as Map<String, dynamic>),
            );
          },
        );
      },
    );
  }

  @override
  Future<NetworkResponse<CustomerResponse>> updateCustomerAdmin(
    String customerId,
    CustomerUpdate update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(_CustomersEndpoint.byId(customerId), data: update.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CustomerResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteCustomerAdmin(String customerId) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_CustomersEndpoint.byId(customerId));
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }
}
