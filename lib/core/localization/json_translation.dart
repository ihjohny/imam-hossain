import 'dart:ui';

import '../../generated/localization/locale_json.g.dart';

List<Map<String, dynamic>> trList(Locale locale, String key) {
  final mapLocales = CodegenLoader.mapLocales[locale.languageCode];
  final mapValue = mapLocales?[key];
  return mapValue;
}

Map<String, dynamic>? trMap(Locale locale, String key) {
  final mapLocales = CodegenLoader.mapLocales[locale.languageCode];
  final mapValue = mapLocales?[key];
  if (mapValue is Map<String, dynamic>) {
    return mapValue;
  }
  return null;
}

String? trString(Locale locale, String key) {
  final mapLocales = CodegenLoader.mapLocales[locale.languageCode];
  final mapValue = mapLocales?[key];
  if (mapValue is String) {
    return mapValue;
  }
  return null;
}
