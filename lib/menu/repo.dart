import 'package:internal_network/network_resources/resources.dart';

import '../models/models.dart';
import 'app_api.dart';
import 'models/models.dart';

class MenuRepo {
  MenuRepo._();
  static MenuRepo? _instance;

  factory MenuRepo([MenuApi? api]) {
    _instance ??= MenuRepo._();
    _instance!._api = api ?? MenuApiImpl();
    return _instance!;
  }

  late MenuApi _api;

  // Restaurant menus
  Future<NetworkResponse<MenuResponse>> createRestaurantMenu(
    int restaurantId,
    MenuInput create,
  ) async => _api.createRestaurantMenu(restaurantId, create);

  Future<NetworkResponse<ListResponse<MenuResponse>>> getRestaurantMenus(
    int restaurantId, {
    int offset = 0,
    int limit = 100,
  }) async =>
      _api.getRestaurantMenus(restaurantId, offset: offset, limit: limit);

  Future<NetworkResponse<Map<String, dynamic>>> getRestaurantMenuHierarchy(
    int restaurantId,
  ) async => _api.getRestaurantMenuHierarchy(restaurantId);

  // Individual menu operations
  Future<NetworkResponse<MenuResponse>> getMenu(String menuId) async =>
      _api.getMenu(menuId);

  Future<NetworkResponse<MenuResponse>> updateMenu(
    String menuId,
    MenuInput update,
  ) async => _api.updateMenu(menuId, update);

  Future<NetworkResponse<void>> deleteMenu(String menuId) async =>
      _api.deleteMenu(menuId);

  Future<NetworkResponse<Map<String, dynamic>>> getMenuHierarchy(
    String menuId,
  ) async => _api.getMenuHierarchy(menuId);

  // Menu categories
  Future<NetworkResponse<MenuCategoryResponse>> createMenuCategory(
    String menuId,
    MenuCategoryInput create,
  ) async => _api.createMenuCategory(menuId, create);

  Future<NetworkResponse<ListResponse<MenuCategoryResponse>>> getMenuCategories(
    String menuId, {
    int offset = 0,
    int limit = 100,
  }) async => _api.getMenuCategories(menuId, offset: offset, limit: limit);

  Future<NetworkResponse<MenuCategoryResponse>> getMenuCategory(
    String categoryId,
  ) async => _api.getMenuCategory(categoryId);

  Future<NetworkResponse<MenuCategoryResponse>> updateMenuCategory(
    String categoryId,
    MenuCategoryInput update,
  ) async => _api.updateMenuCategory(categoryId, update);

  Future<NetworkResponse<void>> deleteMenuCategory(String categoryId) async =>
      _api.deleteMenuCategory(categoryId);

  // Menu items
  Future<NetworkResponse<MenuItemResponse>> createMenuItem(
    String categoryId,
    MenuItemInput create,
  ) async => _api.createMenuItem(categoryId, create);

  Future<NetworkResponse<MenuItemResponse>> getMenuItem(String itemId) async =>
      _api.getMenuItem(itemId);

  Future<NetworkResponse<MenuItemResponse>> updateMenuItem(
    String itemId,
    MenuItemInput update,
  ) async => _api.updateMenuItem(itemId, update);

  Future<NetworkResponse<void>> deleteMenuItem(String itemId) async =>
      _api.deleteMenuItem(itemId);

  // Menu item variants
  Future<NetworkResponse<MenuItemVariantResponse>> createMenuItemVariant(
    String itemId,
    MenuItemVariantInput create,
  ) async => _api.createMenuItemVariant(itemId, create);

  Future<NetworkResponse<ListResponse<MenuItemVariantResponse>>>
  getMenuItemVariants(String itemId, {int offset = 0, int limit = 100}) async =>
      _api.getMenuItemVariants(itemId, offset: offset, limit: limit);

  Future<NetworkResponse<MenuItemVariantResponse>> getMenuItemVariant(
    String variantId,
  ) async => _api.getMenuItemVariant(variantId);

  Future<NetworkResponse<MenuItemVariantResponse>> updateMenuItemVariant(
    String variantId,
    MenuItemVariantInput update,
  ) async => _api.updateMenuItemVariant(variantId, update);

  Future<NetworkResponse<void>> deleteMenuItemVariant(String variantId) async =>
      _api.deleteMenuItemVariant(variantId);

  // Menu item variant values
  Future<NetworkResponse<MenuItemVariantValueResponse>>
  createMenuItemVariantValue(
    String variantId,
    MenuItemVariantValueInput create,
  ) async => _api.createMenuItemVariantValue(variantId, create);

  Future<NetworkResponse<ListResponse<MenuItemVariantValueResponse>>>
  getMenuItemVariantValues(
    String variantId, {
    int offset = 0,
    int limit = 100,
  }) async =>
      _api.getMenuItemVariantValues(variantId, offset: offset, limit: limit);

  Future<NetworkResponse<MenuItemVariantValueResponse>> getMenuItemVariantValue(
    String valueId,
  ) async => _api.getMenuItemVariantValue(valueId);

