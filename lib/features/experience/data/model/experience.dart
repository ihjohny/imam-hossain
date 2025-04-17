import 'package:imam_hossain/features/common/data/model/duration_period.dart';

import '../../../common/data/model/app_image.dart';
import '../../../common/data/model/technology.dart';

class Experience {
  final String? role;
  final String? company;
  final String? companyLink;
  final AppImage? cover;
  final String? place;
  final String? description;
  final DurationPeriod? durationPeriod;
  final List<Technology>? technologies;

  Experience({
    this.role,
    this.company,
    this.companyLink,
    this.cover,
    this.place,
    this.description,
    this.durationPeriod,
    this.technologies,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      role: json['role'] as String?,
      company: json['company'] as String?,
      companyLink: json['companyLink'] as String?,
      cover: json['cover'] != null
          ? AppImage.fromJson(json['cover'] as Map<String, dynamic>)
          : null,
      place: json['place'] as String?,
      description: json['description'] as String?,
      durationPeriod: json['durationPeriod'] != null
          ? DurationPeriod.fromJson(
              json['durationPeriod'] as Map<String, dynamic>)
          : null,
      technologies: (json['technologies'] as List?)
          ?.map((tech) => Technology.fromJson(tech as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'company': company,
      'companyLink': companyLink,
      'cover': cover?.toJson(),
      'place': place,
      'description': description,
      'durationPeriod': durationPeriod?.toJson(),
      'technologies': technologies?.map((tech) => tech.toJson()).toList(),
    };
  }
}
