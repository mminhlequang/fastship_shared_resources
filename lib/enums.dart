part of 'shared_resources.dart';

// Fastship Stripe key:
// Demo
// pk_test_51QSzj8G67xsdbExOLHTKXtPDWDdH7DwAfdpQjQS2b0UEL47RkQJ3IAw6O4SIBRLX8P19isjt3JdTAUIhVEDuZbwx00DVBSbC9H
// sk_test_51QSzj8G67xsdbExOcyrdBflQ11c6Tx7EKSitEI0OoV39qEPXV2DGuhcCCdN3JagZtur2Ndohb3v4ZFDgELNVQ4UJ00PVneYi0W

// Live
// pk_live_51QSzj8G67xsdbExOREzmoWHdDCxGDlylVrXX1nwpiKW8ylSoBH0fqUMPErlQUmmDClzJc6N5aebfKTN4ujUEbYS600YEC6swxf
// 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

const String stripePublishableKey =
    kDebugMode || kProfileMode
        ? "pk_test_51S60pd4zut6r6rN5APa2tSLo0alGOPaUOzoMQoGrgQkw1lmK7Fzc3FoN5kJpHl9J5hfyxJytM2P6yqho6MsPy43W00uLdIJxn2"
        : "pk_live_51QSzj8G67xsdbExOREzmoWHdDCxGDlylVrXX1nwpiKW8ylSoBH0fqUMPErlQUmmDClzJc6N5aebfKTN4ujUEbYS600YEC6swxf";

const String appMessengerUrl = "https://m.me/fastship.vn";
const String appWhatsappUrl = "https://wa.me/84909090909";

const String privacyPolicyUrl =
    "https://mminhlequang-apps.web.app/legal/privacy-policy-fastship";
const String termsOfServiceUrl =
    "https://mminhlequang-apps.web.app/legal/terms-of-use-fastship";

const String supportPhoneNumber = "+36 307859588";
const String supportPhoneNumberRaw = "+36307859588";
const String supportEmail = "support@fastshiphu.com";
const String supportAddress = "1089 BUDAPEST, ORCZY TÉR 4, HUNGARY";

const String appCurrency = "HUF";
const String appCurrencySymbol = "Ft";

String get appMapUrlTemplate =>
    kDebugMode ? appMapUrlTemplateGg : appMapUrlTemplateHERE;

const String hereMapApiKey = "HxCn0uXDho1pV2wM59D_QWzCgPtWB_E5aIiqIdnBnV0";
String get appMapUrlTemplateHERE =>
    "https://maps.hereapi.com/v3/base/mc/{z}/{x}/{y}/png8?lang=${appPrefs.languageCode}&size=256&style=lite.day&apiKey=$hereMapApiKey";
const String appMapUrlTemplateGg =
    "https://mt.google.com/vt/lyrs=m&hl=en&x={x}&y={y}&z={z}";

String _urlDebug = 'http://192.168.1.30:8002';
String _urlProd = 'https://api.fastshiphu.com';
String _urlAsset = 'https://fastship.sgp1.digitaloceanspaces.com';

String get apiBaseUrl => kDebugMode ? _urlDebug : _urlProd;
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
        return 'FastShip Wallet' ;
      case AppPaymentMethod.cash:
        return 'Cash on Delivery';
    }
  }

  String get assetIcon {
    switch (this) {
      case AppPaymentMethod.stripe:
        return 'icon35';
      case AppPaymentMethod.faship_wallet:
        return 'icon36';
      case AppPaymentMethod.cash:
        return 'icon34';
    }
  }
}

enum AppOrderStoreStatus {
  pending, // Đang chờ
  // accepted, // Đã chấp nhận đơn
  rejected, // Đã từ chối đơn
  completed, // Đã hoàn thành đơn
}

enum AppOrderProcessStatus {
  pending, // Đơn hàng mới
  findDriver, // Đang tìm tài xế
  driverAccepted, // Tài xế đã chấp nhận đơn
  storeAccepted, // Cửa hàng đã chấp nhận đơn
  driverArrivedStore, // Tài xế đã đến địa điểm giao hàng
  driverPicked, // Tài xế đã lấy hàng
  driverArrivedDestination, // Tài xế đã đến địa điểm giao hàng
  completed, // Đơn hàng hoàn thành
  cancelled,
}

extension AppOrderProcessStatusExtension on AppOrderProcessStatus {
  String get friendlyName {
    switch (this) {
      case AppOrderProcessStatus.pending:
        return 'Pending';
      case AppOrderProcessStatus.findDriver:
        return 'Finding driver';
      case AppOrderProcessStatus.driverAccepted:
        return 'Driver accepted';
      case AppOrderProcessStatus.storeAccepted:
        return 'Store accepted';
      case AppOrderProcessStatus.driverArrivedStore:
        return 'Driver arrived store';
      case AppOrderProcessStatus.driverPicked:
        return 'Driver picked';
      case AppOrderProcessStatus.driverArrivedDestination:
        return 'Driver arrived destination';
      case AppOrderProcessStatus.completed:
        return 'Completed';
      case AppOrderProcessStatus.cancelled:
        return 'Cancelled';
    }
  }
}

enum AppFindDriverStatus {
  finding, // Đang tìm tài xế
  availableDrivers, // Tài xế khả dụng
  found, // Đã tìm thấy tài xế
  noDriver, // Không tìm thấy tài xế
  error, // Lỗi
}

enum AppPaymentOrderStatus {
  pending, // Đang chờ thanh toán
  paid, // Đã thanh toán
  failed, // Thanh toán thất bại
}

enum AppOrderType {
  delivery, // Giao hàng
  pickup, // Món đặt lấy
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
  {"name": "Iceland", "code": "IC", "alpha3": "ISL"}, // IC is not official ISO, but used in some APIs
  {"name": "Italy", "code": "IT", "alpha3": "ITA"},
  {"name": "Jersey", "code": "JE", "alpha3": "JEY"},
  {"name": "Liechtenstein", "code": "LI", "alpha3": "LIE"},
  {"name": "Lithuania", "code": "LT", "alpha3": "LTU"},
  {"name": "Luxembourg", "code": "LU", "alpha3": "LUX"},
  {"name": "Latvia", "code": "LV", "alpha3": "LVA"},
  {"name": "Monaco", "code": "MC", "alpha3": "MCO"},
  {"name": "Moldova, Republic of", "code": "MD", "alpha3": "MDA"},
  {"name": "Macedonia, The Former Yugoslav Republic of", "code": "MK", "alpha3": "MKD"},
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
