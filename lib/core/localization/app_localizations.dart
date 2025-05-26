import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as path;

class AppLocalizations {
  static const translationsPath = "assets/translations";

  static List<Locale> supportedLocales() {
    return const [Locale('en')];
  }
}
