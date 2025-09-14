import 'package:internal_core/internal_core.dart';
import 'package:internal_network/internal_network.dart';
import 'package:internal_network/network_resources/resources.dart';
import 'package:dio/dio.dart';

import '../models/models.dart';
import 'models/models.dart';

class _MenuEndpoint {
  _MenuEndpoint._();

  // Restaurant menus
  static String restaurantMenus(int restaurantId) =>
      "/api/v1/menu/restaurants/$restaurantId/menus";
  static String restaurantMenuHierarchy(int restaurantId) =>
      "/api/v1/menu/restaurants/$restaurantId/menu-hierarchy";

  // Individual menu operations
  static String menu(String menuId) => "/api/v1/menu/menus/$menuId";
  static String menuHierarchy(String menuId) =>
      "/api/v1/menu/menus/$menuId/hierarchy";

  // Menu categories
  static String menuCategories(String menuId) =>
      "/api/v1/menu/menus/$menuId/categories";
  static String menuCategory(String categoryId) =>
      "/api/v1/menu/categories/$categoryId";

  // Menu items
  static String menuItems(String categoryId) =>
      "/api/v1/menu/categories/$categoryId/items";
  static String menuItem(String itemId) => "/api/v1/menu/items/$itemId";

  // Menu item variants
  static String menuItemVariants(String itemId) =>
      "/api/v1/menu/items/$itemId/variants";
  static String menuItemVariant(String variantId) =>
      "/api/v1/menu/variants/$variantId";

  // Menu item variant values
  static String menuItemVariantValues(String variantId) =>
      "/api/v1/menu/variants/$variantId/values";
  static String menuItemVariantValue(String valueId) =>
      "/api/v1/menu/variant-values/$valueId";

  // Menu item options
  static String menuItemOptions(String itemId) =>
      "/api/v1/menu/items/$itemId/options";
  static String menuItemOption(String optionId) =>
      "/api/v1/menu/options/$optionId";

  // Menu item option values
  static String menuItemOptionValues(String optionId) =>
      "/api/v1/menu/options/$optionId/values";
  static String menuItemOptionValue(String valueId) =>
      "/api/v1/menu/option-values/$valueId";

  // Menu item translations
  static String menuItemTranslations(String itemId) =>
      "/api/v1/menu/items/$itemId/translations";
  static String menuItemTranslation(String translationId) =>
      "/api/v1/menu/translations/$translationId";

  // Customer APIs
  static String customerMenuItems() => "/api/v1/customer/menu/items";
  static String menuRestaurantCategories(dynamic restaurantId) =>
      "/api/v1/customer/menu/restaurants/$restaurantId/categories";
}

abstract class MenuApi {
  // Restaurant menus
  Future<NetworkResponse<MenuResponse>> createRestaurantMenu(
    int restaurantId,
    MenuInput create,
  );
  Future<NetworkResponse<ListResponse<MenuResponse>>> getRestaurantMenus(
    int restaurantId, {
    int offset,
    int limit,
  });
  Future<NetworkResponse<Map<String, dynamic>>> getRestaurantMenuHierarchy(
    int restaurantId,
  );

  // Individual menu operations
  Future<NetworkResponse<MenuResponse>> getMenu(String menuId);
  Future<NetworkResponse<MenuResponse>> updateMenu(
    String menuId,
    MenuInput update,
  );
  Future<NetworkResponse<void>> deleteMenu(String menuId);
  Future<NetworkResponse<Map<String, dynamic>>> getMenuHierarchy(String menuId);

  // Menu categories
  Future<NetworkResponse<MenuCategoryResponse>> createMenuCategory(
    String menuId,
    MenuCategoryInput create,
  );
  Future<NetworkResponse<ListResponse<MenuCategoryResponse>>> getMenuCategories(
    String menuId, {
    int offset,
    int limit,
  });
  Future<NetworkResponse<MenuCategoryResponse>> getMenuCategory(
    String categoryId,
  );
  Future<NetworkResponse<MenuCategoryResponse>> updateMenuCategory(
    String categoryId,
    MenuCategoryInput update,
  );
  Future<NetworkResponse<void>> deleteMenuCategory(String categoryId);

