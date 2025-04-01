import 'package:flutter/material.dart';

extension ResponsiveExt on BuildContext {
  bool get isDesktop => MediaQuery.sizeOf(this).width >= 1024;

  bool get isTablet =>
      MediaQuery.sizeOf(this).width < 1024 &&
      MediaQuery.sizeOf(this).width >= 640;

  bool get isMobile => MediaQuery.sizeOf(this).width < 640;
}
