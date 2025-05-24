import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';

import '../../../generated/localization/locale_keys.g.dart';

class AppNoDataWidget extends StatelessWidget {
  const AppNoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.tr(LocaleKeys.noDataMSg),
        style: context.themeData.textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
