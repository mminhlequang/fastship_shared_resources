import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';

import '../models/models.dart' show ListResponse;
import 'models/models.dart';

class _OrdersEndpoint {
  _OrdersEndpoint._();

  // Order APIs
  static String calculateCheckout() => "/api/v1/orders/checkout/calculate";
  static String processCheckout() => "/api/v1/orders/checkout";

  // Admin APIs
  static String adminOrders() => "/api/v1/admin/orders/all";
  static String adminOrderDetail(String orderId) =>
      "/api/v1/admin/orders/$orderId";

  // Customer APIs
  static String customerOrders() => "/api/v1/customer/orders/my";
  static String customerCancelOrder(String orderId) =>
      "/api/v1/customer/orders/my/$orderId/cancel";

  // Status Update API
  static String updateOrderStatus(String orderId) =>
      "/api/v1/customer/orders/$orderId/status";
}

abstract class OrdersApi {
  // Order operations
  Future<NetworkResponse<CheckoutCalculationResponse>> calculateCheckout(
    CheckoutRequest request,
  );
  Future<NetworkResponse<CheckoutResponse>> processCheckout(
    CheckoutRequest request,
  );

  // Admin APIs (yêu cầu authentication)
  Future<NetworkResponse<ListResponse<OrderResponse>>> getAllOrders({
    int? limit,
    int? offset,
    String? customerId,
    int? restaurantId,
    String? driverId,
    String? status,
    String? paymentStatus,
    String? deliveryType,
  });
  Future<NetworkResponse<OrderResponse>> updateOrder(
    String orderId,
    OrderUpdate request,
  );
  Future<NetworkResponse<void>> deleteOrder(String orderId);

  // Customer APIs (yêu cầu authentication)
  Future<NetworkResponse<ListResponse<OrderResponse>>> getMyOrders({
    int? limit,
    int? offset,
    int? restaurantId,
    String? driverId,
    String? status,
    String? paymentStatus,
    String? deliveryType,
  });
  Future<NetworkResponse<void>> cancelOrder(String orderId, {String? note});

  // Status Update API (yêu cầu authentication - driver/restaurant)
  Future<NetworkResponse<OrderResponse>> updateOrderStatus(
    String orderId,
    String newStatus, {
    String? note,
  });
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
    CheckoutRequest request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_OrdersEndpoint.processCheckout(), data: request.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CheckoutResponse.fromJson(json),
        );
      },
    );
  }

  // Admin APIs Implementation
  @override
  Future<NetworkResponse<ListResponse<OrderResponse>>> getAllOrders({
    int? limit,
    int? offset,
    String? customerId,
    int? restaurantId,
    String? driverId,
    String? status,
    String? paymentStatus,
    String? deliveryType,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final queryParams = <String, dynamic>{};
        if (limit != null) queryParams['limit'] = limit;
        if (offset != null) queryParams['offset'] = offset;
        if (customerId != null) queryParams['customer_id'] = customerId;
        if (restaurantId != null) queryParams['restaurant_id'] = restaurantId;
        if (driverId != null) queryParams['driver_id'] = driverId;
        if (status != null) queryParams['status'] = status;
        if (paymentStatus != null)
          queryParams['payment_status'] = paymentStatus;
        if (deliveryType != null) queryParams['delivery_type'] = deliveryType;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_OrdersEndpoint.adminOrders(), queryParameters: queryParams);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse<OrderResponse>.fromJson(
                json,
                (item) => OrderResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<OrderResponse>> updateOrder(
    String orderId,
    OrderUpdate request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _OrdersEndpoint.adminOrderDetail(orderId),
          data: request.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => OrderResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteOrder(String orderId) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_OrdersEndpoint.adminOrderDetail(orderId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => null,
        );
      },
    );
  }

  // Customer APIs Implementation
  @override
  Future<NetworkResponse<ListResponse<OrderResponse>>> getMyOrders({
    int? limit,
    int? offset,
    int? restaurantId,
    String? driverId,
    String? status,
    String? paymentStatus,
    String? deliveryType,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final queryParams = <String, dynamic>{};
        if (limit != null) queryParams['limit'] = limit;
        if (offset != null) queryParams['offset'] = offset;
        if (restaurantId != null) queryParams['restaurant_id'] = restaurantId;
        if (driverId != null) queryParams['driver_id'] = driverId;
        if (status != null) queryParams['status'] = status;
        if (paymentStatus != null)
          queryParams['payment_status'] = paymentStatus;
        if (deliveryType != null) queryParams['delivery_type'] = deliveryType;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_OrdersEndpoint.customerOrders(), queryParameters: queryParams);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse<OrderResponse>.fromJson(
                json,
                (item) => OrderResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> cancelOrder(
    String orderId, {
    String? note,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final queryParams = <String, dynamic>{};
        if (note != null) queryParams['note'] = note;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _OrdersEndpoint.customerCancelOrder(orderId),
          queryParameters: queryParams,
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => null,
        );
      },
    );
  }

  // Status Update API Implementation
  @override
  Future<NetworkResponse<OrderResponse>> updateOrderStatus(
    String orderId,
    String newStatus, {
    String? note,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final queryParams = <String, dynamic>{'new_status': newStatus};
        if (note != null) queryParams['note'] = note;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _OrdersEndpoint.updateOrderStatus(orderId),
          queryParameters: queryParams,
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => OrderResponse.fromJson(json),
        );
      },
    );
  }
}
