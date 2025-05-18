import 'dart:ui';

import 'package:rxdart/rxdart.dart';

import '../../../core/localization/json_translation.dart';
import '../../../generated/localization/locale_keys.g.dart';
import 'model/about_data.dart';

class AboutDataService {
  final BehaviorSubject<AboutData> _aboutData = BehaviorSubject<AboutData>();

  Stream<AboutData> get aboutData => _aboutData.stream;

  Future<void> fetchAboutData(Locale locale) async {
    final jsonAboutData = trMap(locale, LocaleKeys.aboutData);
    if (jsonAboutData != null) {
      _aboutData.add(AboutData.fromJson(jsonAboutData));
    }
  }

  void dispose() {
    _aboutData.close();
  }
}
