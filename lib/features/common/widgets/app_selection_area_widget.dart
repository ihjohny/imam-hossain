import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';

class AppSelectionAreaWidget extends StatelessWidget {
  const AppSelectionAreaWidget({
    super.key,
    required this.child,
    this.mouseCursor = WidgetStateMouseCursor.textable,
  });

  final Widget child;
  final MouseCursor mouseCursor;

  @override
  Widget build(BuildContext context) {
    return DefaultSelectionStyle(
      selectionColor: context.colorScheme.tertiary,
      mouseCursor: mouseCursor,
      child: SelectionArea(
        child: child,
      ),
    );
  }
}
