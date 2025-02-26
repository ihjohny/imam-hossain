import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/theme/app_theme.dart';

import '../core/localization/generated/locale_keys.g.dart';
import '../core/theme/app_theme_service.dart';
import '../di/di_setup.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = getIt<AppThemeService>();

    return StreamBuilder<bool>(
      stream: themeService.isDarkModeStream,
      initialData: themeService.isDarkMode,
      builder: (context, snapshot) {
        final isDarkMode = snapshot.data ?? false;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (_) => tr(LocaleKeys.name),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const Text("Loaded"),
        );
      },
    );
  }
}
