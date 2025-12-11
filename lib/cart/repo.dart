import 'package:internal_core/network/network_resources/resources.dart';

import 'app_api.dart';
import 'models/models.dart';

class CartRepo {
  CartRepo._();
  static CartRepo? _instance;

  factory CartRepo([CartApi? api]) {
    _instance ??= CartRepo._();
    _instance!._api = api ?? CartApiImpl();
    return _instance!;
  }

  late CartApi _api;

  // Cart operations
  Future<NetworkResponse<List<CartModel>>> getMyCarts() => _api.getMyCarts();

  Future<NetworkResponse<CartItemModel>> addItemToCart(
    CartItemAddRequest request,
  ) => _api.addItemToCart(request);

  Future<NetworkResponse<CartItemModel>> updateCartItem(
    CartItemUpdateRequest request,
  ) => _api.updateCartItem(request);
}
