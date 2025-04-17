import 'certification.dart';

class CertificationData {
  final List<Certification> certifications;

  CertificationData({required this.certifications});

  factory CertificationData.fromJson(List<dynamic> json) {
    List<Certification> certifications =
        json.map((e) => Certification.fromJson(e)).toList();
    return CertificationData(certifications: certifications);
  }

  List<Map<String, dynamic>> toJson() {
    return certifications.map((project) => project.toJson()).toList();
  }
}