  // Menu items
  Future<NetworkResponse<MenuItemResponse>> createMenuItem(
    String categoryId,
    MenuItemInput create,
  );
  Future<NetworkResponse<ListResponse<MenuItemResponse>>> getMenuItems(
    String categoryId, {
    int offset,
    int limit,
  });
  Future<NetworkResponse<MenuItemResponse>> getMenuItem(String itemId);
  Future<NetworkResponse<MenuItemResponse>> updateMenuItem(
    String itemId,
    MenuItemInput update,
  );
  Future<NetworkResponse<void>> deleteMenuItem(String itemId);

  // Menu item variants
  Future<NetworkResponse<MenuItemVariantResponse>> createMenuItemVariant(
    String itemId,
    MenuItemVariantInput create,
  );
  Future<NetworkResponse<ListResponse<MenuItemVariantResponse>>>
  getMenuItemVariants(String itemId, {int offset, int limit});
  Future<NetworkResponse<MenuItemVariantResponse>> getMenuItemVariant(
    String variantId,
  );
  Future<NetworkResponse<MenuItemVariantResponse>> updateMenuItemVariant(
    String variantId,
    MenuItemVariantInput update,
  );
  Future<NetworkResponse<void>> deleteMenuItemVariant(String variantId);

  // Menu item variant values
  Future<NetworkResponse<MenuItemVariantValueResponse>>
  createMenuItemVariantValue(
    String variantId,
    MenuItemVariantValueInput create,
  );
  Future<NetworkResponse<ListResponse<MenuItemVariantValueResponse>>>
  getMenuItemVariantValues(String variantId, {int offset, int limit});
  Future<NetworkResponse<MenuItemVariantValueResponse>> getMenuItemVariantValue(
    String valueId,
  );
  Future<NetworkResponse<MenuItemVariantValueResponse>>
  updateMenuItemVariantValue(String valueId, MenuItemVariantValueInput update);
  Future<NetworkResponse<void>> deleteMenuItemVariantValue(String valueId);

  // Menu item options
  Future<NetworkResponse<MenuItemOptionResponse>> createMenuItemOption(
    String itemId,
    MenuItemOptionInput create,
  );
  Future<NetworkResponse<ListResponse<MenuItemOptionResponse>>>
  getMenuItemOptions(String itemId, {int offset, int limit});
  Future<NetworkResponse<MenuItemOptionResponse>> getMenuItemOption(
    String optionId,
  );
  Future<NetworkResponse<MenuItemOptionResponse>> updateMenuItemOption(
    String optionId,
    MenuItemOptionInput update,
  );
  Future<NetworkResponse<void>> deleteMenuItemOption(String optionId);

  // Menu item option values
  Future<NetworkResponse<MenuItemOptionValueResponse>>
  createMenuItemOptionValue(String optionId, MenuItemOptionValueInput create);
  Future<NetworkResponse<ListResponse<MenuItemOptionValueResponse>>>
  getMenuItemOptionValues(String optionId, {int offset, int limit});
  Future<NetworkResponse<MenuItemOptionValueResponse>> getMenuItemOptionValue(
    String valueId,
  );
  Future<NetworkResponse<MenuItemOptionValueResponse>>
  updateMenuItemOptionValue(String valueId, MenuItemOptionValueInput update);
  Future<NetworkResponse<void>> deleteMenuItemOptionValue(String valueId);

  // Menu item translations
  Future<NetworkResponse<MenuItemTranslationResponse>>
  createMenuItemTranslation(String itemId, MenuItemTranslationCreate create);
  Future<NetworkResponse<ListResponse<MenuItemTranslationResponse>>>
  getMenuItemTranslations(String itemId, {int offset, int limit});
  Future<NetworkResponse<MenuItemTranslationResponse>> getMenuItemTranslation(
    String translationId,
  );
  Future<NetworkResponse<MenuItemTranslationResponse>>
  updateMenuItemTranslation(
    String translationId,
    MenuItemTranslationUpdate update,
  );
  Future<NetworkResponse<void>> deleteMenuItemTranslation(String translationId);

