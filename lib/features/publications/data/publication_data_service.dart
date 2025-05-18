import 'dart:ui';

import 'package:imam_hossain/features/publications/data/model/publication_data.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/localization/json_translation.dart';
import '../../../generated/localization/locale_keys.g.dart';

class PublicationDataService {
  final BehaviorSubject<PublicationData> _publications =
      BehaviorSubject<PublicationData>();

  Stream<PublicationData> get publications => _publications.stream;

  Future<void> fetchPublicationData(Locale locale) async {
    final jsonPublicationsData = trList(locale, LocaleKeys.publicationsData);
    _publications.add(PublicationData.fromJson(jsonPublicationsData));
  }

  void dispose() {
    _publications.close();
  }
}
