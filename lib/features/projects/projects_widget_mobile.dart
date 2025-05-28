import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/features/common/widgets/app_no_data_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_section_widget.dart';
import 'package:imam_hossain/features/common/widgets/custom_grid_widget.dart';
import 'package:imam_hossain/features/projects/data/model/project_data.dart';
import 'package:imam_hossain/features/projects/data/project_data_service.dart';
import 'package:imam_hossain/features/projects/widgets/project_item_widget.dart';

import '../../core/utils/constants/sizes.dart';
import '../../di/di_setup.dart';
import '../../generated/localization/locale_keys.g.dart';

class ProjectsWidgetMobile extends StatelessWidget {
  const ProjectsWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final projectDataService = getIt<ProjectDataService>();
    projectDataService.fetchProjectData(context.locale);

    return AppSectionWidget(
      title: context.tr(LocaleKeys.projectsTitleSection),
      contentWidget: StreamBuilder<ProjectData>(
        stream: projectDataService.projects,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.projects.isEmpty) {
            return const AppNoDataWidget();
          }
          final projectData = snapshot.data!;
          return CustomGridWidget(
            columns: 1,
            horizontalSpacing: Sizes.px8,
            verticalSpacing: Sizes.px16,
            children: List.generate(
              projectData.projects.length,
              (index) {
                return ProjectItemWidget(
                  project: projectData.projects[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
