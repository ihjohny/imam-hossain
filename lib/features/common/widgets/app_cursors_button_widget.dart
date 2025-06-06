import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';

class AppCursorsButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const AppCursorsButtonWidget({
    super.key,
    this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultSelectionStyle(
      selectionColor: context.colorScheme.tertiary,
      mouseCursor: MouseCursor.defer,
      child: MouseRegion(
        cursor: onPressed != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: GestureDetector(
          onTap: onPressed ?? () {},
          child: child,
        ),
      ),
    );
  }
}
