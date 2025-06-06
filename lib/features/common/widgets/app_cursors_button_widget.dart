import 'package:flutter/material.dart';
import 'package:imam_hossain/features/common/widgets/app_selection_area_widget.dart';

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
    return MouseRegion(
      cursor: onPressed != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: onPressed ?? () {},
        child: AppSelectionAreaWidget(
          mouseCursor: onPressed != null
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          child: child,
        ),
      ),
    );
  }
}
