import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_theme_service.dart';
import '../../../di/di_setup.dart';
import '../../common/widgets/app_cursors_button_widget.dart';

class AppColorSwitchWidget extends StatelessWidget {
  const AppColorSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = getIt<AppThemeService>();

    return AppCursorsButtonWidget(
      child: const Icon(Icons.color_lens_sharp),
      onPressed: () {
        themeService.updateColorScheme(FlexScheme.barossa);
      },
    );
  }
}
