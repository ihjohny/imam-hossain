import '../../../common/data/model/app_tag.dart';

class AboutData {
  final String? details;
  final List<AppTag>? tags;

  AboutData({
    this.details,
    this.tags,
  });

  factory AboutData.fromJson(Map<String, dynamic> json) {
    return AboutData(
      details: json['details'],
      tags: (json['tags'] as List<dynamic>?)
          ?.map((tag) => AppTag.fromJson(tag))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'details': details,
        'tags': tags?.map((tag) => tag.toJson()).toList(),
      };
}
