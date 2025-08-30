# Menu Repository Documentation

## Tổng quan

Menu Repository cung cấp các API để quản lý menu của nhà hàng, bao gồm:
- Quản lý menu chính
- Quản lý danh mục menu
- Quản lý món ăn
- Quản lý biến thể món ăn
- Quản lý tùy chọn món ăn
- Quản lý bản dịch món ăn

## Import và Export

```dart
// Import toàn bộ menu module
import 'package:fastship_shared_resources/menu/menu.dart';

// Hoặc import từng phần riêng lẻ
import 'package:fastship_shared_resources/menu/app_api.dart';
import 'package:fastship_shared_resources/menu/repo.dart';
import 'package:fastship_shared_resources/menu/models/models.dart';
```

## Cấu trúc API

### Base URL
```
/api/v1/menu
```

## API Endpoints

### 1. Restaurant Menus

#### Tạo menu cho nhà hàng
- **Endpoint**: `POST /api/v1/menu/restaurants/{restaurantId}/menus`
- **Method**: `createRestaurantMenu(restaurantId, create)`
- **Parameters**:
  - `restaurantId` (int): ID của nhà hàng
  - `create` (MenuInput): Dữ liệu tạo menu

#### Lấy danh sách menu của nhà hàng
- **Endpoint**: `GET /api/v1/menu/restaurants/{restaurantId}/menus`
- **Method**: `getRestaurantMenus(restaurantId, {offset, limit})`
- **Parameters**:
  - `restaurantId` (int): ID của nhà hàng
  - `offset` (int, optional): Vị trí bắt đầu (mặc định: 0)
  - `limit` (int, optional): Số lượng item (mặc định: 100)

#### Lấy cấu trúc menu của nhà hàng
- **Endpoint**: `GET /api/v1/menu/restaurants/{restaurantId}/menu-hierarchy`
- **Method**: `getRestaurantMenuHierarchy(restaurantId)`
- **Parameters**:
  - `restaurantId` (int): ID của nhà hàng

### 2. Individual Menu Operations

#### Lấy thông tin menu
- **Endpoint**: `GET /api/v1/menu/menus/{menuId}`
- **Method**: `getMenu(menuId)`
- **Parameters**:
  - `menuId` (String): ID của menu

#### Cập nhật menu
- **Endpoint**: `PUT /api/v1/menu/menus/{menuId}`
- **Method**: `updateMenu(menuId, update)`
- **Parameters**:
  - `menuId` (String): ID của menu
  - `update` (MenuInput): Dữ liệu cập nhật

#### Xóa menu
- **Endpoint**: `DELETE /api/v1/menu/menus/{menuId}`
- **Method**: `deleteMenu(menuId)`
- **Parameters**:
  - `menuId` (String): ID của menu

#### Lấy cấu trúc menu
- **Endpoint**: `GET /api/v1/menu/menus/{menuId}/hierarchy`
- **Method**: `getMenuHierarchy(menuId)`
- **Parameters**:
  - `menuId` (String): ID của menu

### 3. Menu Categories

#### Tạo danh mục menu
- **Endpoint**: `POST /api/v1/menu/menus/{menuId}/categories`
- **Method**: `createMenuCategory(menuId, create)`
- **Parameters**:
  - `menuId` (String): ID của menu
  - `create` (MenuCategoryInput): Dữ liệu tạo danh mục

#### Lấy danh sách danh mục
- **Endpoint**: `GET /api/v1/menu/menus/{menuId}/categories`
- **Method**: `getMenuCategories(menuId, {offset, limit})`
- **Parameters**:
  - `menuId` (String): ID của menu
  - `offset` (int, optional): Vị trí bắt đầu (mặc định: 0)
  - `limit` (int, optional): Số lượng item (mặc định: 100)

#### Lấy thông tin danh mục
- **Endpoint**: `GET /api/v1/menu/categories/{categoryId}`
- **Method**: `getMenuCategory(categoryId)`
- **Parameters**:
  - `categoryId` (String): ID của danh mục

#### Cập nhật danh mục
- **Endpoint**: `PUT /api/v1/menu/categories/{categoryId}`
- **Method**: `updateMenuCategory(categoryId, update)`
- **Parameters**:
  - `categoryId` (String): ID của danh mục
  - `update` (MenuCategoryInput): Dữ liệu cập nhật

#### Xóa danh mục
- **Endpoint**: `DELETE /api/v1/menu/categories/{categoryId}`
- **Method**: `deleteMenuCategory(categoryId)`
- **Parameters**:
  - `categoryId` (String): ID của danh mục

### 4. Menu Items

