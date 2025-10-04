import 'package:internal_network/network_resources/resources.dart';

import '../models/models.dart' show ListResponse;
import 'app_api.dart';
import 'models/models.dart';

class WalletsRepo {
  WalletsRepo._();
  static WalletsRepo? _instance;

  factory WalletsRepo([WalletsApi? api]) {
    _instance ??= WalletsRepo._();
    _instance!._api = api ?? WalletsApiImpl();
    return _instance!;
  }

  late WalletsApi _api;

  // User APIs (yêu cầu authentication)
  Future<NetworkResponse<WalletResponse>> getWallet({
    String? customerId,
    String? driverId,
    int? restaurantId,
  }) => _api.getWallet(
    customerId: customerId,
    driverId: driverId,
    restaurantId: restaurantId,
  );

  Future<NetworkResponse<ListResponse<WalletTransactionResponse>>>
  getTransactions({
    String? customerId,
    String? driverId,
    int? restaurantId,
    String? transactionType,
    String? orderId,
    int? offset,
    int? limit,
  }) => _api.getTransactions(
    customerId: customerId,
    driverId: driverId,
    restaurantId: restaurantId,
    transactionType: transactionType,
    orderId: orderId,
    offset: offset,
    limit: limit,
  );
 
  Future<NetworkResponse<RequestPaymentIntentResponse>> createTopupPaymentIntent({
    String? customerId,
    String? driverId,
    int? amount,
  }) => _api.createTopupPaymentIntent(
    customerId: customerId,
    driverId: driverId,
    amount: amount,
  );

  Future<NetworkResponse<WalletWithdrawRequestResponse>> createWithdrawRequest({
    String? customerId,
    String? driverId,
    int? restaurantId,
    required int amount,
    String? method,
  }) => _api.createWithdrawRequest(
    customerId: customerId,
    driverId: driverId,
    restaurantId: restaurantId,
    amount: amount,
    method: method,
  );

  Future<NetworkResponse<ListResponse<WalletWithdrawRequestResponse>>>
  getWithdrawals({
    String? customerId,
    String? driverId,
    int? restaurantId,
    String? status,
    int? offset,
    int? limit,
  }) => _api.getWithdrawals(
    customerId: customerId,
    driverId: driverId,
    restaurantId: restaurantId,
    status: status,
    offset: offset,
    limit: limit,
  );

  // Admin APIs (yêu cầu authentication)
  Future<NetworkResponse<WalletResponse>> getSystemWallet() =>
      _api.getSystemWallet();

  Future<NetworkResponse<ListResponse<WalletTransactionResponse>>>
  getAllTransactionsAdmin({
    String? orderId,
    String? customerId,
    String? driverId,
    int? restaurantId,
    String? transactionType,
    int? offset,
    int? limit,
  }) => _api.getAllTransactionsAdmin(
    orderId: orderId,
    customerId: customerId,
    driverId: driverId,
    restaurantId: restaurantId,
    transactionType: transactionType,
    offset: offset,
    limit: limit,
  );

  Future<NetworkResponse<ListResponse<WalletWithdrawRequestResponse>>>
  getAllWithdrawalsAdmin({
    String? status,
    String? customerId,
    String? driverId,
    int? restaurantId,
    int? offset,
    int? limit,
  }) => _api.getAllWithdrawalsAdmin(
    status: status,
    customerId: customerId,
    driverId: driverId,
    restaurantId: restaurantId,
    offset: offset,
    limit: limit,
  );

  Future<NetworkResponse<WalletWithdrawRequestResponse>> approveWithdrawal(
    String withdrawId,
  ) => _api.approveWithdrawal(withdrawId);

  Future<NetworkResponse<WalletWithdrawRequestResponse>> rejectWithdrawal(
    String withdrawId,
    String reason,
  ) => _api.rejectWithdrawal(withdrawId, reason);

  Future<NetworkResponse<WalletWithdrawRequestResponse>> markWithdrawalPaid(
    String withdrawId,
  ) => _api.markWithdrawalPaid(withdrawId);
}

