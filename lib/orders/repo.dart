import 'package:internal_network/network_resources/resources.dart';

import 'app_api.dart';
import 'models/models.dart';

class OrdersRepo {
  OrdersRepo._();
  static OrdersRepo? _instance;

  factory OrdersRepo([OrdersApi? api]) {
    _instance ??= OrdersRepo._();
    _instance!._api = api ?? OrdersApiImpl();
    return _instance!;
  }

  late OrdersApi _api;

  // Order operations
  Future<NetworkResponse<CheckoutCalculationResponse>> calculateCheckout(
    CheckoutRequest request,
  ) => _api.calculateCheckout(request);

  Future<NetworkResponse<CheckoutResponse>> processCheckout(
    String customerId,
    CheckoutRequest request,
  ) => _api.processCheckout(customerId, request);
}
