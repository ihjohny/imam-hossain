import 'skills_category.dart';

class SkillsData {
  final List<SkillsCategory> skillsCategories;

  SkillsData({required this.skillsCategories});

  factory SkillsData.fromJson(List<dynamic> json) {
    List<SkillsCategory> skillCategories =
        json.map((e) => SkillsCategory.fromJson(e)).toList();
    return SkillsData(skillsCategories: skillCategories);
  }

  List<Map<String, dynamic>> toJson() {
    return skillsCategories.map((category) => category.toJson()).toList();
  }
}
