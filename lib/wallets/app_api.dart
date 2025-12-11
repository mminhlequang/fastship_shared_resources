import 'package:internal_core/internal_core.dart';
import 'package:internal_core/network/network.dart';
import 'package:shared_resources/orders/orders.dart';

import 'package:internal_core/network/network_resources/resources.dart';

import '../models/models.dart' show ListResponse;
import 'models/models.dart';

class _WalletsEndpoint {
  _WalletsEndpoint._();

  // User APIs
  static String getWallet() => "/api/v1/wallets/get";
  static String getTransactions() => "/api/v1/wallets/transactions";
  static String createTopupCheckoutSession() =>
      "/api/v1/wallets/topup/create-checkout-session";
  static String createWithdrawRequest() => "/api/v1/wallets/withdrawals";
  static String getWithdrawals() => "/api/v1/wallets/withdrawals";

  // Admin APIs
  static String getSystemWallet() => "/api/v1/wallets/admin/system";
  static String getAllTransactionsAdmin() =>
      "/api/v1/wallets/admin/transactions";
  static String getAllWithdrawalsAdmin() => "/api/v1/wallets/admin/withdrawals";
  static String approveWithdrawal(String withdrawId) =>
      "/api/v1/wallets/admin/withdrawals/$withdrawId/approve";
  static String rejectWithdrawal(String withdrawId) =>
      "/api/v1/wallets/admin/withdrawals/$withdrawId/reject";
  static String markWithdrawalPaid(String withdrawId) =>
      "/api/v1/wallets/admin/withdrawals/$withdrawId/mark-paid";
}

abstract class WalletsApi {
  // User APIs (yêu cầu authentication)
  Future<NetworkResponse<WalletResponse>> getWallet({
    String? customerId,
    String? driverId,
    int? restaurantId,
  });
  Future<NetworkResponse<ListResponse<WalletTransactionResponse>>>
  getTransactions({
    String? customerId,
    String? driverId,
    int? restaurantId,
    String? transactionType,
    String? orderId,
    int? offset,
    int? limit,
  });
  Future<NetworkResponse<CheckoutResponse>> createTopupCheckoutSession({
    String? customerId,
    String? driverId,
    int? amount,
    bool usePaymentIntent = false,
  });
  Future<NetworkResponse<WalletWithdrawRequestResponse>> createWithdrawRequest({
    String? customerId,
    String? driverId,
    int? restaurantId,
    required int amount,
    String? method,
  });
  Future<NetworkResponse<ListResponse<WalletWithdrawRequestResponse>>>
  getWithdrawals({
    String? customerId,
    String? driverId,
    int? restaurantId,
    String? status,
    int? offset,
    int? limit,
  });

  // Admin APIs (yêu cầu authentication)
  Future<NetworkResponse<WalletResponse>> getSystemWallet();
  Future<NetworkResponse<ListResponse<WalletTransactionResponse>>>
  getAllTransactionsAdmin({
    String? orderId,
    String? customerId,
    String? driverId,
    int? restaurantId,
    String? transactionType,
    int? offset,
    int? limit,
  });
  Future<NetworkResponse<ListResponse<WalletWithdrawRequestResponse>>>
  getAllWithdrawalsAdmin({
    String? status,
    String? customerId,
    String? driverId,
    int? restaurantId,
    int? offset,
    int? limit,
  });
  Future<NetworkResponse<WalletWithdrawRequestResponse>> approveWithdrawal(
    String withdrawId,
  );
  Future<NetworkResponse<WalletWithdrawRequestResponse>> rejectWithdrawal(
    String withdrawId,
    String reason,
  );
  Future<NetworkResponse<WalletWithdrawRequestResponse>> markWithdrawalPaid(
    String withdrawId,
  );
}

