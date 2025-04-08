import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/core/utils/helper/helper_utils.dart';
import 'package:imam_hossain/features/top_bar/widgets/nav_item_widget.dart';
import 'package:imam_hossain/generated/localization/locale_keys.g.dart';

import '../../core/navigation/navigation_keys.dart';
import '../../di/di_setup.dart';

class TopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationKeys = getIt<NavigationKeys>();

    return AppBar(
      backgroundColor: context.colorScheme.onPrimary.withValues(alpha: .3),
      elevation: 2,
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(color: Colors.transparent),
        ),
      ),
      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavItemWidget(
              text: context.tr(LocaleKeys.aboutTitleToolbar),
              onClick: () {
                scrollToPosition(navigationKeys.aboutKey);
              },
            ),
            NavItemWidget(
              text: context.tr(LocaleKeys.skillsTitleToolbar),
              onClick: () {
                scrollToPosition(navigationKeys.skillsKey);
              },
            ),
            NavItemWidget(
              text: context.tr(LocaleKeys.experienceTitleToolbar),
              onClick: () {
                scrollToPosition(navigationKeys.experienceKey);
              },
            ),
            NavItemWidget(
              text: context.tr(LocaleKeys.projectsTitleToolbar),
              onClick: () {
                scrollToPosition(navigationKeys.projectsKey);
              },
            ),
            NavItemWidget(
              text: context.tr(LocaleKeys.publicationsTitleToolbar),
              onClick: () {
                scrollToPosition(navigationKeys.publicationsKey);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
