import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/skills/data/model/skills_category.dart';

import '../../common/widgets/item_chip_widget.dart';

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
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: category.data
                .map(
                  (item) => ItemChipWidget(
                    label: item.name,
                    backgroundColor: category.colorTheme.toColor,
                    textColor: Colors.black87,
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
