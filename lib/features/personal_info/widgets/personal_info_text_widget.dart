import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';

import '../../../core/utils/constants/sizes.dart';

class PersonalInfoText extends StatelessWidget {
  final String? name;
  final String? positionTitle;
  final String? message;
  const PersonalInfoText(
      {super.key, this.name, this.positionTitle, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name ?? '',
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        spaceH12,
        Text(
          positionTitle ?? '',
          style: context.themeData.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: context.colorScheme.onPrimary,
          ),
        ),
        spaceH12,
        Text(
          message ?? '',
          style: context.themeData.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
