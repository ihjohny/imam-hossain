import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/localized_date_ext.dart';
import 'package:imam_hossain/core/utils/extension/string_ext.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/data/model/duration_period.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';

import '../../../generated/localization/locale_keys.g.dart';

class AppDateWidget extends StatelessWidget {
  const AppDateWidget({super.key, required this.durationPeriod});

  final DurationPeriod? durationPeriod;

  @override
  Widget build(BuildContext context) {
    if (durationPeriod == null) return const AppEmptyWidget();

    final locale = context.locale;

    final startMonth = durationPeriod?.startMonth?.localizedMonth(locale) ?? "";
    final startYear = durationPeriod?.startYear?.localizedYear(locale);
    final startDate = startMonth.isEmpty ? startYear : "$startMonth $startYear";
    final endMonth = durationPeriod?.endMonth?.localizedMonth(locale) ?? "";
    final endYear = durationPeriod?.endYear?.localizedYear(locale);
    String? endDate;

    if (durationPeriod?.isPresent == true) {
      endDate = tr(LocaleKeys.present);
    } else {
      endDate = endMonth.isEmpty ? endYear : "$endMonth $endYear";
    }
    if (startDate == null || endDate == null) return const Text("");
    return Text(
      "${startDate.capitalize()} - ${endDate.capitalize()}",
      style: context.themeData.textTheme.labelMedium,
    );
  }
}
