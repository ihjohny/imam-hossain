import 'package:imam_hossain/features/common/data/model/app_image.dart';
import 'package:imam_hossain/features/common/data/model/app_tag.dart';

class Project {
  final String? name;
  final String? projectUrl;
  final AppImage? cover;
  final String? descriptionData;
  final String? responsibilityData;
  final String? technologyData;
  final List<AppTag>? tags;

  Project({
    this.name,
    this.projectUrl,
    this.cover,
    this.descriptionData,
    this.responsibilityData,
    this.technologyData,
    this.tags,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'],
      projectUrl: json['projectUrl'],
      cover: AppImage.fromJson(json['cover']),
      descriptionData: json['descriptionData'],
      responsibilityData: json['responsibilityData'],
      technologyData: json['technologyData'],
      tags: (json['tags'] as List?)?.map((e) => AppTag.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'projectUrl': projectUrl,
      'cover': cover?.toJson(),
      'descriptionData': descriptionData,
      'responsibilityData': responsibilityData,
      'technologyData': technologyData,
      'tags': tags?.map((e) => e.toJson()).toList(),
    };
  }
}