  // Customer APIs
  Future<NetworkResponse<ListResponse<MenuItemResponse>>> getMenuItemsCustomer({
    double? lat,
    double? lng,
    MenuItemSortBy? sortBy,
    int? restaurantId,
    List<int>? cuisineTypeIds, // Danh sách ID loại ẩm thực (có thể null)
    List<String>? cuisineTypeStrings, // Danh sách tên loại ẩm thực để tìm kiếm (có thể null)
    bool? isAvailable,
    double? minRating,
    double? maxDistance,
    String? search,
    int? limit,
    int? offset,
  });
  Future<NetworkResponse<ListResponse<MenuCategoryResponse>>>
  getMenuRestaurantCategories(
    dynamic restaurantId, {
    int offset = 0,
    int limit = 100,
  });
}

class MenuApiImpl extends MenuApi {
  // Restaurant menus
  @override
  Future<NetworkResponse<MenuResponse>> createRestaurantMenu(
    int restaurantId,
    MenuInput create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Map data = create.toJson();
        data['restaurant_id'] = restaurantId;
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_MenuEndpoint.restaurantMenus(restaurantId), data: data);
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<MenuResponse>>> getRestaurantMenus(
    int restaurantId, {
    int offset = 0,
    int limit = 100,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _MenuEndpoint.restaurantMenus(restaurantId),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => MenuResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<Map<String, dynamic>>> getRestaurantMenuHierarchy(
    int restaurantId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_MenuEndpoint.restaurantMenuHierarchy(restaurantId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => json as Map<String, dynamic>,
        );
      },
    );
  }

  // Individual menu operations
  @override
  Future<NetworkResponse<MenuResponse>> getMenu(String menuId) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_MenuEndpoint.menu(menuId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<MenuResponse>> updateMenu(
    String menuId,
    MenuInput update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(_MenuEndpoint.menu(menuId), data: update.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteMenu(String menuId) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_MenuEndpoint.menu(menuId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => null,
        );
      },
    );
  }

