import 'package:flutter/material.dart';
import 'package:imam_hossain/features/about/about_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/experience/experience_widget.dart';
import 'package:imam_hossain/features/personal_info/personal_info_widget.dart';
import 'package:imam_hossain/features/projects/projects_widget.dart';
import 'package:imam_hossain/features/publications/publications_widget.dart';
import 'package:imam_hossain/features/skills/skills_widget.dart';
import 'package:imam_hossain/features/top_bar/top_bar_widget.dart';

import '../../core/navigation/navigation_keys.dart';
import '../../di/di_setup.dart';

class DashboardWidgetDesktop extends StatelessWidget {
  const DashboardWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationKeys = getIt<NavigationKeys>();

    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.33,
          child: const PersonalInfoWidget(),
        ),
        Expanded(
          child: Column(
            children: [
              const TopBarWidget(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AboutWidget(
                          key: navigationKeys.aboutKey,
                        ),
                        const VerticalSpacing(16),
                        SkillsWidget(
                          key: navigationKeys.skillsKey,
                        ),
                        const VerticalSpacing(16),
                        ExperienceWidget(
                          key: navigationKeys.experienceKey,
                        ),
                        const VerticalSpacing(16),
                        ProjectsWidget(
                          key: navigationKeys.projectsKey,
                        ),
                        const VerticalSpacing(16),
                        PublicationsWidget(
                          key: navigationKeys.publicationsKey,
                        ),
                        const VerticalSpacing(16),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
