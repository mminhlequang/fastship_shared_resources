import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';

import 'models/models.dart';

class _OrdersEndpoint {
  _OrdersEndpoint._();

  // Order APIs
  static String calculateCheckout() => "/api/v1/orders/checkout/calculate";
  static String processCheckout() => "/api/v1/orders/checkout";
}

abstract class OrdersApi {
  // Order operations
  Future<NetworkResponse<CheckoutCalculationResponse>> calculateCheckout(
    CheckoutRequest request,
  );
  Future<NetworkResponse<CheckoutResponse>> processCheckout(
    String customerId,
    CheckoutRequest request,
  );
}

class OrdersApiImpl extends OrdersApi {
  @override
  Future<NetworkResponse<CheckoutCalculationResponse>> calculateCheckout(
    CheckoutRequest request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_OrdersEndpoint.calculateCheckout(), data: request.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CheckoutCalculationResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<CheckoutResponse>> processCheckout(
    String customerId,
    CheckoutRequest request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _OrdersEndpoint.processCheckout(),
          data: request.toJson(),
          queryParameters: {'customer_id': customerId},
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CheckoutResponse.fromJson(json),
        );
      },
    );
  }
}
