import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/constants/sizes.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/app_card_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_image_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_tag_chip_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_wrap_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/projects/data/model/project.dart';
import 'package:imam_hossain/features/projects/widgets/project_label_text_widget.dart';

import '../../../generated/localization/locale_keys.g.dart';
import '../../common/widgets/focused_content_widget.dart';

class ProjectItemWidget extends StatelessWidget {
  final Project project;

  const ProjectItemWidget({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return AppCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWrapWidget(
            children: project.tags
                    ?.map(
                      (item) => AppTagChipWidget(appTag: item),
                    )
                    .toList() ??
                [const AppEmptyWidget()],
          ),
          const VerticalSpacing(Sizes.px12),
          project.cover != null
              ? FocusedContentWidget(
                  child: AppImageWidget(
                    appImage: project.cover!,
                    width: double.infinity,
                    height: Sizes.px280,
                  ),
                )
              : const AppEmptyWidget(),
          const VerticalSpacing(Sizes.px12),
          Text(
            project.name ?? "",
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const VerticalSpacing(Sizes.px4),
          ProjectLabelTextWidget(
            label: context.tr(LocaleKeys.descriptionTitle),
            data: project.descriptionData,
          ),
          const VerticalSpacing(Sizes.px4),
          ProjectLabelTextWidget(
            label: context.tr(LocaleKeys.responsibilityTitle),
            data: project.responsibilityData,
          ),
          const VerticalSpacing(Sizes.px4),
          ProjectLabelTextWidget(
            label: context.tr(LocaleKeys.technologyTitle),
            data: project.technologyData,
          ),
        ],
      ),
    );
  }
}
