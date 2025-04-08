import 'package:imam_hossain/features/common/data/model/app_tag.dart';

class Publication {
  final String? title;
  final String? subtitle;
  final String? url;
  final String? description;
  final List<AppTag>? tags;

  Publication({
    this.title,
    this.subtitle,
    this.url,
    this.description,
    this.tags,
  });

  factory Publication.fromJson(Map<String, dynamic> json) {
    return Publication(
      title: json['title'],
      subtitle: json['subtitle'],
      url: json['url'],
      description: json['description'],
      tags: (json['tags'] as List<dynamic>?)
          ?.map((tag) => AppTag.fromJson(tag))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'subtitle': subtitle,
        'url': url,
        'description': description,
        'tags': tags?.map((tag) => tag.toJson()).toList(),
      };
}
