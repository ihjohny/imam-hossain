import 'package:imam_hossain/features/common/data/model/app_tag.dart';

import 'company.dart';
import 'role.dart';
import '../../../common/data/model/app_image.dart';

class Experience {
  final Company? company;
  final List<Role>? roles;
  final AppImage? cover;
  final List<String>? responsibilities;
  final List<AppTag>? tags;

  Experience({
    this.company,
    this.roles,
    this.cover,
    this.responsibilities,
    this.tags,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      company: json['company'] != null
          ? Company.fromJson(json['company'] as Map<String, dynamic>)
          : null,
      roles: (json['roles'] as List?)
          ?.map((role) => Role.fromJson(role as Map<String, dynamic>))
          .toList(),
      cover: json['cover'] != null
          ? AppImage.fromJson(json['cover'] as Map<String, dynamic>)
          : null,
      responsibilities:
          (json['responsibilities'] as List?)?.map((e) => e as String).toList(),
      tags: (json['tags'] as List?)
          ?.map((tag) => AppTag.fromJson(tag as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'company': company?.toJson(),
        'roles': roles?.map((r) => r.toJson()).toList(),
        'cover': cover?.toJson(),
        'responsibilities': responsibilities,
        'tags': tags?.map((t) => t.toJson()).toList(),
      };
}
