import 'package:flutter/material.dart';
import 'package:imam_hossain/features/common/widgets/app_cursors_button_widget.dart';

import '../../../core/theme/app_theme_service.dart';
import '../../../di/di_setup.dart';

class AppThemeSwitchWidget extends StatefulWidget {
  const AppThemeSwitchWidget({super.key});

  @override
  State<AppThemeSwitchWidget> createState() => _AppThemeSwitchWidgetState();
}

class _AppThemeSwitchWidgetState extends State<AppThemeSwitchWidget> {
  final themeService = getIt<AppThemeService>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: themeService.isDarkModeStream,
      builder: (context, snapshot) {
        final isDarkMode = snapshot.data ?? false;
        return AppCursorsButtonWidget(
          child: isDarkMode
              ? const Icon(Icons.light_mode_outlined)
              : const Icon(Icons.dark_mode_outlined),
          onPressed: () {
            themeService.toggleTheme();
          },
        );
      },
    );
  }
}
