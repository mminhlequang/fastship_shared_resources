part of 'shared_resources.dart';

const String foodPlaceholderAsset = 'assets/images/food_placeholder.png';
const String restaurantPlaceholderAsset =
    'assets/images/restaurant_placeholder.png';

const String stripePublishableKey =
    // kDebugMode || kProfileMode
    //     ?
    "pk_test_51S60pd4zut6r6rN5APa2tSLo0alGOPaUOzoMQoGrgQkw1lmK7Fzc3FoN5kJpHl9J5hfyxJytM2P6yqho6MsPy43W00uLdIJxn2"
// :
// "pk_live_51QSzj8G67xsdbExOREzmoWHdDCxGDlylVrXX1nwpiKW8ylSoBH0fqUMPErlQUmmDClzJc6N5aebfKTN4ujUEbYS600YEC6swxf"
;

const String appMessengerUrl = "https://m.me/fastship.vn";
const String appWhatsappUrl = "https://wa.me/84909090909";

const String supportPhoneNumber = "+36 307859588";
const String supportPhoneNumberRaw = "+36307859588";
const String supportEmail = "support@fastshiphu.com";
const String supportAddress = "1089 BUDAPEST, ORCZY TÉR 4, HUNGARY";

const String appCurrency = "HUF";
const String appCurrencySymbol = "Ft";

String get appMapUrlTemplate =>
    // kDebugMode ?
    appMapUrlTemplateGg
//  : appMapUrlTemplateHERE
;

const String hereMapApiKey = "HxCn0uXDho1pV2wM59D_QWzCgPtWB_E5aIiqIdnBnV0";
String get appMapUrlTemplateHERE =>
    "https://maps.hereapi.com/v3/base/mc/{z}/{x}/{y}/png8?lang=${appPrefs.languageCode}&size=256&style=lite.day&apiKey=$hereMapApiKey";
const String appMapUrlTemplateGg =
    "https://mt.google.com/vt/lyrs=m&hl=en&x={x}&y={y}&z={z}";

const String googlevapidKey =
    "BC1YTu_3h-ZnaH8WL7h3SHLRaJ3EAntdHATxAKJQO_KqqCLnOeqMOOik10NzXQ5AHMLrR_QzKK3c7wQu3sMGx2k"; // Thay thế bằng VAPID key thực tế

String _urlDebug = 'http://192.168.1.13:8002';

String _urlProd = 'https://api.fastshiphu.com';
String _urlAsset = 'https://fastship.sgp1.digitaloceanspaces.com';

String get apiBaseUrl =>
    // kDebugMode ? _urlDebug :
    _urlProd;
String get socketIOBaseUrl => "$apiBaseUrl";

String correctAssetUrl(String url) {
  if (url.startsWith('http')) {
    return url;
  }
  if (url.startsWith('/')) {
    return '$_urlAsset$url';
  }
  return '$_urlAsset/$url';
}

/// Enum mô tả trạng thái đơn hàng theo flow xử lý đơn
enum OrderStatus {
  /// Đơn hàng mới được tạo, chờ restaurant xác nhận
  pending,

  /// Restaurant đã xác nhận, đang tìm driver
  confirmed,

  /// Restaurant đang chuẩn bị món ăn
  preparing,

  /// Món ăn sẵn sàng, driver có thể đến lấy
  readyForPickup,

  /// Driver đã lấy món ăn, đang giao hàng
  pickedUp,

  /// Đơn hàng đã giao thành công
  delivered,

  /// Đơn hàng bị hủy (từ customer hoặc restaurant)
  cancelled,

  /// Restaurant từ chối đơn hàng
  rejectedByRestaurant,

  /// No drivers available
  noDriversAvailable,

  /// Restaurant không phản hồi trong 5 phút
  timeout;

  /// Trả về giá trị thực tế dạng string cho trạng thái đơn hàng
  String get value {
    switch (this) {
      case OrderStatus.pending:
        return "pending";
      case OrderStatus.confirmed:
        return "confirmed";
      case OrderStatus.preparing:
        return "preparing";
      case OrderStatus.readyForPickup:
        return "ready_for_pickup";
      case OrderStatus.pickedUp:
        return "picked_up";
      case OrderStatus.delivered:
        return "delivered";
      case OrderStatus.cancelled:
        return "cancelled";
      case OrderStatus.rejectedByRestaurant:
        return "rejected_by_restaurant";
      case OrderStatus.noDriversAvailable:
        return "no_drivers_available";
      case OrderStatus.timeout:
        return "timeout";
    }
  }

