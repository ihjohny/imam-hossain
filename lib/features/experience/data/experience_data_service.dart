import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:imam_hossain/features/experience/data/model/experience_data.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/localization/json_list_translation.dart';
import '../../../generated/localization/locale_keys.g.dart';

class ExperienceDataService {
  final BehaviorSubject<ExperienceData> _experiences =
      BehaviorSubject<ExperienceData>();

  Stream<ExperienceData> get experiences => _experiences.stream;

  Future<void> fetchExperienceData(Locale locale) async {
    final jsonExperienceData = trList(locale, LocaleKeys.experienceData);
    _experiences.add(ExperienceData.fromJson(jsonExperienceData));
  }

  void dispose() {
    _experiences.close();
  }
}
