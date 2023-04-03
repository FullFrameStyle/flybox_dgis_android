enum AppPages {
  root,
  login,

  company,

  courier,
  courierProfile,

  supportService,

  shiftPaymentsInfomation,

  qrCodeScanner
}

extension AppPageExtension on AppPages {
  String get routePath {
    switch (this) {
      case AppPages.root:
        return "/";
      case AppPages.login:
        return "/login";
      case AppPages.company:
        return "/company";
      case AppPages.courier:
        return "/courier";
      case AppPages.courierProfile:
        return "profile";
      case AppPages.supportService:
        return "supportService";
      case AppPages.shiftPaymentsInfomation:
        return "shiftPaymentsInfomation";
      case AppPages.qrCodeScanner:
        return "qrCodeScanner";
      default:
        return "/";
    }
  }

  String get routeName {
    switch (this) {
      case AppPages.login:
        return "login";
      case AppPages.company:
        return "company";
      case AppPages.courier:
        return "courier";
      case AppPages.courierProfile:
        return "courierProfile";
      case AppPages.supportService:
        return "supportService";
      case AppPages.shiftPaymentsInfomation:
        return "shiftPaymentsInfomation";
      case AppPages.qrCodeScanner:
        return "qrCodeScanner";
      default:
        return "login";
    }
  }
}