  /// Trả về màu sắc đại diện cho từng trạng thái đơn hàng
  Color get color {
    switch (this) {
      case OrderStatus.pending:
        return Colors.grey;
      case OrderStatus.confirmed:
        return Colors.blue;
      case OrderStatus.preparing:
        return Colors.orange;
      case OrderStatus.readyForPickup:
        return Colors.amber;
      case OrderStatus.pickedUp:
        return Colors.deepPurple;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.red;
      case OrderStatus.rejectedByRestaurant:
        return Colors.redAccent;
      case OrderStatus.noDriversAvailable:
        return Colors.redAccent;
      case OrderStatus.timeout:
        return Colors.brown;
    }
  }

  /// Trả về icon đại diện cho từng trạng thái đơn hàng
  IconData get icon {
    switch (this) {
      case OrderStatus.pending:
        return FontAwesomeIcons.clock;
      case OrderStatus.confirmed:
        return FontAwesomeIcons.checkCircle;
      case OrderStatus.preparing:
        return FontAwesomeIcons.store;
      case OrderStatus.readyForPickup:
        return FontAwesomeIcons.box;
      case OrderStatus.pickedUp:
        return FontAwesomeIcons.truck;
      case OrderStatus.delivered:
        return FontAwesomeIcons.flagCheckered;
      case OrderStatus.cancelled:
        return FontAwesomeIcons.timesCircle;
      case OrderStatus.rejectedByRestaurant:
        return FontAwesomeIcons.exclamationTriangle;
      case OrderStatus.noDriversAvailable:
        return FontAwesomeIcons.exclamationTriangle;
      case OrderStatus.timeout:
        return FontAwesomeIcons.clock;
    }
  }

  String get displayName {
    switch (this) {
      case OrderStatus.pending:
        return 'Waiting confirmation';
      case OrderStatus.confirmed:
        return 'Confirmed';
      case OrderStatus.preparing:
        return 'Preparing';
      case OrderStatus.readyForPickup:
        return 'Ready for pickup';
      case OrderStatus.pickedUp:
        return 'Delivering';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
      case OrderStatus.rejectedByRestaurant:
        return 'Rejected by restaurant';
      case OrderStatus.noDriversAvailable:
        return 'No drivers available';
      case OrderStatus.timeout:
        return 'Timeout';
      default:
        return 'Unknown';
    }
  }

  String get labelActionDriverApp {
    switch (this) {
      case OrderStatus.pending:
      case OrderStatus.confirmed:
      case OrderStatus.preparing:
      case OrderStatus.readyForPickup:
        return 'Waiting for restaurant';

      case OrderStatus.pickedUp:
        return 'Picked up, on the way';
      case OrderStatus.delivered:
        return 'Order delivered';
      default:
        return 'Unknown';
    }
  }

  OrderStatus get nextStatus {
    if (this == OrderStatus.values.last) {
      return OrderStatus.values.first;
    }
    return OrderStatus.values[OrderStatus.values.indexOf(this) + 1];
  }
}

/// Enum mô tả trạng thái thanh toán
enum PaymentStatus {
  /// Chưa thanh toán
  unpaid,

  /// Đã thanh toán
  paid,

  /// Đã hoàn tiền
  refunded,

  /// Thanh toán thất bại
  failed;

  /// Trả về giá trị thực tế dạng string cho trạng thái thanh toán
  String get value {
    switch (this) {
      case PaymentStatus.unpaid:
        return "unpaid";
      case PaymentStatus.paid:
        return "paid";
      case PaymentStatus.refunded:
        return "refunded";
      case PaymentStatus.failed:
        return "failed";
    }
  }

  String get displayName {
    switch (this) {
      case PaymentStatus.unpaid:
        return 'Unpaid';
      case PaymentStatus.paid:
        return 'Paid';
      case PaymentStatus.refunded:
        return 'Refunded';
      case PaymentStatus.failed:
        return 'Failed';
      default:
        return 'Unknown';
    }
  }
}

/// Enum mô tả phương thức thanh toán
enum PaymentMethod {
  /// Thanh toán qua Stripe
  stripe,

  /// Thanh toán tiền mặt
  cash,

  /// Thanh toán qua ví FastShip
  fastshipWallet;

  /// Trả về giá trị thực tế dạng string cho phương thức thanh toán
  String get value {
    switch (this) {
      case PaymentMethod.stripe:
        return "stripe";
      case PaymentMethod.cash:
        return "cash";
      case PaymentMethod.fastshipWallet:
        return "fastship_wallet";
    }
  }

  String get displayName {
    switch (this) {
      case PaymentMethod.stripe:
        return 'Stripe';
      case PaymentMethod.cash:
        return 'Cash';
      case PaymentMethod.fastshipWallet:
        return 'Wallet';
    }
  }
}

