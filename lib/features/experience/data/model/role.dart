import 'package:imam_hossain/features/common/data/model/duration_period.dart';

class Role {
  final String? title;
  final DurationPeriod? durationPeriod;

  Role({
    this.title,
    this.durationPeriod,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      title: json['title'] as String?,
      durationPeriod: json['durationPeriod'] != null
          ? DurationPeriod.fromJson(
              json['durationPeriod'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'durationPeriod': durationPeriod?.toJson(),
      };
}
