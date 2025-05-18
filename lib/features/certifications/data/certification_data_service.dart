import 'dart:ui';

import 'package:rxdart/rxdart.dart';

import '../../../core/localization/json_translation.dart';
import '../../../generated/localization/locale_keys.g.dart';
import 'model/certification_data.dart';

class CertificationDataService {
  final BehaviorSubject<CertificationData> _certifications =
      BehaviorSubject<CertificationData>();

  Stream<CertificationData> get educations => _certifications.stream;

  Future<void> fetchEducationData(Locale locale) async {
    final jsonCertificationsData =
        trList(locale, LocaleKeys.certificationsData);
    _certifications.add(CertificationData.fromJson(jsonCertificationsData));
  }

  void dispose() {
    _certifications.close();
  }
}
