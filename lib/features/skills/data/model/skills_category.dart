import 'package:imam_hossain/features/skills/data/model/skill_item.dart';

class SkillsCategory {
  final String title;
  final String colorTheme;
  final List<SkillItem> data;

  SkillsCategory({
    required this.title,
    required this.colorTheme,
    required this.data,
  });

  factory SkillsCategory.fromJson(Map<String, dynamic> json) {
    var skillList = json['data'] as List;
    List<SkillItem> dataList =
        skillList.map((e) => SkillItem.fromJson(e)).toList();
    return SkillsCategory(
      title: json['title'] as String,
      colorTheme: json['colorTheme'] as String,
      data: dataList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'colorTheme': colorTheme,
      'data': data.map((skill) => skill.toJson()).toList(),
    };
  }
}
