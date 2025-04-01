import 'package:imam_hossain/features/common/data/model/app_image.dart';

class AppTag {
  final String? type;
  final String? title;
  final String? link;
  final AppImage? cover;

  AppTag({this.type, this.title, this.link, this.cover});

  factory AppTag.fromJson(Map<String, dynamic> json) {
    return AppTag(
      type: json['type'],
      title: json['title'],
      link: json['link'],
      cover: json['cover'] != null ? AppImage.fromJson(json['cover']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
      'link': link,
      'cover': cover?.toJson(),
    };
  }
}
