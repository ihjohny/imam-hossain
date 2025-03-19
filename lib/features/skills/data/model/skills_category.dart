import 'package:imam_hossain/features/common/data/model/technology.dart';

class SkillsCategory {
  final String title;
  final String colorTheme;
  final List<Technology> data;

  SkillsCategory({
    required this.title,
    required this.colorTheme,
    required this.data,
  });

  factory SkillsCategory.fromJson(Map<String, dynamic> json) {
    var skillList = json['data'] as List;
    List<Technology> dataList =
        skillList.map((e) => Technology.fromJson(e)).toList();
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
