import 'package:flutter/material.dart';
import 'package:imam_hossain/features/common/widgets/horizontal_spacing.dart';
import 'package:imam_hossain/features/top_bar/widgets/app_color_switch_widget.dart';

import '../../../core/utils/constants/sizes.dart';
import 'app_theme_switch_widget.dart';

class TopBarActionsWidget extends StatelessWidget {
  const TopBarActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: Sizes.px12),
      child: Row(
        children: [
          AppThemeSwitchWidget(),
          HorizontalSpacing(Sizes.px12),
          AppColorSwitchWidget(),
        ],
      ),
    );
  }
}
