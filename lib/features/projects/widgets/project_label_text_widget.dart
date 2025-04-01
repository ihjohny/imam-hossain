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
        style: context.textTheme.bodyMedium,
        children: [
          if (!label.isNullOrEmpty)
            TextSpan(
              text: '$label ',
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          // add to to add space here if label and data not null
          if (!data.isNullOrEmpty) TextSpan(text: data),
        ],
      ),
    );
  }
}
