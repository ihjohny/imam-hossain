import 'package:flutter/material.dart';

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
    final maxWidth = MediaQuery.sizeOf(context).width;
    if (maxWidth < 640 && mobile != null) {
      return mobile!;
    } else if (maxWidth < 1024 && tablet != null) {
      return tablet!;
    } else {
      return desktop;
    }
  }
}