#### Tạo món ăn
- **Endpoint**: `POST /api/v1/menu/categories/{categoryId}/items`
- **Method**: `createMenuItem(categoryId, create)`
- **Parameters**:
  - `categoryId` (String): ID của danh mục
  - `create` (MenuItemInput): Dữ liệu tạo món ăn

#### Lấy danh sách món ăn
- **Endpoint**: `GET /api/v1/menu/categories/{categoryId}/items`
- **Method**: `getMenuItems(categoryId, {offset, limit})`
- **Parameters**:
  - `categoryId` (String): ID của danh mục
  - `offset` (int, optional): Vị trí bắt đầu (mặc định: 0)
  - `limit` (int, optional): Số lượng item (mặc định: 100)

#### Lấy thông tin món ăn
- **Endpoint**: `GET /api/v1/menu/items/{itemId}`
- **Method**: `getMenuItem(itemId)`
- **Parameters**:
  - `itemId` (String): ID của món ăn

#### Cập nhật món ăn
- **Endpoint**: `PUT /api/v1/menu/items/{itemId}`
- **Method**: `updateMenuItem(itemId, update)`
- **Parameters**:
  - `itemId` (String): ID của món ăn
  - `update` (MenuItemInput): Dữ liệu cập nhật

#### Xóa món ăn
- **Endpoint**: `DELETE /api/v1/menu/items/{itemId}`
- **Method**: `deleteMenuItem(itemId)`
- **Parameters**:
  - `itemId` (String): ID của món ăn

### 5. Menu Item Variants

#### Tạo biến thể món ăn
- **Endpoint**: `POST /api/v1/menu/items/{itemId}/variants`
- **Method**: `createMenuItemVariant(itemId, create)`
- **Parameters**:
  - `itemId` (String): ID của món ăn
  - `create` (MenuItemVariantInput): Dữ liệu tạo biến thể

#### Lấy danh sách biến thể
- **Endpoint**: `GET /api/v1/menu/items/{itemId}/variants`
- **Method**: `getMenuItemVariants(itemId, {offset, limit})`
- **Parameters**:
  - `itemId` (String): ID của món ăn
  - `offset` (int, optional): Vị trí bắt đầu (mặc định: 0)
  - `limit` (int, optional): Số lượng item (mặc định: 100)

#### Lấy thông tin biến thể
- **Endpoint**: `GET /api/v1/menu/variants/{variantId}`
- **Method**: `getMenuItemVariant(variantId)`
- **Parameters**:
  - `variantId` (String): ID của biến thể

#### Cập nhật biến thể
- **Endpoint**: `PUT /api/v1/menu/variants/{variantId}`
- **Method**: `updateMenuItemVariant(variantId, update)`
- **Parameters**:
  - `variantId` (String): ID của biến thể
  - `update` (MenuItemVariantInput): Dữ liệu cập nhật

#### Xóa biến thể
- **Endpoint**: `DELETE /api/v1/menu/variants/{variantId}`
- **Method**: `deleteMenuItemVariant(variantId)`
- **Parameters**:
  - `variantId` (String): ID của biến thể

### 6. Menu Item Variant Values

#### Tạo giá trị biến thể
- **Endpoint**: `POST /api/v1/menu/variants/{variantId}/values`
- **Method**: `createMenuItemVariantValue(variantId, create)`
- **Parameters**:
  - `variantId` (String): ID của biến thể
  - `create` (MenuItemVariantValueInput): Dữ liệu tạo giá trị

#### Lấy danh sách giá trị biến thể
- **Endpoint**: `GET /api/v1/menu/variants/{variantId}/values`
- **Method**: `getMenuItemVariantValues(variantId, {offset, limit})`
- **Parameters**:
  - `variantId` (String): ID của biến thể
  - `offset` (int, optional): Vị trí bắt đầu (mặc định: 0)
  - `limit` (int, optional): Số lượng item (mặc định: 100)

#### Lấy thông tin giá trị biến thể
- **Endpoint**: `GET /api/v1/menu/variant-values/{valueId}`
- **Method**: `getMenuItemVariantValue(valueId)`
- **Parameters**:
  - `valueId` (String): ID của giá trị biến thể

#### Cập nhật giá trị biến thể
- **Endpoint**: `PUT /api/v1/menu/variant-values/{valueId}`
- **Method**: `updateMenuItemVariantValue(valueId, update)`
- **Parameters**:
  - `valueId` (String): ID của giá trị biến thể
  - `update` (MenuItemVariantValueInput): Dữ liệu cập nhật

#### Xóa giá trị biến thể
- **Endpoint**: `DELETE /api/v1/menu/variant-values/{valueId}`
- **Method**: `deleteMenuItemVariantValue(valueId)`
- **Parameters**:
  - `valueId` (String): ID của giá trị biến thể