class WalletsApiImpl extends WalletsApi {
  @override
  Future<NetworkResponse<WalletResponse>> getWallet({
    String? customerId,
    String? driverId,
    int? restaurantId,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final queryParams = <String, dynamic>{};
        if (customerId != null) queryParams['customer_id'] = customerId;
        if (driverId != null) queryParams['driver_id'] = driverId;
        if (restaurantId != null) queryParams['restaurant_id'] = restaurantId;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_WalletsEndpoint.getWallet(), queryParameters: queryParams);
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => WalletResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<WalletTransactionResponse>>>
  getTransactions({
    String? customerId,
    String? driverId,
    int? restaurantId,
    String? transactionType,
    String? orderId,
    int? offset,
    int? limit,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final queryParams = <String, dynamic>{};
        if (customerId != null) queryParams['customer_id'] = customerId;
        if (driverId != null) queryParams['driver_id'] = driverId;
        if (restaurantId != null) queryParams['restaurant_id'] = restaurantId;
        if (transactionType != null)
          queryParams['transaction_type'] = transactionType;
        if (orderId != null) queryParams['order_id'] = orderId;
        if (offset != null) queryParams['offset'] = offset;
        if (limit != null) queryParams['limit'] = limit;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_WalletsEndpoint.getTransactions(), queryParameters: queryParams);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse<WalletTransactionResponse>.fromJson(
                json,
                (item) => WalletTransactionResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<CheckoutResponse>> createTopupCheckoutSession({
    String? customerId,
    String? driverId,
    int? amount,
    bool usePaymentIntent = false,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final queryParams = <String, dynamic>{};
        if (customerId != null) queryParams['customer_id'] = customerId;
        if (driverId != null) queryParams['driver_id'] = driverId;
        if (amount != null) queryParams['amount'] = amount;
        queryParams['use_payment_intent'] = usePaymentIntent;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _WalletsEndpoint.createTopupCheckoutSession(),
          queryParameters: queryParams,
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CheckoutResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<WalletWithdrawRequestResponse>> createWithdrawRequest({
    String? customerId,
    String? driverId,
    int? restaurantId,
    required int amount,
    String? method,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final queryParams = <String, dynamic>{'amount': amount};
        if (customerId != null) queryParams['customer_id'] = customerId;
        if (driverId != null) queryParams['driver_id'] = driverId;
        if (restaurantId != null) queryParams['restaurant_id'] = restaurantId;
        if (method != null) queryParams['method'] = method;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _WalletsEndpoint.createWithdrawRequest(),
          queryParameters: queryParams,
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => WalletWithdrawRequestResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<WalletWithdrawRequestResponse>>>
  getWithdrawals({
    String? customerId,
    String? driverId,
    int? restaurantId,
    String? status,
    int? offset,
    int? limit,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final queryParams = <String, dynamic>{};
        if (customerId != null) queryParams['customer_id'] = customerId;
        if (driverId != null) queryParams['driver_id'] = driverId;
        if (restaurantId != null) queryParams['restaurant_id'] = restaurantId;
        if (status != null) queryParams['status'] = status;
        if (offset != null) queryParams['offset'] = offset;
        if (limit != null) queryParams['limit'] = limit;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_WalletsEndpoint.getWithdrawals(), queryParameters: queryParams);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse<WalletWithdrawRequestResponse>.fromJson(
                json,
                (item) => WalletWithdrawRequestResponse.fromJson(item),
              ),
        );
      },
    );
  }

  // Admin APIs Implementation
  @override
  Future<NetworkResponse<WalletResponse>> getSystemWallet() async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_WalletsEndpoint.getSystemWallet());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => WalletResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<WalletTransactionResponse>>>
  getAllTransactionsAdmin({
    String? orderId,
    String? customerId,
    String? driverId,
    int? restaurantId,
    String? transactionType,
    int? offset,
    int? limit,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final queryParams = <String, dynamic>{};
        if (orderId != null) queryParams['order_id'] = orderId;
        if (customerId != null) queryParams['customer_id'] = customerId;
        if (driverId != null) queryParams['driver_id'] = driverId;
        if (restaurantId != null) queryParams['restaurant_id'] = restaurantId;
        if (transactionType != null)
          queryParams['transaction_type'] = transactionType;
        if (offset != null) queryParams['offset'] = offset;
        if (limit != null) queryParams['limit'] = limit;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _WalletsEndpoint.getAllTransactionsAdmin(),
          queryParameters: queryParams,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse<WalletTransactionResponse>.fromJson(
                json,
                (item) => WalletTransactionResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<WalletWithdrawRequestResponse>>>
  getAllWithdrawalsAdmin({
    String? status,
    String? customerId,
    String? driverId,
    int? restaurantId,
    int? offset,
    int? limit,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final queryParams = <String, dynamic>{};
        if (status != null) queryParams['status'] = status;
        if (customerId != null) queryParams['customer_id'] = customerId;
        if (driverId != null) queryParams['driver_id'] = driverId;
        if (restaurantId != null) queryParams['restaurant_id'] = restaurantId;
        if (offset != null) queryParams['offset'] = offset;
        if (limit != null) queryParams['limit'] = limit;

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _WalletsEndpoint.getAllWithdrawalsAdmin(),
          queryParameters: queryParams,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse<WalletWithdrawRequestResponse>.fromJson(
                json,
                (item) => WalletWithdrawRequestResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<WalletWithdrawRequestResponse>> approveWithdrawal(
    String withdrawId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(_WalletsEndpoint.approveWithdrawal(withdrawId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => WalletWithdrawRequestResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<WalletWithdrawRequestResponse>> rejectWithdrawal(
    String withdrawId,
    String reason,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _WalletsEndpoint.rejectWithdrawal(withdrawId),
          queryParameters: {'reason': reason},
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => WalletWithdrawRequestResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<WalletWithdrawRequestResponse>> markWithdrawalPaid(
    String withdrawId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(_WalletsEndpoint.markWithdrawalPaid(withdrawId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => WalletWithdrawRequestResponse.fromJson(json),
        );
      },
    );
  }
}
