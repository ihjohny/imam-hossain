import 'package:flutter/material.dart';
import 'package:imam_hossain/core/navigation/navigation_keys.dart';
import 'package:imam_hossain/core/utils/constants/sizes.dart';
import 'package:imam_hossain/di/di_setup.dart';
import 'package:imam_hossain/features/about/about_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_animated_fade_slide_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/experience/experience_widget.dart';
import 'package:imam_hossain/features/footer/footer_widget.dart';
import 'package:imam_hossain/features/personal_info/personal_info_widget.dart';
import 'package:imam_hossain/features/projects/projects_widget.dart';
import 'package:imam_hossain/features/publications/publications_widget.dart';
import 'package:imam_hossain/features/skills/skills_widget.dart';
import 'package:imam_hossain/features/top_bar/widgets/app_drawer_widget.dart';

import '../certifications/certifications_widget.dart';
import '../top_bar/top_bar_widget_mobile.dart';

class DashboardWidgetMobile extends StatelessWidget {
  const DashboardWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationKeyMap = getIt<NavigationKeys>().keyMap;
    final scrollController = getIt<ScrollController>();

    return Scaffold(
      appBar: const TopBarWidgetMobile(),
      drawer: const AppDrawerWidget(),
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
    return AppAnimatedFadeSlideWidget(
      offset: const Offset(-100, 0),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PersonalInfoWidget(
                        key: navigationKeyMap[NavigationKeys.profile],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Sizes.px16),
                        child: Column(
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
                    ],
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
    );
  }
}
