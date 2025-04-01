import '../../../common/data/model/app_image.dart';
import '../../../common/data/model/technology.dart';

class Experience {
  final String? role;
  final String? company;
  final String? companyLink;
  final AppImage? cover;
  final String? place;
  final String? description;
  final bool? isPresent;
  final int? startYear;
  final int? startMonth;
  final int? endYear;
  final int? endMonth;
  final List<Technology>? technologies;

  Experience({
    this.role,
    this.company,
    this.companyLink,
    this.cover,
    this.place,
    this.description,
    this.isPresent,
    this.startYear,
    this.startMonth,
    this.endYear,
    this.endMonth,
    this.technologies,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      role: json['role'] as String?,
      company: json['company'] as String?,
      companyLink: json['companyLink'] as String?,
      cover: AppImage.fromJson(json['cover']),
      place: json['place'] as String?,
      description: json['description'] as String?,
      isPresent: json['isPresent'] as bool?,
      startYear: json['startYear'] as int?,
      startMonth: json['startMonth'] as int?,
      endYear: json['endYear'] as int?,
      endMonth: json['endMonth'] as int?,
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
      'isPresent': isPresent,
      'startYear': startYear,
      'startMonth': startMonth,
      'endYear': endYear,
      'endMonth': endMonth,
      'technologies': technologies?.map((tech) => tech.toJson()).toList(),
    };
  }
}
