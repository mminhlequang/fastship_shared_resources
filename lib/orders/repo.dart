import 'package:internal_network/network_resources/resources.dart';

import '../models/models.dart' show ListResponse;
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
    CheckoutRequest request,
  ) => _api.processCheckout(request);

  // Admin APIs (yêu cầu authentication)
  Future<NetworkResponse<ListResponse<OrderResponse>>> getAllOrders({
    int? limit,
    int? offset,
    String? customerId,
    int? restaurantId,
    String? driverId,
    String? status,
    String? statusIn, //List of statuses separated by ,
    String? paymentStatus,
    String? deliveryType,
  }) => _api.getAllOrders(
    limit: limit,
    offset: offset,
    customerId: customerId,
    restaurantId: restaurantId,
    driverId: driverId,
    status: status,
    statusIn: statusIn,
    paymentStatus: paymentStatus,
    deliveryType: deliveryType,
  );

  // Admin APIs (yêu cầu authentication)
  Future<NetworkResponse<OrderResponse>> getOrderById({dynamic? id}) =>
      _api.getOrderById(id: id);

  Future<NetworkResponse<OrderResponse>> updateOrder(
    String orderId,
    OrderUpdate request,
  ) => _api.updateOrder(orderId, request);

  Future<NetworkResponse<OrderResponse>> completeOrder(String orderId) =>
      _api.completeOrder(orderId);

  Future<NetworkResponse<void>> deleteOrder(String orderId) =>
      _api.deleteOrder(orderId);

  // Customer APIs (yêu cầu authentication)
  Future<NetworkResponse<ListResponse<OrderResponse>>> getMyOrders({
    int? limit,
    int? offset,
    int? restaurantId,
    String? driverId,
    String? status,
    String? statusIn, //List of statuses separated by ,
    String? paymentStatus,
    String? deliveryType,
  }) => _api.getMyOrders(
    limit: limit,
    offset: offset,
    restaurantId: restaurantId,
    driverId: driverId,
    status: status,
    statusIn: statusIn,
    paymentStatus: paymentStatus,
    deliveryType: deliveryType,
  );

  Future<NetworkResponse<void>> cancelOrder(String orderId, {String? note}) =>
      _api.cancelOrder(orderId, note: note);
  Future<NetworkResponse<void>> cancelOrderv2(String orderId, {String? note}) =>
      _api.cancelOrderv2(orderId, note: note);

  // Status Update API (yêu cầu authentication - driver/restaurant)
  Future<NetworkResponse<OrderResponse>> updateOrderStatus(
    String orderId,
    String newStatus, {
    String? note,
  }) => _api.updateOrderStatus(orderId, newStatus, note: note);
}
