import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/constants/sizes.dart';

class AppWrapWidget extends StatelessWidget {
  const AppWrapWidget({
    super.key,
    required this.children,
    this.spacing = Sizes.px8,
    this.runSpacing = Sizes.px8,
  });

  final List<Widget> children;
  final double spacing;
  final double runSpacing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: children,
    );
  }
}
