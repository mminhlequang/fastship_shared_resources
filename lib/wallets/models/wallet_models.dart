/// Model cho wallet response
class WalletResponse {
  String? id;
  String? userId;
  String? userType;
  double? balance;
  String? currency;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  WalletResponse({
    this.id,
    this.userId,
    this.userType,
    this.balance,
    this.currency,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory WalletResponse.fromJson(Map<String, dynamic> json) {
    return WalletResponse(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      userType: json['user_type'] as String?,
      balance:
          json['balance'] != null ? (json['balance'] as num).toDouble() : null,
      currency: json['currency'] as String?,
      isActive: json['is_active'] as bool?,
      createdAt:
          json['created_at'] != null
              ? DateTime.parse(json['created_at'] as String)
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.parse(json['updated_at'] as String)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'user_type': userType,
      'balance': balance,
      'currency': currency,
      'is_active': isActive,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

/// Model cho wallet balance response
class WalletBalanceResponse {
  double? balance;
  String? currency;
  double? pendingBalance;
  double? availableBalance;

  WalletBalanceResponse({
    this.balance,
    this.currency,
    this.pendingBalance,
    this.availableBalance,
  });

  factory WalletBalanceResponse.fromJson(Map<String, dynamic> json) {
    return WalletBalanceResponse(
      balance:
          json['balance'] != null ? (json['balance'] as num).toDouble() : null,
      currency: json['currency'] as String?,
      pendingBalance:
          json['pending_balance'] != null
              ? (json['pending_balance'] as num).toDouble()
              : null,
      availableBalance:
          json['available_balance'] != null
              ? (json['available_balance'] as num).toDouble()
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
      'currency': currency,
      'pending_balance': pendingBalance,
      'available_balance': availableBalance,
    };
  }
}

/// Model cho wallet transaction response
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
      amount:
          json['amount'] != null ? (json['amount'] as num).toDouble() : null,
      currency: json['currency'] as String?,
      method: json['method'] as String?,
      refId: json['ref_id'] as String?,
      metaData: json['meta_data'] as Map<String, dynamic>?,
      createdAt:
          json['created_at'] != null
              ? DateTime.parse(json['created_at'] as String)
              : null,
      updatedAt:
          json['updated_at'] != null
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

  /// Lấy description từ meta_data hoặc tạo description mặc định
  String get description {
    if (metaData != null && metaData!['description'] != null) {
      return metaData!['description'] as String;
    }

    // Tạo description mặc định dựa trên type và direction
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

  /// Lấy status mặc định (completed cho tất cả transactions)
  String get status => 'completed';
}

/// Model cho wallet withdraw request response
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
      amount:
          json['amount'] != null ? (json['amount'] as num).toDouble() : null,
      currency: json['currency'] as String?,
      method: json['method'] as String?,
      status: json['status'] as String?,
      reason: json['reason'] as String?,
      createdAt:
          json['created_at'] != null
              ? DateTime.parse(json['created_at'] as String)
              : null,
      updatedAt:
          json['updated_at'] != null
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

/// Payment Intent Data Model
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

  /// Factory constructor to create an instance from a response map
  factory RequestPaymentIntentResponse.fromJson(Map<String, dynamic> response) {
    return RequestPaymentIntentResponse(
      clientSecret: response['client_secret'] ?? '',
      paymentIntentId: response['payment_intent_id'] ?? '',
      amount: response['amount'] ?? 0,
      currency: response['currency'] ?? 'HUF',
      walletId: response['wallet_id'] ?? '',
    );
  }

  /// Convert the instance to JSON map
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
