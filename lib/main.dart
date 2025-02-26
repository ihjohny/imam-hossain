import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imam_hossain/app/app_init/app_init_widget.dart';
import 'package:imam_hossain/app/application.dart';
import 'package:imam_hossain/di/di_setup.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/localization/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  setPathUrlStrategy();
  GoogleFonts.config.allowRuntimeFetching = false;
  setupServices();
  final supportedLocales = await AppLocalizations.supportedLocales();

  runApp(
    AppInitWidget(
      onLoaded: (context) {
        return EasyLocalization(
          supportedLocales: supportedLocales,
          path: AppLocalizations.translationsPath,
          fallbackLocale: supportedLocales.first,
          child: const Application(),
        );
      },
    ),
  );
}
