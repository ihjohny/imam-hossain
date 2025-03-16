import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:imam_hossain/features/skills/data/model/skills_category.dart';
import 'package:imam_hossain/features/skills/data/model/skills_data.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/localization/json_list_translation.dart';
import '../../../generated/localization/locale_keys.g.dart';

class SkillsDataService {
  final BehaviorSubject<SkillsData> _skillsCategories =
      BehaviorSubject<SkillsData>();

  Stream<SkillsData> get skillsCategories => _skillsCategories.stream;

  Future<void> fetchSkillsData(Locale locale) async {
    final jsonSkillsData = trList(locale, LocaleKeys.skillsData);
    final skillsCategories = jsonSkillsData.map((skillsCategory) {
      return SkillsCategory.fromJson(skillsCategory);
    }).toList();

    _skillsCategories.add(SkillsData(skillsCategories: skillsCategories));
  }

  void dispose() {
    _skillsCategories.close();
  }
}