  Future<NetworkResponse<MenuItemVariantValueResponse>>
  updateMenuItemVariantValue(
    String valueId,
    MenuItemVariantValueInput update,
  ) async => _api.updateMenuItemVariantValue(valueId, update);

  Future<NetworkResponse<void>> deleteMenuItemVariantValue(
    String valueId,
  ) async => _api.deleteMenuItemVariantValue(valueId);

  // Menu item options
  Future<NetworkResponse<MenuItemOptionResponse>> createMenuItemOption(
    String itemId,
    MenuItemOptionInput create,
  ) async => _api.createMenuItemOption(itemId, create);

  Future<NetworkResponse<ListResponse<MenuItemOptionResponse>>>
  getMenuItemOptions(String itemId, {int offset = 0, int limit = 100}) async =>
      _api.getMenuItemOptions(itemId, offset: offset, limit: limit);

  Future<NetworkResponse<MenuItemOptionResponse>> getMenuItemOption(
    String optionId,
  ) async => _api.getMenuItemOption(optionId);

  Future<NetworkResponse<MenuItemOptionResponse>> updateMenuItemOption(
    String optionId,
    MenuItemOptionInput update,
  ) async => _api.updateMenuItemOption(optionId, update);

  Future<NetworkResponse<void>> deleteMenuItemOption(String optionId) async =>
      _api.deleteMenuItemOption(optionId);

  // Menu item option values
  Future<NetworkResponse<MenuItemOptionValueResponse>>
  createMenuItemOptionValue(
    String optionId,
    MenuItemOptionValueInput create,
  ) async => _api.createMenuItemOptionValue(optionId, create);

  Future<NetworkResponse<ListResponse<MenuItemOptionValueResponse>>>
  getMenuItemOptionValues(
    String optionId, {
    int offset = 0,
    int limit = 100,
  }) async =>
      _api.getMenuItemOptionValues(optionId, offset: offset, limit: limit);

  Future<NetworkResponse<MenuItemOptionValueResponse>> getMenuItemOptionValue(
    String valueId,
  ) async => _api.getMenuItemOptionValue(valueId);

  Future<NetworkResponse<MenuItemOptionValueResponse>>
  updateMenuItemOptionValue(
    String valueId,
    MenuItemOptionValueInput update,
  ) async => _api.updateMenuItemOptionValue(valueId, update);

  Future<NetworkResponse<void>> deleteMenuItemOptionValue(
    String valueId,
  ) async => _api.deleteMenuItemOptionValue(valueId);

  // Menu item translations
  Future<NetworkResponse<MenuItemTranslationResponse>>
  createMenuItemTranslation(
    String itemId,
    MenuItemTranslationCreate create,
  ) async => _api.createMenuItemTranslation(itemId, create);

  Future<NetworkResponse<ListResponse<MenuItemTranslationResponse>>>
  getMenuItemTranslations(
    String itemId, {
    int offset = 0,
    int limit = 100,
  }) async =>
      _api.getMenuItemTranslations(itemId, offset: offset, limit: limit);

  Future<NetworkResponse<MenuItemTranslationResponse>> getMenuItemTranslation(
    String translationId,
  ) async => _api.getMenuItemTranslation(translationId);

  Future<NetworkResponse<MenuItemTranslationResponse>>
  updateMenuItemTranslation(
    String translationId,
    MenuItemTranslationUpdate update,
  ) async => _api.updateMenuItemTranslation(translationId, update);

  Future<NetworkResponse<void>> deleteMenuItemTranslation(
    String translationId,
  ) async => _api.deleteMenuItemTranslation(translationId);

  // Customer APIs
  Future<NetworkResponse<ListResponse<MenuItemResponse>>> getMenuItemsCustomer({
    double? lat,
    double? lng,
    MenuItemSortBy? sortBy,
    int? restaurantId,
    List<int>? cuisineTypeIds, // Danh sách ID loại ẩm thực (có thể null)
    List<String>?
    cuisineTypeStrings, // Danh sách tên loại ẩm thực để tìm kiếm (có thể null)
    bool? isAvailable,
    double? minRating,
    double? maxDistance,
    String? search,
    int? limit,
    int? offset,
    RestaurantResponseOptions? responseOptions,
    bool? isActive,
    bool? isOpen,
    bool? isFeatured,
  }) => _api.getMenuItemsCustomer(
    lat: lat,
    lng: lng,
    sortBy: sortBy,
    restaurantId: restaurantId,
    cuisineTypeIds: cuisineTypeIds,
    cuisineTypeStrings: cuisineTypeStrings,
    isAvailable: isAvailable,
    minRating: minRating,
    maxDistance: maxDistance,
    search: search,
    limit: limit,
    offset: offset,
    responseOptions: responseOptions,
    isActive: isActive,
    isOpen: isOpen,
    isFeatured: isFeatured,
  );

  Future<NetworkResponse<ListResponse<MenuCategoryResponse>>>
  getMenuRestaurantCategories(
    dynamic restaurantId, {
    int offset = 0,
    int limit = 100,
  }) async => _api.getMenuRestaurantCategories(
    restaurantId,
    offset: offset,
    limit: limit,
  );
}
