import 'package:imam_hossain/features/common/data/model/app_image.dart';

class AppTag {
  final String? type;
  final String? title;
  final String? link;
  final AppImage? logo;

  AppTag({this.type, this.title, this.link, this.logo});

  factory AppTag.fromJson(Map<String, dynamic> json) {
    return AppTag(
      type: json['type'],
      title: json['title'],
      link: json['link'],
      logo: json['logo'] != null ? AppImage.fromJson(json['logo']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
      'link': link,
      'logo': logo?.toJson(),
    };
  }
}
