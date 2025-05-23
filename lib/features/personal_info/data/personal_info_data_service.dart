import 'dart:ui';

import 'package:imam_hossain/features/personal_info/data/model/personal_info.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/localization/json_translation.dart';
import '../../../generated/localization/locale_keys.g.dart';

class PersonalInfoDataService {
  final BehaviorSubject<PersonalInfo> _personalInfo =
      BehaviorSubject<PersonalInfo>();

  Stream<PersonalInfo> get personalInfo => _personalInfo.stream;

  Future<void> fetchPersonalInfoData(Locale locale) async {
    final jsonPersonalInfoData = trMap(locale, LocaleKeys.personalInfoData);
    if (jsonPersonalInfoData != null) {
      _personalInfo.add(PersonalInfo.fromJson(jsonPersonalInfoData));
    }
  }

  void dispose() {
    _personalInfo.close();
  }
}