enum AppOrderDeliveryType {
  ship, // Giao hàng
  pickup, // Món đặt lấy
}

enum AppPaymentMethod {
  stripe,
  faship_wallet,
  cash;

  String get description {
    switch (this) {
      case AppPaymentMethod.stripe:
        return 'Pay with credit/debit card on Stripe';
      case AppPaymentMethod.faship_wallet:
        return 'Pay with FastShip wallet';
      case AppPaymentMethod.cash:
        return 'Pay with cash on delivery';
    }
  }

  String get displayName {
    switch (this) {
      case AppPaymentMethod.stripe:
        return 'Stripe Payment';
      case AppPaymentMethod.faship_wallet:
        return 'FastShip Wallet';
      case AppPaymentMethod.cash:
        return 'Cash on Delivery';
    }
  }

  String get assetIcon {
    switch (this) {
      case AppPaymentMethod.stripe:
        return 'iconx3';
      case AppPaymentMethod.faship_wallet:
        return 'iconx2';
      case AppPaymentMethod.cash:
        return 'iconx1';
    }
  }
}

String distanceFormatted(num metter) {
  if (metter < 1000) {
    return '${metter}m';
  } else {
    return '${(metter / 1000).toStringAsFixed(1)}km';
  }
}

// Các loại tài khoản trong hệ thống
enum AccountType {
  customer(1),
  driver(2),
  partner(3);

  final int value;
  const AccountType(this.value);

  static AccountType fromValue(int value) {
    return AccountType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => AccountType.customer,
    );
  }

  String get name {
    switch (this) {
      case AccountType.customer:
        return 'Customer';
      case AccountType.driver:
        return 'Driver';
      case AccountType.partner:
        return 'Partner';
    }
  }
}

enum Gender {
  male(1),
  female(2),
  other(3);

  final int value;
  const Gender(this.value);

  static Gender fromValue(int value) {
    return Gender.values.firstWhere(
      (type) => type.value == value,
      orElse: () => Gender.other,
    );
  }

  String get name {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.other:
        return 'Other';
    }
  }
}

const List<Map> euroCountries = [
  {"name": "Vietnam", "code": "VN", "alpha3": "VNM"},

  {"name": "Andorra", "code": "AD", "alpha3": "AND"},
  {"name": "Albania", "code": "AL", "alpha3": "ALB"},
  {"name": "Austria", "code": "AT", "alpha3": "AUT"},
  {"name": "Åland Islands", "code": "AX", "alpha3": "ALA"},
  {"name": "Bosnia and Herzegovina", "code": "BA", "alpha3": "BIH"},
  {"name": "Belgium", "code": "BE", "alpha3": "BEL"},
  {"name": "Bulgaria", "code": "BG", "alpha3": "BGR"},
  {"name": "Belarus", "code": "BY", "alpha3": "BLR"},
  {"name": "Switzerland", "code": "CH", "alpha3": "CHE"},
  {"name": "Cyprus", "code": "CY", "alpha3": "CYP"},
  {"name": "Czech Republic", "code": "CZ", "alpha3": "CZE"},
  {"name": "Germany", "code": "DE", "alpha3": "DEU"},
  {"name": "Denmark", "code": "DK", "alpha3": "DNK"},
  {"name": "Estonia", "code": "EE", "alpha3": "EST"},
  {"name": "Spain", "code": "ES", "alpha3": "ESP"},
  {"name": "Finland", "code": "FI", "alpha3": "FIN"},
  {"name": "Faroe Islands", "code": "FO", "alpha3": "FRO"},
  {"name": "France", "code": "FR", "alpha3": "FRA"},
  {"name": "United Kingdom", "code": "GB", "alpha3": "GBR"},
  {"name": "Guernsey", "code": "GG", "alpha3": "GGY"},
  {"name": "Greece", "code": "GR", "alpha3": "GRC"},
  {"name": "Croatia", "code": "HR", "alpha3": "HRV"},
  {"name": "Hungary", "code": "HU", "alpha3": "HUN"},
  {"name": "Ireland", "code": "IE", "alpha3": "IRL"},
  {"name": "Isle of Man", "code": "IM", "alpha3": "IMN"},
  {
    "name": "Iceland",
    "code": "IC",
    "alpha3": "ISL",
  }, // IC is not official ISO, but used in some APIs
  {"name": "Italy", "code": "IT", "alpha3": "ITA"},
  {"name": "Jersey", "code": "JE", "alpha3": "JEY"},
  {"name": "Liechtenstein", "code": "LI", "alpha3": "LIE"},
  {"name": "Lithuania", "code": "LT", "alpha3": "LTU"},
  {"name": "Luxembourg", "code": "LU", "alpha3": "LUX"},
  {"name": "Latvia", "code": "LV", "alpha3": "LVA"},
  {"name": "Monaco", "code": "MC", "alpha3": "MCO"},
  {"name": "Moldova, Republic of", "code": "MD", "alpha3": "MDA"},
  {
    "name": "Macedonia, The Former Yugoslav Republic of",
    "code": "MK",
    "alpha3": "MKD",
  },
  {"name": "Malta", "code": "MT", "alpha3": "MLT"},
  {"name": "Netherlands", "code": "NL", "alpha3": "NLD"},
  {"name": "Norway", "code": "NO", "alpha3": "NOR"},
  {"name": "Poland", "code": "PL", "alpha3": "POL"},
  {"name": "Portugal", "code": "PT", "alpha3": "PRT"},
  {"name": "Romania", "code": "RO", "alpha3": "ROU"},
  {"name": "Russian Federation", "code": "RU", "alpha3": "RUS"},
  {"name": "Sweden", "code": "SE", "alpha3": "SWE"},
  {"name": "Slovenia", "code": "SI", "alpha3": "SVN"},
  {"name": "Svalbard and Jan Mayen", "code": "SJ", "alpha3": "SJM"},
  {"name": "Slovakia", "code": "SK", "alpha3": "SVK"},
  {"name": "San Marino", "code": "SM", "alpha3": "SMR"},
  {"name": "Ukraine", "code": "UA", "alpha3": "UKR"},
  {"name": "Holy See (Vatican City State)", "code": "VA", "alpha3": "VAT"},
];

