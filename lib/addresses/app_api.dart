import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';

import '../models/list_response.dart';
import 'models/models.dart';

class _AddressesEndpoint {
  _AddressesEndpoint._();

  static String base() => "/api/v1/addresses/";
  static String byId(String addressId) => "/api/v1/addresses/$addressId";
}

abstract class AddressesApi {
  Future<NetworkResponse<AddressResponse>> createAddress(AddressCreate create);

  Future<NetworkResponse<ListResponse<AddressResponse>>> getAllAddresses({
    String? refType,
    String? refId,
    int limit = 10,
    int offset = 0,
  });

  Future<NetworkResponse<AddressResponse>> getAddress(String addressId);

  Future<NetworkResponse<AddressResponse>> updateAddress(
    String addressId,
    AddressCreate update,
  );

  Future<NetworkResponse<void>> deleteAddress(String addressId);
}

class AddressesApiImpl extends AddressesApi {
  @override
  Future<NetworkResponse<AddressResponse>> createAddress(
    AddressCreate create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_AddressesEndpoint.base(), data: create.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => AddressResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<AddressResponse>>> getAllAddresses({
    String? refType,
    String? refId,
    int limit = 10,
    int offset = 0,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'limit': limit, 'offset': offset};
        void put(String k, dynamic v) {
          if (v != null) params[k] = v;
        }

        put('ref_type', refType);
        put('ref_id', refId);

        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_AddressesEndpoint.base(), queryParameters: params);

        return NetworkResponse.fromResponse(
          response,
          converter: (json) {
            return ListResponse<AddressResponse>.fromJson(
              json,
              (item) => AddressResponse.fromJson(item as Map<String, dynamic>),
            );
          },
        );
      },
    );
  }

  @override
  Future<NetworkResponse<AddressResponse>> getAddress(String addressId) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_AddressesEndpoint.byId(addressId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => AddressResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<AddressResponse>> updateAddress(
    String addressId,
    AddressCreate update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(_AddressesEndpoint.byId(addressId), data: update.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => AddressResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteAddress(String addressId) async {
    return await handleNetworkError(
      proccess: () async {
        final response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_AddressesEndpoint.byId(addressId));
        return NetworkResponse.fromResponse(response, converter: (_) => null);
      },
    );
  }
}
