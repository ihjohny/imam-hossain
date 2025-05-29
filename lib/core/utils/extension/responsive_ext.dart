import 'package:flutter/material.dart';

extension ResponsiveExt on BuildContext {
  bool get isDesktop => MediaQuery.sizeOf(this).width >= 1024;

  bool get isTablet =>
      MediaQuery.sizeOf(this).width < 1024 &&
      MediaQuery.sizeOf(this).width >= 640;

  bool get isMobileOrTablet => MediaQuery.sizeOf(this).width < 1024;

  bool get isMobile => MediaQuery.sizeOf(this).width < 640;

  String get deviceType {
    if (isDesktop) return "desktop";
    if (isTablet) return "tablet";
    if (isMobile) return "mobile";
    if (isMobileOrTablet) return "mobile_or_tablet";
    return "unknown";
  }
}
