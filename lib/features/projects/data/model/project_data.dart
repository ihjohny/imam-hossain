import 'package:imam_hossain/features/projects/data/model/project.dart';

class ProjectData {
  final List<Project> projects;

  ProjectData({required this.projects});

  factory ProjectData.fromJson(List<dynamic> json) {
    List<Project> projects = json.map((e) => Project.fromJson(e)).toList();
    return ProjectData(projects: projects);
  }

  List<Map<String, dynamic>> toJson() {
    return projects.map((project) => project.toJson()).toList();
  }
}
