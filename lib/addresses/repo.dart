import 'package:internal_network/network_resources/resources.dart';

import 'app_api.dart';
import 'models/models.dart';
import '../models/models.dart';

class AddressesRepo {
  AddressesRepo._();
  static AddressesRepo? _instance;

  factory AddressesRepo([AddressesApi? api]) {
    _instance ??= AddressesRepo._();
    _instance!._api = api ?? AddressesApiImpl();
    return _instance!;
  }

  late AddressesApi _api;

  Future<NetworkResponse<AddressResponse>> createAddress(
          AddressCreate create) =>
      _api.createAddress(create);

  Future<NetworkResponse<ListResponse<AddressResponse>>> getAllAddresses({
    String? refType,
    String? refId,
    int limit = 10,
    int offset = 0,
  }) =>
      _api.getAllAddresses(
        refType: refType,
        refId: refId,
        limit: limit,
        offset: offset,
      );

  Future<NetworkResponse<AddressResponse>> getAddress(String addressId) =>
      _api.getAddress(addressId);

  Future<NetworkResponse<AddressResponse>> updateAddress(
          String addressId, AddressCreate update) =>
      _api.updateAddress(addressId, update);

  Future<NetworkResponse<void>> deleteAddress(String addressId) =>
      _api.deleteAddress(addressId);
}