### 7. Menu Item Options

#### Tạo tùy chọn món ăn
- **Endpoint**: `POST /api/v1/menu/items/{itemId}/options`
- **Method**: `createMenuItemOption(itemId, create)`
- **Parameters**:
  - `itemId` (String): ID của món ăn
  - `create` (MenuItemOptionInput): Dữ liệu tạo tùy chọn

#### Lấy danh sách tùy chọn
- **Endpoint**: `GET /api/v1/menu/items/{itemId}/options`
- **Method**: `getMenuItemOptions(itemId, {offset, limit})`
- **Parameters**:
  - `itemId` (String): ID của món ăn
  - `offset` (int, optional): Vị trí bắt đầu (mặc định: 0)
  - `limit` (int, optional): Số lượng item (mặc định: 100)

#### Lấy thông tin tùy chọn
- **Endpoint**: `GET /api/v1/menu/options/{optionId}`
- **Method**: `getMenuItemOption(optionId)`
- **Parameters**:
  - `optionId` (String): ID của tùy chọn

#### Cập nhật tùy chọn
- **Endpoint**: `PUT /api/v1/menu/options/{optionId}`
- **Method**: `updateMenuItemOption(optionId, update)`
- **Parameters**:
  - `optionId` (String): ID của tùy chọn
  - `update` (MenuItemOptionInput): Dữ liệu cập nhật

#### Xóa tùy chọn
- **Endpoint**: `DELETE /api/v1/menu/options/{optionId}`
- **Method**: `deleteMenuItemOption(optionId)`
- **Parameters**:
  - `optionId` (String): ID của tùy chọn

### 8. Menu Item Option Values

#### Tạo giá trị tùy chọn
- **Endpoint**: `POST /api/v1/menu/options/{optionId}/values`
- **Method**: `createMenuItemOptionValue(optionId, create)`
- **Parameters**:
  - `optionId` (String): ID của tùy chọn
  - `create` (MenuItemOptionValueInput): Dữ liệu tạo giá trị

#### Lấy danh sách giá trị tùy chọn
- **Endpoint**: `GET /api/v1/menu/options/{optionId}/values`
- **Method**: `getMenuItemOptionValues(optionId, {offset, limit})`
- **Parameters**:
  - `optionId` (String): ID của tùy chọn
  - `offset` (int, optional): Vị trí bắt đầu (mặc định: 0)
  - `limit` (int, optional): Số lượng item (mặc định: 100)

#### Lấy thông tin giá trị tùy chọn
- **Endpoint**: `GET /api/v1/menu/option-values/{valueId}`
- **Method**: `getMenuItemOptionValue(valueId)`
- **Parameters**:
  - `valueId` (String): ID của giá trị tùy chọn

#### Cập nhật giá trị tùy chọn
- **Endpoint**: `PUT /api/v1/menu/option-values/{valueId}`
- **Method**: `updateMenuItemOptionValue(valueId, update)`
- **Parameters**:
  - `valueId` (String): ID của giá trị tùy chọn
  - `update` (MenuItemOptionValueInput): Dữ liệu cập nhật

#### Xóa giá trị tùy chọn
- **Endpoint**: `DELETE /api/v1/menu/option-values/{valueId}`
- **Method**: `deleteMenuItemOptionValue(valueId)`
- **Parameters**:
  - `valueId` (String): ID của giá trị tùy chọn

### 9. Menu Item Translations

#### Tạo bản dịch món ăn
- **Endpoint**: `POST /api/v1/menu/items/{itemId}/translations`
- **Method**: `createMenuItemTranslation(itemId, create)`
- **Parameters**:
  - `itemId` (String): ID của món ăn
  - `create` (MenuItemTranslationCreate): Dữ liệu tạo bản dịch

#### Lấy danh sách bản dịch
- **Endpoint**: `GET /api/v1/menu/items/{itemId}/translations`
- **Method**: `getMenuItemTranslations(itemId, {offset, limit})`
- **Parameters**:
  - `itemId` (String): ID của món ăn
  - `offset` (int, optional): Vị trí bắt đầu (mặc định: 0)
  - `limit` (int, optional): Số lượng item (mặc định: 100)

#### Lấy thông tin bản dịch
- **Endpoint**: `GET /api/v1/menu/translations/{translationId}`
- **Method**: `getMenuItemTranslation(translationId)`
- **Parameters**:
  - `translationId` (String): ID của bản dịch

