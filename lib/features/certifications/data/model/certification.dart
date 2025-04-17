import 'package:imam_hossain/features/common/data/model/app_tag.dart';

import '../../../common/data/model/duration_period.dart';

class Certification {
  final String? title;
  final String? subtitle;
  final String? url;
  final DurationPeriod? durationPeriod;
  final List<AppTag>? tags;

  Certification({
    this.title,
    this.subtitle,
    this.url,
    this.durationPeriod,
    this.tags,
  });

  factory Certification.fromJson(Map<String, dynamic> json) {
    return Certification(
      title: json['title'],
      subtitle: json['subtitle'],
      url: json['url'],
      durationPeriod: json['durationPeriod'] != null
          ? DurationPeriod.fromJson(json['durationPeriod'])
          : null,
      tags: json['tags'] != null
          ? List<AppTag>.from(json['tags'].map((tag) => AppTag.fromJson(tag)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'url': url,
      'durationPeriod': durationPeriod?.toJson(),
      'tags': tags?.map((tag) => tag.toJson()).toList(),
    };
  }
}
