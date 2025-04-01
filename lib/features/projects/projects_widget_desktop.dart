import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/features/common/widgets/custom_grid_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/projects/data/model/project_data.dart';
import 'package:imam_hossain/features/projects/data/project_data_service.dart';
import 'package:imam_hossain/features/projects/widgets/project_item_widget.dart';

import '../../di/di_setup.dart';
import '../../generated/localization/locale_keys.g.dart';

class ProjectsWidgetDesktop extends StatelessWidget {
  const ProjectsWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final projectDataService = getIt<ProjectDataService>();
    projectDataService.fetchProjectData(context.locale);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys.projectsTitleSection),
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFFBF5A55),
          ),
        ),
        const VerticalSpacing(16),
        StreamBuilder<ProjectData>(
          stream: projectDataService.projects,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.projects.isEmpty) {
              return Center(
                  child: Text(context.tr(LocaleKeys.noSkillsDataMSg)));
            }
            final projectData = snapshot.data!;
            return CustomGridWidget(
              columns: 2,
              horizontalSpacing: 8,
              verticalSpacing: 16,
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
      ],
    );
  }
}
