import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:imam_hossain/features/skills/data/model/skills_data.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/localization/json_translation.dart';
import '../../../generated/localization/locale_keys.g.dart';

class SkillsDataService {
  final BehaviorSubject<SkillsData> _skillsCategories =
      BehaviorSubject<SkillsData>();

  Stream<SkillsData> get skillsCategories => _skillsCategories.stream;

  Future<void> fetchSkillsData(Locale locale) async {
    final jsonSkillsData = trList(locale, LocaleKeys.skillsData);
    _skillsCategories.add(SkillsData.fromJson(jsonSkillsData));
  }

  void dispose() {
    _skillsCategories.close();
  }
}
