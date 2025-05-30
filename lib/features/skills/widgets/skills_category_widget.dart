import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/app_chip_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_wrap_widget.dart';
import 'package:imam_hossain/features/skills/data/model/skills_category.dart';

import '../../../core/utils/constants/sizes.dart';

class SkillsCategoryWidget extends StatelessWidget {
  final SkillsCategory category;

  const SkillsCategoryWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.title,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: Sizes.px8),
          AppWrapWidget(
            children: category.data
                .map(
                  (item) => AppChipWidget(
                    label: item.name,
                    backgroundColor: category.colorTheme.toColor,
                    textColor: context.themeData.colorScheme.onSecondaryFixedVariant,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
