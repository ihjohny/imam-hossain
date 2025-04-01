import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';

extension LocalizedDateExt on int {
  String localizedYear(Locale locale) {
    return DateFormat.y(locale.languageCode).format(DateTime(this));
  }

  String localizedMonth(Locale locale) {
    return DateFormat.MMM(locale.languageCode).format(DateTime(0, this));
  }
}
