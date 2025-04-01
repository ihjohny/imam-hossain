import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_image_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_tag_chip_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/projects/data/model/project.dart';
import 'package:imam_hossain/features/projects/widgets/project_label_text_widget.dart';

class ProjectItemWidget extends StatelessWidget {
  final Project project;

  const ProjectItemWidget({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project.tags
                      ?.map(
                        (item) => AppTagChipWidget(appTag: item),
                      )
                      .toList() ??
                  [const AppEmptyWidget()],
            ),
            const VerticalSpacing(12),
            project.cover != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AppImageWidget(
                      appImage: project.cover!,
                      width: double.infinity,
                      height: 280,
                    ),
                  )
                : const AppEmptyWidget(),
            const VerticalSpacing(12),
            Text(
              project.name ?? "",
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const VerticalSpacing(4),
            ProjectLabelTextWidget(
              label: project.descriptionTitle,
              data: project.descriptionData,
            ),
            const VerticalSpacing(4),
            ProjectLabelTextWidget(
              label: project.responsibilityTitle,
              data: project.responsibilityData,
            ),
            const VerticalSpacing(4),
            ProjectLabelTextWidget(
              label: project.technologyTitle,
              data: project.technologyData,
            ),
          ],
        ),
      ),
    );
  }
}
