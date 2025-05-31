import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/theme/app_theme.dart';
import 'package:imam_hossain/features/dashboard/dashboard_screen.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

import '../generated/localization/locale_keys.g.dart';
import '../core/theme/app_theme_service.dart';
import '../di/di_setup.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = getIt<AppThemeService>();
    return StreamBuilder<Tuple2<bool, FlexScheme>>(
      stream: Rx.combineLatest2<bool, FlexScheme, Tuple2<bool, FlexScheme>>(
        themeService.isDarkModeStream,
        themeService.colorSchemeStream,
        (isDark, scheme) => Tuple2(isDark, scheme),
      ),
      builder: (context, snapshot) {
        final isDarkMode = snapshot.data?.item1 ?? false;
        final scheme = snapshot.data?.item2;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (_) => tr(LocaleKeys.appName),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheme.light(scheme),
          darkTheme: AppTheme.dark(scheme),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const DashboardScreen(),
        );
      },
    );
  }
}