/// Enum cho loại client (ứng dụng)
enum ClientType {
  adminPanel('admin_panel'),
  driverApp('driver_app'),
  driverPanel('driver_panel'),
  restaurantPanel('restaurant_panel'),
  customerApp('customer_app');

  final String value;
  const ClientType(this.value);
}

/// Enum cho phạm vi vai trò người dùng
enum UserRoleScope {
  system('system'),
  driverOrg('driver_org'),
  restaurantOrg('restaurant_org'),
  customer('customer');

  final String value;
  const UserRoleScope(this.value);
}

/// Enum cho tên các vai trò mặc định, đồng bộ với migration add_default_roles.py
enum UserRoleName {
  // System roles
  admin('admin'),
  adminDriverManager('admin_driver_manager'),
  adminDriverSupport('admin_driver_support'),
  adminRestaurantManager('admin_restaurant_manager'),
  adminRestaurantSupport('admin_restaurant_support'),
  adminCustomerManager('admin_customer_manager'),
  adminCustomerSupport('admin_customer_support'),
  adminFinancer('admin_financer'),

  // Driver organization roles
  driverOrgAdmin('driver_org_admin'),
  driverOrgManager('driver_org_manager'),
  driver('driver'),

  // Restaurant organization roles
  restaurantOrgAdmin('restaurant_org_admin'),
  restaurantOrgManager('restaurant_org_manager'),
  restaurantManager('restaurant_manager'),
  restaurantStaff('restaurant_staff');

  final String value;
  const UserRoleName(this.value);

  String get displayName => switch (this) {
    driverOrgAdmin => 'Driver Organization Admin',
    driverOrgManager => 'Driver Organization Manager',
    driver => 'Driver',
    restaurantOrgAdmin => 'Restaurant Organization Admin',
    restaurantOrgManager => 'Restaurant Organization Manager',
    restaurantManager => 'Restaurant Manager',
    restaurantStaff => 'Restaurant Staff',
    admin => 'Admin',
    adminDriverManager => 'Admin Driver Manager',
    adminDriverSupport => 'Admin Driver Support',
    adminRestaurantManager => 'Admin Restaurant Manager',
    adminRestaurantSupport => 'Admin Restaurant Support',
    adminCustomerManager => 'Admin Customer Manager',
    adminCustomerSupport => 'Admin Customer Support',
    adminFinancer => 'Admin Financer',
  };
}

/// Enum cho loại tổ chức
enum OrgType {
  driverOrg('driver_org'),
  restaurantOrg('restaurant_org'),
  customer('customer');

  final String value;
  const OrgType(this.value);
}

enum CommonAssetType {
  restaurantLogo('restaurant_logo'),
  restaurantBanner('restaurant_banner'),

  restaurantOrgLogo('restaurant_org_logo'),

  driverOrgLogo('driver_org_logo');

  final String value;
  const CommonAssetType(this.value);
}