#### Cập nhật bản dịch
- **Endpoint**: `PUT /api/v1/menu/translations/{translationId}`
- **Method**: `updateMenuItemTranslation(translationId, update)`
- **Parameters**:
  - `translationId` (String): ID của bản dịch
  - `update` (MenuItemTranslationUpdate): Dữ liệu cập nhật

#### Xóa bản dịch
- **Endpoint**: `DELETE /api/v1/menu/translations/{translationId}`
- **Method**: `deleteMenuItemTranslation(translationId)`
- **Parameters**:
  - `translationId` (String): ID của bản dịch

## Models

### Menu Models
- `MenuResponse`: Response model cho menu
- `MenuInput`: Model tạo menu
- `MenuInput`: Model cập nhật menu

**Fields:**
- `id`, `name`, `description`, `isActive`, `imageUrl`, `metadata`, `createdAt`, `updatedAt`, `restaurantId`

### Menu Category Models
- `MenuCategoryResponse`: Response model cho danh mục menu
- `MenuCategoryInput`: Input model cho danh mục menu

**Fields:**
- `id`, `name`, `description`, `isActive`, `sortOrder`, `createdAt`, `updatedAt`, `menuId`

### Menu Item Models
- `MenuItemResponse`: Response model cho món ăn
- `MenuItemInput`: Model tạo món ăn
- `MenuItemInput`: Model cập nhật món ăn

**Fields:**
- `id`, `name`, `description`, `isActive`, `price`, `imageUrl`, `sortOrder`, `metadata`, `createdAt`, `updatedAt`, `categoryId`

### Menu Item Variant Models
- `MenuItemVariantResponse`: Response model cho biến thể món ăn
- `MenuItemVariantInput`: Model tạo biến thể
- `MenuItemVariantInput`: Model cập nhật biến thể

**Fields:**
- `id`, `name`, `description`, `isActive`, `priceModifier`, `sortOrder`, `createdAt`, `updatedAt`, `itemId`

### Menu Item Variant Value Models
- `MenuItemVariantValueResponse`: Response model cho giá trị biến thể
- `MenuItemVariantValueInput`: Model tạo giá trị biến thể
- `MenuItemVariantValueInput`: Model cập nhật giá trị biến thể

**Fields:**
- `id`, `name`, `description`, `isActive`, `priceModifier`, `sortOrder`, `createdAt`, `updatedAt`, `variantId`

### Menu Item Option Models
- `MenuItemOptionResponse`: Response model cho tùy chọn món ăn
- `MenuItemOptionInput`: Model tạo tùy chọn
- `MenuItemOptionInput`: Model cập nhật tùy chọn

**Fields:**
- `id`, `name`, `description`, `isActive`, `isRequired`, `maxSelections`, `sortOrder`, `createdAt`, `updatedAt`, `itemId`

### Menu Item Option Value Models
- `MenuItemOptionValueResponse`: Response model cho giá trị tùy chọn
- `MenuItemOptionValueInput`: Model tạo giá trị tùy chọn
- `MenuItemOptionValueInput`: Model cập nhật giá trị tùy chọn

**Fields:**
- `id`, `name`, `description`, `isActive`, `priceModifier`, `sortOrder`, `createdAt`, `updatedAt`, `optionId`

### Menu Item Translation Models
- `MenuItemTranslationResponse`: Response model cho bản dịch món ăn
- `MenuItemTranslationCreate`: Model tạo bản dịch
- `MenuItemTranslationUpdate`: Model cập nhật bản dịch

**Fields:**
- `id`, `languageCode`, `name`, `description`, `metadata`, `createdAt`, `updatedAt`, `itemId`

## Hướng dẫn sử dụng

### 1. Khởi tạo Repository

```dart
import 'package:fastship_shared_resources/menu/menu.dart';

// Sử dụng singleton instance
final menuRepo = MenuRepo();

// Hoặc inject custom API implementation
final customApi = CustomMenuApi();
final menuRepo = MenuRepo(customApi);
```

### 2. Quản lý Menu

```dart
// Tạo menu mới
final createData = MenuInput(
  name: 'Menu chính',
  description: 'Menu chính của nhà hàng',
  isActive: true,
);

final response = await menuRepo.createRestaurantMenu(restaurantId, createData);
if (response.isSuccess) {
  final menu = response.data!;
  print('Menu đã được tạo: ${menu.name}');
}

// Lấy danh sách menu
final menusResponse = await menuRepo.getRestaurantMenus(
  restaurantId,
  offset: 0,
  limit: 20,
);

if (menusResponse.isSuccess) {
  final menus = menusResponse.data!.items;
  print('Số lượng menu: ${menus.length}');
}
```

### 3. Quản lý Danh mục

