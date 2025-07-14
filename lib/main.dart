import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imam_hossain/app/app_init/app_init_widget.dart';
import 'package:imam_hossain/app/application.dart';
import 'package:imam_hossain/di/di_setup.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/localization/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  setPathUrlStrategy();
  setupServices();
  await _preloadCriticalAssets();
  
  final supportedLocales = AppLocalizations.supportedLocales();

  runApp(
    AppInitWidget(
      onLoaded: (context) {
        return EasyLocalization(
          supportedLocales: supportedLocales,
          path: AppLocalizations.translationsPath,
          fallbackLocale: supportedLocales.first,
          useFallbackTranslations: true,
          saveLocale: false,
          child: const Application(),
        );
      },
    ),
  );
}

// Preload only critical assets to reduce initial bundle size
Future<void> _preloadCriticalAssets() async {
  try {
    await Future.wait([
      rootBundle.load('assets/fonts/FontAwesome.ttf'),
      // Add other critical assets here
    ]);
  } catch (e) {
    debugPrint('Asset preloading error: $e');
  }
}
