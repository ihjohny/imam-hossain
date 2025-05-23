import 'package:imam_hossain/features/common/data/model/app_image.dart';

import '../../../common/data/model/app_tag.dart';

class PersonalInfo {
  final AppImage? photo;
  final String? name;
  final String? positionTitle;
  final String? message;
  final List<AppTag>? tags;

  PersonalInfo({
    this.photo,
    this.name,
    this.positionTitle,
    this.message,
    this.tags,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      photo: AppImage.fromJson(json['photo']),
      name: json['name'],
      positionTitle: json['positionTitle'],
      message: json['message'],
      tags: (json['tags'] as List<dynamic>?)
          ?.map((tag) => AppTag.fromJson(tag))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'photo': photo?.toJson(),
        'name': name,
        'positionTitle': positionTitle,
        'message': message,
        'tags': tags?.map((tag) => tag.toJson()).toList(),
      };
}
