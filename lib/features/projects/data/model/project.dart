import 'package:imam_hossain/features/common/data/model/app_image.dart';
import 'package:imam_hossain/features/common/data/model/app_tag.dart';

class Project {
  final String? name;
  final String? projectUrl;
  final AppImage? cover;
  final String? descriptionTitle;
  final String? descriptionData;
  final String? responsibilityTitle;
  final String? responsibilityData;
  final String? technologyTitle;
  final String? technologyData;
  final List<AppTag>? tags;

  Project({
    this.name,
    this.projectUrl,
    this.cover,
    this.descriptionTitle,
    this.descriptionData,
    this.responsibilityTitle,
    this.responsibilityData,
    this.technologyTitle,
    this.technologyData,
    this.tags,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'],
      projectUrl: json['projectUrl'],
      cover: AppImage.fromJson(json['cover']),
      descriptionTitle: json['descriptionTitle'],
      descriptionData: json['descriptionData'],
      responsibilityTitle: json['responsibilityTitle'],
      responsibilityData: json['responsibilityData'],
      technologyTitle: json['technologyTitle'],
      technologyData: json['technologyData'],
      tags: (json['tags'] as List?)?.map((e) => AppTag.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'projectUrl': projectUrl,
      'cover': cover?.toJson(),
      'descriptionTitle': descriptionTitle,
      'descriptionData': descriptionData,
      'responsibilityTitle': responsibilityTitle,
      'responsibilityData': responsibilityData,
      'technologyTitle': technologyTitle,
      'technologyData': technologyData,
      'tags': tags?.map((e) => e.toJson()).toList(),
    };
  }
}
