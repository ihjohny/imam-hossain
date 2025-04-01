import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/localized_date_ext.dart';
import 'package:imam_hossain/core/utils/extension/string_ext.dart';

import '../../../generated/localization/locale_keys.g.dart';
import '../data/model/experience.dart';

class ExperienceDateWidget extends StatelessWidget {
  const ExperienceDateWidget({super.key, required this.experience});

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;

    final startMonth = experience.startMonth?.localizedMonth(locale) ?? "";
    final startYear = experience.startYear?.localizedYear(locale);
    final startDate = startMonth.isEmpty ? startYear : "$startMonth $startYear";
    final endMonth = experience.endMonth?.localizedMonth(locale) ?? "";
    final endYear = experience.endYear?.localizedYear(locale);
    String? endDate;

    if (experience.isPresent == true) {
      endDate = tr(LocaleKeys.present);
    } else {
      endDate = endMonth.isEmpty ? endYear : "$endMonth $endYear";
    }
    if (startDate == null || endDate == null) return const Text("");
    return Text(
      "${startDate.capitalize()} - ${endDate.capitalize()}",
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
