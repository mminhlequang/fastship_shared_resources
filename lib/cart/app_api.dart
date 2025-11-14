import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';

import 'models/models.dart';

class _CartEndpoint {
  _CartEndpoint._();

  // Cart APIs
  static String myCarts() => "/api/v1/cart/my-carts";
  static String addItem() => "/api/v1/cart/add-item";
  static String updateItem() => "/api/v1/cart/update-item";
}

abstract class CartApi {
  // Cart operations
  Future<NetworkResponse<List<CartModel>>> getMyCarts();
  Future<NetworkResponse<CartItemModel>> addItemToCart(
    CartItemAddRequest request,
  );
  Future<NetworkResponse<CartItemModel>> updateCartItem(
    CartItemUpdateRequest request,
  );
}

class CartApiImpl extends CartApi {
  @override
  Future<NetworkResponse<List<CartModel>>> getMyCarts() async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_CartEndpoint.myCarts());
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) =>
                  (json as List).map((e) => CartModel.fromJson(e)).toList(),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<CartItemModel>> addItemToCart(
    CartItemAddRequest request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_CartEndpoint.addItem(), data: request.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CartItemModel.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<CartItemModel>> updateCartItem(
    CartItemUpdateRequest request,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(_CartEndpoint.updateItem(), data: request.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => CartItemModel.fromJson(json),
        );
      },
    );
  }
}
