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
        ? "pk_test_51QSzj8G67xsdbExOLHTKXtPDWDdH7DwAfdpQjQS2b0UEL47RkQJ3IAw6O4SIBRLX8P19isjt3JdTAUIhVEDuZbwx00DVBSbC9H"
        : "pk_live_51QSzj8G67xsdbExOREzmoWHdDCxGDlylVrXX1nwpiKW8ylSoBH0fqUMPErlQUmmDClzJc6N5aebfKTN4ujUEbYS600YEC6swxf";
const String stripeMerchantIdentifier =
    kDebugMode || kProfileMode
        ? "merchant.flutter.stripe.test"
        : "merchant.flutter.stripe";
const String stripeUrlScheme = "flutterstripe";

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

String _urlDebug = 'http://192.168.1.113:8002';
String _urlPreprod = 'https://preprod-api.fastshiphu.com';
String _urlAsset = 'https://api.fastshiphu.com';

String get apiBaseUrl => 
kDebugMode ? _urlDebug :
 _urlPreprod;
String get socketIOUrl => "$apiBaseUrl/socket.io";

String correctAssetUrl(String url) {
  String baseUrl = "https://fastship.sgp1.digitaloceanspaces.com";
  if (url.startsWith('http')) {
    return url;
  }
  if (url.startsWith('/')) {
    return '$baseUrl$url';
  }
  return '$baseUrl/$url';
}

enum AppOrderDeliveryType {
  ship, // Giao hàng
  pickup, // Món đặt lấy
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
        return 'Pending'.tr();
      case AppOrderProcessStatus.findDriver:
        return 'Finding driver'.tr();
      case AppOrderProcessStatus.driverAccepted:
        return 'Driver accepted'.tr();
      case AppOrderProcessStatus.storeAccepted:
        return 'Store accepted'.tr();
      case AppOrderProcessStatus.driverArrivedStore:
        return 'Driver arrived store'.tr();
      case AppOrderProcessStatus.driverPicked:
        return 'Driver picked'.tr();
      case AppOrderProcessStatus.driverArrivedDestination:
        return 'Driver arrived destination'.tr();
      case AppOrderProcessStatus.completed:
        return 'Completed'.tr();
      case AppOrderProcessStatus.cancelled:
        return 'Cancelled'.tr();
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
        return 'Customer'.tr();
      case AccountType.driver:
        return 'Driver'.tr();
      case AccountType.partner:
        return 'Partner'.tr();
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
        return 'Male'.tr();
      case Gender.female:
        return 'Female'.tr();
      case Gender.other:
        return 'Other'.tr();
    }
  }
}

const List<Map> euroCounries = [
  {"name": "Hungary", "code": "HU"},

  // {"name": "Andorra", "code": "AD"},
  // {"name": "Albania", "code": "AL"},
  // {"name": "Austria", "code": "AT"},
  // {"name": "Åland Islands", "code": "AX"},
  // {"name": "Bosnia and Herzegovina", "code": "BA"},
  // {"name": "Belgium", "code": "BE"},
  // {"name": "Bulgaria", "code": "BG"},
  // {"name": "Belarus", "code": "BY"},
  // {"name": "Switzerland", "code": "CH"},
  // {"name": "Cyprus", "code": "CY"},
  // {"name": "Czech Republic", "code": "CZ"},
  // {"name": "Germany", "code": "DE"},
  // {"name": "Denmark", "code": "DK"},
  // {"name": "Estonia", "code": "EE"},
  // {"name": "Spain", "code": "ES"},
  // {"name": "Finland", "code": "FI"},
  // {"name": "Faroe Islands", "code": "FO"},
  // {"name": "France", "code": "FR"},
  // {"name": "United Kingdom", "code": "GB"},
  // {"name": "Guernsey", "code": "GG"},
  // {"name": "Greece", "code": "GR"},
  // {"name": "Croatia", "code": "HR"},
  // {"name": "Hungary", "code": "HU"},
  // {"name": "Ireland", "code": "IE"},
  // {"name": "Isle of Man", "code": "IM"},
  // {"name": "Iceland", "code": "IC"},
  // {"name": "Italy", "code": "IT"},
  // {"name": "Jersey", "code": "JE"},
  // {"name": "Liechtenstein", "code": "LI"},
  // {"name": "Lithuania", "code": "LT"},
  // {"name": "Luxembourg", "code": "LU"},
  // {"name": "Latvia", "code": "LV"},
  // {"name": "Monaco", "code": "MC"},
  // {"name": "Moldova, Republic of", "code": "MD"},
  // {"name": "Macedonia, The Former Yugoslav Republic of", "code": "MK"},
  // {"name": "Malta", "code": "MT"},
  // {"name": "Netherlands", "code": "NL"},
  // {"name": "Norway", "code": "NO"},
  // {"name": "Poland", "code": "PL"},
  // {"name": "Portugal", "code": "PT"},
  // {"name": "Romania", "code": "RO"},
  // {"name": "Russian Federation", "code": "RU"},
  // {"name": "Sweden", "code": "SE"},
  // {"name": "Slovenia", "code": "SI"},
  // {"name": "Svalbard and Jan Mayen", "code": "SJ"},
  // {"name": "Slovakia", "code": "SK"},
  // {"name": "San Marino", "code": "SM"},
  // {"name": "Ukraine", "code": "UA"},
  // {"name": "Holy See (Vatican City State)", "code": "VA"},
];
