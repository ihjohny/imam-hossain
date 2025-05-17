import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import '../../../core/utils/constants/sizes.dart';

class AppSectionWidget extends StatelessWidget {
  const AppSectionWidget({
    super.key,
    required this.title,
    required this.contentWidget,
  });

  final String title;
  final Widget contentWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context, title),
        contentWidget,
      ],
    );
  }

  Widget _buildTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.px12),
      child: Text(
        title,
        style: context.themeData.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: context.themeData.colorScheme.primary,
        ),
      ),
    );
  }
}