```dart
// Tạo danh mục mới
final categoryData = MenuCategoryInput(
  name: 'Món chính',
  description: 'Các món ăn chính',
  sortOrder: 1,
);

final categoryResponse = await menuRepo.createMenuCategory(menuId, categoryData);
if (categoryResponse.isSuccess) {
  final category = categoryResponse.data!;
  print('Danh mục đã được tạo: ${category.name}');
}
```

### 4. Quản lý Món ăn

```dart
// Tạo món ăn mới
final itemData = MenuItemInput(
  name: 'Phở bò',
  description: 'Phở bò truyền thống',
  price: 50000,
  isAvailable: true,
);

final itemResponse = await menuRepo.createMenuItem(categoryId, itemData);
if (itemResponse.isSuccess) {
  final item = itemResponse.data!;
  print('Món ăn đã được tạo: ${item.name}');
}
```

### 5. Quản lý Biến thể

```dart
// Tạo biến thể cho món ăn
final variantData = MenuItemVariantInput(
  name: 'Kích thước',
  description: 'Chọn kích thước món ăn',
  isActive: true,
  priceModifier: 0.0,
  sortOrder: 1,
);

final variantResponse = await menuRepo.createMenuItemVariant(itemId, variantData);
if (variantResponse.isSuccess) {
  final variant = variantResponse.data!;
  print('Biến thể đã được tạo: ${variant.name}');
}
```

### 6. Quản lý Tùy chọn

```dart
// Tạo tùy chọn cho món ăn
final optionData = MenuItemOptionInput(
  name: 'Gia vị',
  description: 'Chọn gia vị yêu thích',
  isActive: true,
  isRequired: false,
  maxSelections: 3,
  sortOrder: 1,
);

final optionResponse = await menuRepo.createMenuItemOption(itemId, optionData);
if (optionResponse.isSuccess) {
  final option = optionResponse.data!;
  print('Tùy chọn đã được tạo: ${option.name}');
}
```

### 7. Quản lý Bản dịch

```dart
// Tạo bản dịch cho món ăn
final translationData = MenuItemTranslationCreate(
  languageCode: 'en',
  name: 'Beef Pho',
  description: 'Traditional beef pho',
);

final translationResponse = await menuRepo.createMenuItemTranslation(
  itemId, 
  translationData,
);
if (translationResponse.isSuccess) {
  final translation = translationResponse.data!;
  print('Bản dịch đã được tạo: ${translation.name}');
}
```

## Error Handling

Tất cả các API methods đều trả về `NetworkResponse<T>` với các trường:

- `isSuccess`: Boolean cho biết request có thành công hay không
- `data`: Dữ liệu response (nếu thành công)
- `error`: Thông tin lỗi (nếu thất bại)
- `statusCode`: HTTP status code

```dart
final response = await menuRepo.getMenu(menuId);
if (response.isSuccess) {
  // Xử lý dữ liệu thành công
  final menu = response.data!;
} else {
  // Xử lý lỗi
  print('Lỗi: ${response.error}');
  print('Status code: ${response.statusCode}');
}
```

## Pagination

Các API methods hỗ trợ pagination với parameters `offset` và `limit`:

```dart
// Lấy 20 menu đầu tiên
final response1 = await menuRepo.getRestaurantMenus(
  restaurantId,
  offset: 0,
  limit: 20,
);

// Lấy 20 menu tiếp theo
final response2 = await menuRepo.getRestaurantMenus(
  restaurantId,
  offset: 20,
  limit: 20,
);
```

## Authentication

Tất cả các API calls đều yêu cầu authentication token. Token sẽ được tự động lấy từ `appPrefs` và gửi trong header `Authorization`.

## Cấu trúc thư mục

```
lib/menu/
├── menu.dart              # Export file chính
├── app_api.dart           # API implementation
├── repo.dart              # Repository layer
├── models/                # Data models
│   ├── models.dart        # Export tất cả models
│   ├── menu_models.dart   # Menu models
│   ├── menu_category_models.dart      # Category models
│   ├── menu_item_models.dart          # Item models
│   ├── menu_item_variant_models.dart  # Variant models
│   ├── menu_item_option_models.dart   # Option models
│   └── menu_item_translation_models.dart # Translation models
└── README.md              # Tài liệu này
```

## Notes

- Tất cả các ID parameters đều là String type
- `restaurantId` là int type
- Các optional parameters có giá trị mặc định hợp lý
- Repository sử dụng singleton pattern để đảm bảo chỉ có một instance
- Tất cả các methods đều là async và trả về Future
- Tất cả models đều hỗ trợ null safety
- Các field names sử dụng snake_case trong JSON và camelCase trong Dart

