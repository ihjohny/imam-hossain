import 'package:imam_hossain/features/publications/data/model/publication.dart';

class PublicationData {
  final List<Publication> publications;

  PublicationData({required this.publications});

  factory PublicationData.fromJson(List<dynamic> json) {
    List<Publication> publications =
        json.map((e) => Publication.fromJson(e)).toList();
    return PublicationData(publications: publications);
  }

  List<Map<String, dynamic>> toJson() {
    return publications.map((project) => project.toJson()).toList();
  }
}
