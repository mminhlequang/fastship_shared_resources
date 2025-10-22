/// Model for wallet response matching new backend schema
class WalletResponse {
  String? id;
  String? customerId;
  String? driverId;
  String? restaurantId;
  bool? isSystemWallet;
  double? balance;
  String? currency;
  DateTime? createdAt;
  DateTime? updatedAt;

  WalletResponse({
    this.id,
    this.customerId,
    this.driverId,
    this.restaurantId,
    this.isSystemWallet,
    this.balance,
    this.currency,
    this.createdAt,
    this.updatedAt,
  });

  factory WalletResponse.fromJson(Map<String, dynamic> json) {
    return WalletResponse(
      id: json['id'] as String?,
      customerId: json['customer_id']?.toString(),
      driverId: json['driver_id']?.toString(),
      restaurantId: json['restaurant_id']?.toString(),
      isSystemWallet: json['is_system_wallet'] as bool?,
      balance: json['balance'] != null
          ? (json['balance'] is num
              ? (json['balance'] as num).toDouble()
              : double.tryParse(json['balance'].toString()))
          : null,
      currency: json['currency'] as String?,
      createdAt: json['created_at'] != null
          ? (json['created_at'] is String
              ? DateTime.tryParse(json['created_at'])
              : null)
          : null,
      updatedAt: json['updated_at'] != null
          ? (json['updated_at'] is String
              ? DateTime.tryParse(json['updated_at'])
              : null)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer_id': customerId,
      'driver_id': driverId,
      'restaurant_id': restaurantId,
      'is_system_wallet': isSystemWallet,
      'balance': balance,
      'currency': currency,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
 
/// Model for wallet transaction response (unchanged)
class WalletTransactionResponse {
  String? id;
  String? walletId;
  String? type;
  String? direction;
  double? amount;
  String? currency;
  String? method;
  String? refId;
  Map<String, dynamic>? metaData;
  DateTime? createdAt;
  DateTime? updatedAt;

  WalletTransactionResponse({
    this.id,
    this.walletId,
    this.type,
    this.direction,
    this.amount,
    this.currency,
    this.method,
    this.refId,
    this.metaData,
    this.createdAt,
    this.updatedAt,
  });

  factory WalletTransactionResponse.fromJson(Map<String, dynamic> json) {
    return WalletTransactionResponse(
      id: json['id'] as String?,
      walletId: json['wallet_id'] as String?,
      type: json['type'] as String?,
      direction: json['direction'] as String?,
      amount: json['amount'] != null ? (json['amount'] as num).toDouble() : null,
      currency: json['currency'] as String?,
      method: json['method'] as String?,
      refId: json['ref_id'] as String?,
      metaData: json['meta_data'] as Map<String, dynamic>?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'wallet_id': walletId,
      'type': type,
      'direction': direction,
      'amount': amount,
      'currency': currency,
      'method': method,
      'ref_id': refId,
      'meta_data': metaData,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  String get description {
    if (metaData != null && metaData!['description'] != null) {
      return metaData!['description'] as String;
    }
    final directionText = direction == 'in' ? 'Income' : 'Expense';
    switch (type?.toLowerCase()) {
      case 'topup':
        return 'Wallet top-up via $method';
      case 'withdrawal':
        return 'Withdrawal via $method';
      case 'order_payment':
        return 'Order payment';
      case 'bonus':
        return 'Bonus payment';
      case 'refund':
        return 'Refund';
      case 'fee':
        return 'Service fee';
      default:
        return '$directionText transaction';
    }
  }

  String get status => 'completed';
}

/// Model cho wallet withdraw request response (unchanged)
class WalletWithdrawRequestResponse {
  String? id;
  String? walletId;
  double? amount;
  String? currency;
  String? method;
  String? status;
  String? reason;
  DateTime? createdAt;
  DateTime? updatedAt;

  WalletWithdrawRequestResponse({
    this.id,
    this.walletId,
    this.amount,
    this.currency,
    this.method,
    this.status,
    this.reason,
    this.createdAt,
    this.updatedAt,
  });

  factory WalletWithdrawRequestResponse.fromJson(Map<String, dynamic> json) {
    return WalletWithdrawRequestResponse(
      id: json['id'] as String?,
      walletId: json['wallet_id'] as String?,
      amount: json['amount'] != null ? (json['amount'] as num).toDouble() : null,
      currency: json['currency'] as String?,
      method: json['method'] as String?,
      status: json['status'] as String?,
      reason: json['reason'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'wallet_id': walletId,
      'amount': amount,
      'currency': currency,
      'method': method,
      'status': status,
      'reason': reason,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

/// Payment Intent Data Model (unchanged)
class RequestPaymentIntentResponse {
  final String clientSecret;
  final String paymentIntentId;
  final int amount;
  final String currency;
  final String walletId;

  RequestPaymentIntentResponse({
    required this.clientSecret,
    required this.paymentIntentId,
    required this.amount,
    required this.currency,
    required this.walletId,
  });

  factory RequestPaymentIntentResponse.fromJson(Map<String, dynamic> response) {
    return RequestPaymentIntentResponse(
      clientSecret: response['client_secret'] ?? '',
      paymentIntentId: response['payment_intent_id'] ?? '',
      amount: response['amount'] ?? 0,
      currency: response['currency'] ?? 'HUF',
      walletId: response['wallet_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'client_secret': clientSecret,
      'payment_intent_id': paymentIntentId,
      'amount': amount,
      'currency': currency,
      'wallet_id': walletId,
    };
  }
}
