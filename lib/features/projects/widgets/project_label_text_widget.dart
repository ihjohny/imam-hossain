import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/string_ext.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';

class ProjectLabelTextWidget extends StatelessWidget {
  final String? label;
  final String? data;

  const ProjectLabelTextWidget({
    super.key,
    this.label,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          if (!label.isNullOrEmpty)
            TextSpan(
              text: '$label ',
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          if (!data.isNullOrEmpty)
            TextSpan(
              text: data,
              style: context.textTheme.titleSmall?.copyWith(
                color: context.themeData.colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      ),
    );
  }
}
