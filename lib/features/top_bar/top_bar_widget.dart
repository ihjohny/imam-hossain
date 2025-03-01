import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/top_bar/widgets/nav_item_widget.dart';

class TopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              text: 'About',
              onClick: () {},
            ),
            NavItemWidget(
              text: 'Skills',
              onClick: () {},
            ),
            NavItemWidget(
              text: 'Projects',
              onClick: () {},
            ),
            NavItemWidget(
              text: 'Credentials',
              onClick: () {},
            ),
            NavItemWidget(
              text: 'Contact',
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