  @override
  Future<NetworkResponse<Map<String, dynamic>>> getMenuHierarchy(
    String menuId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_MenuEndpoint.menuHierarchy(menuId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => json as Map<String, dynamic>,
        );
      },
    );
  }

  // Menu categories
  @override
  Future<NetworkResponse<MenuCategoryResponse>> createMenuCategory(
    String menuId,
    MenuCategoryInput create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_MenuEndpoint.menuCategories(menuId), data: create.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuCategoryResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<MenuCategoryResponse>>> getMenuCategories(
    String menuId, {
    int offset = 0,
    int limit = 100,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_MenuEndpoint.menuCategories(menuId), queryParameters: params);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => MenuCategoryResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<MenuCategoryResponse>> getMenuCategory(
    String categoryId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_MenuEndpoint.menuCategory(categoryId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuCategoryResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<MenuCategoryResponse>> updateMenuCategory(
    String categoryId,
    MenuCategoryInput update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(_MenuEndpoint.menuCategory(categoryId), data: update.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuCategoryResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteMenuCategory(String categoryId) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_MenuEndpoint.menuCategory(categoryId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => null,
        );
      },
    );
  }

  // Menu items
  @override
  Future<NetworkResponse<MenuItemResponse>> createMenuItem(
    String categoryId,
    MenuItemInput create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_MenuEndpoint.menuItems(categoryId), data: create.toFormData());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<MenuItemResponse>>> getMenuItems(
    String categoryId, {
    int offset = 0,
    int limit = 100,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_MenuEndpoint.menuItems(categoryId), queryParameters: params);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => MenuItemResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<MenuItemResponse>> getMenuItem(String itemId) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_MenuEndpoint.menuItem(itemId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<MenuItemResponse>> updateMenuItem(
    String itemId,
    MenuItemInput update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(_MenuEndpoint.menuItem(itemId), data: update.toFormData());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteMenuItem(String itemId) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_MenuEndpoint.menuItem(itemId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => null,
        );
      },
    );
  }

  // Menu item variants
  @override
  Future<NetworkResponse<MenuItemVariantResponse>> createMenuItemVariant(
    String itemId,
    MenuItemVariantInput create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_MenuEndpoint.menuItemVariants(itemId), data: create.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemVariantResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<MenuItemVariantResponse>>>
  getMenuItemVariants(String itemId, {int offset = 0, int limit = 100}) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_MenuEndpoint.menuItemVariants(itemId), queryParameters: params);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => MenuItemVariantResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<MenuItemVariantResponse>> getMenuItemVariant(
    String variantId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_MenuEndpoint.menuItemVariant(variantId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemVariantResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<MenuItemVariantResponse>> updateMenuItemVariant(
    String variantId,
    MenuItemVariantInput update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(_MenuEndpoint.menuItemVariant(variantId), data: update.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemVariantResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteMenuItemVariant(String variantId) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_MenuEndpoint.menuItemVariant(variantId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => null,
        );
      },
    );
  }

  // Menu item variant values - Sử dụng models mới
  @override
  Future<NetworkResponse<MenuItemVariantValueResponse>>
  createMenuItemVariantValue(
    String variantId,
    MenuItemVariantValueInput create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _MenuEndpoint.menuItemVariantValues(variantId),
          data: create.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemVariantValueResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<MenuItemVariantValueResponse>>>
  getMenuItemVariantValues(
    String variantId, {
    int offset = 0,
    int limit = 100,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _MenuEndpoint.menuItemVariantValues(variantId),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => MenuItemVariantValueResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<MenuItemVariantValueResponse>> getMenuItemVariantValue(
    String valueId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_MenuEndpoint.menuItemVariantValue(valueId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemVariantValueResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<MenuItemVariantValueResponse>>
  updateMenuItemVariantValue(
    String valueId,
    MenuItemVariantValueInput update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _MenuEndpoint.menuItemVariantValue(valueId),
          data: update.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemVariantValueResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteMenuItemVariantValue(
    String valueId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_MenuEndpoint.menuItemVariantValue(valueId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => null,
        );
      },
    );
  }

  // Menu item options
  @override
  Future<NetworkResponse<MenuItemOptionResponse>> createMenuItemOption(
    String itemId,
    MenuItemOptionInput create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(_MenuEndpoint.menuItemOptions(itemId), data: create.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemOptionResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<MenuItemOptionResponse>>>
  getMenuItemOptions(String itemId, {int offset = 0, int limit = 100}) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_MenuEndpoint.menuItemOptions(itemId), queryParameters: params);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => MenuItemOptionResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<MenuItemOptionResponse>> getMenuItemOption(
    String optionId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_MenuEndpoint.menuItemOption(optionId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemOptionResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<MenuItemOptionResponse>> updateMenuItemOption(
    String optionId,
    MenuItemOptionInput update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(_MenuEndpoint.menuItemOption(optionId), data: update.toJson());
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemOptionResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteMenuItemOption(String optionId) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_MenuEndpoint.menuItemOption(optionId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => null,
        );
      },
    );
  }

  // Menu item option values - Sử dụng models mới
  @override
  Future<NetworkResponse<MenuItemOptionValueResponse>>
  createMenuItemOptionValue(
    String optionId,
    MenuItemOptionValueInput create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _MenuEndpoint.menuItemOptionValues(optionId),
          data: create.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemOptionValueResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<MenuItemOptionValueResponse>>>
  getMenuItemOptionValues(
    String optionId, {
    int offset = 0,
    int limit = 100,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _MenuEndpoint.menuItemOptionValues(optionId),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => MenuItemOptionValueResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<MenuItemOptionValueResponse>> getMenuItemOptionValue(
    String valueId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_MenuEndpoint.menuItemOptionValue(valueId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemOptionValueResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<MenuItemOptionValueResponse>>
  updateMenuItemOptionValue(
    String valueId,
    MenuItemOptionValueInput update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _MenuEndpoint.menuItemOptionValue(valueId),
          data: update.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemOptionValueResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteMenuItemOptionValue(
    String valueId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_MenuEndpoint.menuItemOptionValue(valueId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => null,
        );
      },
    );
  }

  // Menu item translations
  @override
  Future<NetworkResponse<MenuItemTranslationResponse>>
  createMenuItemTranslation(
    String itemId,
    MenuItemTranslationCreate create,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).post(
          _MenuEndpoint.menuItemTranslations(itemId),
          data: create.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemTranslationResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<MenuItemTranslationResponse>>>
  getMenuItemTranslations(
    String itemId, {
    int offset = 0,
    int limit = 100,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _MenuEndpoint.menuItemTranslations(itemId),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => MenuItemTranslationResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<MenuItemTranslationResponse>> getMenuItemTranslation(
    String translationId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_MenuEndpoint.menuItemTranslation(translationId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemTranslationResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<MenuItemTranslationResponse>>
  updateMenuItemTranslation(
    String translationId,
    MenuItemTranslationUpdate update,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).put(
          _MenuEndpoint.menuItemTranslation(translationId),
          data: update.toJson(),
        );
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => MenuItemTranslationResponse.fromJson(json),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<void>> deleteMenuItemTranslation(
    String translationId,
  ) async {
    return await handleNetworkError(
      proccess: () async {
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).delete(_MenuEndpoint.menuItemTranslation(translationId));
        return NetworkResponse.fromResponse(
          response,
          converter: (json) => null,
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<MenuItemResponse>>> getMenuItemsCustomer({
    double? lat,
    double? lng,
    MenuItemSortBy? sortBy,
    int? restaurantId,
    List<int>? cuisineTypeIds, // Danh sách ID loại ẩm thực (có thể null)
    List<String>? cuisineTypeStrings, // Danh sách tên loại ẩm thực để tìm kiếm (có thể null)
    bool? isAvailable,
    double? minRating,
    double? maxDistance,
    String? search,
    int? limit,
    int? offset,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{};
        if (lat != null) params['lat'] = lat;
        if (lng != null) params['lng'] = lng;
        if (sortBy != null) params['sort_by'] = sortBy.name;
        if (restaurantId != null) params['restaurant_id'] = restaurantId;
        if (cuisineTypeIds != null) params['cuisine_type_ids'] = cuisineTypeIds;
        if (cuisineTypeStrings != null) {
          params['cuisine_type_strings'] = cuisineTypeStrings;
        }
        if (isAvailable != null) params['is_available'] = isAvailable;
        if (minRating != null) params['min_rating'] = minRating;
        if (maxDistance != null) params['max_distance'] = maxDistance;
        if (search != null) params['search'] = search;
        if (limit != null) params['limit'] = limit;
        if (offset != null) params['offset'] = offset;

        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(_MenuEndpoint.customerMenuItems(), queryParameters: params);
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => MenuItemResponse.fromJson(item),
              ),
        );
      },
    );
  }

  @override
  Future<NetworkResponse<ListResponse<MenuCategoryResponse>>>
  getMenuRestaurantCategories(
    dynamic restaurantId, {
    int offset = 0,
    int limit = 100,
  }) async {
    return await handleNetworkError(
      proccess: () async {
        final params = <String, dynamic>{'offset': offset, 'limit': limit};
        Response response = await AppClient(
          token: await appPrefs.getNormalToken(),
        ).get(
          _MenuEndpoint.menuRestaurantCategories(restaurantId),
          queryParameters: params,
        );
        return NetworkResponse.fromResponse(
          response,
          converter:
              (json) => ListResponse.fromJson(
                json,
                (item) => MenuCategoryResponse.fromJson(item),
              ),
        );
      },
    );
  }
}
