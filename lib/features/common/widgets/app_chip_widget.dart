import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/string_ext.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';

import 'app_cursors_button_widget.dart';

class AppChipWidget extends StatelessWidget {
  final String? label;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? leading;
  final VoidCallback? onPressed;

  const AppChipWidget({
    super.key,
    this.label,
    this.backgroundColor,
    this.textColor,
    this.leading,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppCursorsButtonWidget(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) leading!,
            if (!label.isNullOrEmpty)
              Padding(
                padding: EdgeInsets.only(left: leading != null ? 8.0 : 0),
                child: Text(
                  label ?? "",
                  style: context.textTheme.labelLarge?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
