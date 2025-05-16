import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';

import '../../../core/utils/constants/sizes.dart';

class LogoIconWidget extends StatelessWidget {
  final Widget child;
  final String? tooltip;

  const LogoIconWidget({
    super.key,
    required this.child,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: Container(
        padding: const EdgeInsets.all(Sizes.px16),
        decoration: BoxDecoration(
          color: context.colorScheme.onPrimary.withValues(alpha: .2),
          borderRadius: BorderRadius.circular(Sizes.px12),
          border: Border.all(
            width: Sizes.px2,
            color: context.colorScheme.onPrimary,
          ),
        ),
        child: child,
      ),
    );
  }
}
