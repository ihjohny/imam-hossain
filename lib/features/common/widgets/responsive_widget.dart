import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/responsive_ext.dart';

class Responsive extends StatelessWidget {
  final Widget desktop;
  final Widget? tablet;
  final Widget? mobile;

  const Responsive({
    super.key,
    required this.desktop,
    this.tablet,
    this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isMobile && mobile != null) {
      return mobile!;
    } else if (context.isMobileOrTablet && tablet != null) {
      return tablet!;
    } else {
      return desktop;
    }
  }
}
