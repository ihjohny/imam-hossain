import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/constants/sizes.dart';

class AppWrapWidget extends StatelessWidget {
  const AppWrapWidget({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Sizes.px8,
      runSpacing: Sizes.px8,
      children: children,
    );
  }
}
