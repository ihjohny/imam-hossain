import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/constants/sizes.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_selection_area_widget.dart';
import 'package:imam_hossain/features/common/widgets/horizontal_spacing.dart';

class ExperienceResponsibilitiesSectionWidget extends StatelessWidget {
  final List<String>? responsibilities;

  const ExperienceResponsibilitiesSectionWidget({
    super.key,
    required this.responsibilities,
  });

  @override
  Widget build(BuildContext context) {
    if (responsibilities == null || responsibilities!.isEmpty) {
      return const AppEmptyWidget();
    }

    return AppSelectionAreaWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          responsibilities!.length,
          (i) => Padding(
            padding: EdgeInsets.only(
              bottom: i < responsibilities!.length - 1 ? Sizes.px4 : 0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.check,
                  size: Sizes.px24,
                  color: context.themeData.colorScheme.primary,
                ),
                const HorizontalSpacing(Sizes.px4),
                Expanded(
                  child: Text(
                    responsibilities![i],
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.themeData.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
