import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';

import '../../common/widgets/app_empty_widget.dart';
import '../../top_bar/widgets/app_theme_switch_widget.dart';

class PersonalInfoTopBarWidgetDesktop extends StatelessWidget {
  const PersonalInfoTopBarWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [AppEmptyWidget()],
      primary: false,
      backgroundColor: context.colorScheme.primary,
      title: const AppEmptyWidget(),
      leading: const AppThemeSwitchWidget(),
    );
  }
}
