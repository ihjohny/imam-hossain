import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/constants/sizes.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/about/about_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/experience/experience_widget.dart';
import 'package:imam_hossain/features/footer/footer_widget.dart';
import 'package:imam_hossain/features/personal_info/personal_info_widget.dart';
import 'package:imam_hossain/features/projects/projects_widget.dart';
import 'package:imam_hossain/features/publications/publications_widget.dart';
import 'package:imam_hossain/features/skills/skills_widget.dart';
import 'package:imam_hossain/features/top_bar/top_bar_widget_desktop.dart';

import '../../core/navigation/navigation_keys.dart';
import '../../di/di_setup.dart';
import '../certifications/certifications_widget.dart';

class DashboardWidgetDesktop extends StatelessWidget {
  const DashboardWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationKeyMap = getIt<NavigationKeys>().keyMap;
    final scrollController = getIt<ScrollController>();

    return Scaffold(
      body: SafeArea(
        child: _buildDashboardBody(
          context,
          navigationKeyMap: navigationKeyMap,
          scrollController: scrollController,
        ),
      ),
    );
  }

  Widget _buildDashboardBody(
    BuildContext context, {
    required Map<String, GlobalKey> navigationKeyMap,
    required ScrollController scrollController,
  }) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.33,
          height: double.infinity,
          child: const PersonalInfoWidget(),
        ),
        Expanded(
          child: Column(
            children: [
              const TopBarWidgetDesktop(),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.all(Sizes.px24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AboutWidget(
                              key: navigationKeyMap[NavigationKeys.about],
                            ),
                            const VerticalSpacing(Sizes.px12),
                            SkillsWidget(
                              key: navigationKeyMap[NavigationKeys.skills],
                            ),
                            const VerticalSpacing(Sizes.px12),
                            ExperienceWidget(
                              key: navigationKeyMap[NavigationKeys.experience],
                            ),
                            const VerticalSpacing(Sizes.px12),
                            ProjectsWidget(
                              key: navigationKeyMap[NavigationKeys.projects],
                            ),
                            const VerticalSpacing(Sizes.px12),
                            PublicationsWidget(
                              key:
                                  navigationKeyMap[NavigationKeys.publications],
                            ),
                            const VerticalSpacing(Sizes.px12),
                            CertificationsWidget(
                              key: navigationKeyMap[
                                  NavigationKeys.certifications],
                            ),
                            const VerticalSpacing(Sizes.px12),
                            const VerticalSpacing(kBottomNavigationBarHeight),
                          ],
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: FooterWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
