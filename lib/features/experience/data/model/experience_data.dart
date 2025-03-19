import 'package:imam_hossain/features/experience/data/model/experience.dart';

class ExperienceData {
  final List<Experience> experiences;

  ExperienceData({required this.experiences});

  factory ExperienceData.fromJson(List<dynamic> json) {
    List<Experience> experiences =
        json.map((e) => Experience.fromJson(e)).toList();
    return ExperienceData(experiences: experiences);
  }

  List<Map<String, dynamic>> toJson() {
    return experiences.map((category) => category.toJson()).toList();
  }
}
