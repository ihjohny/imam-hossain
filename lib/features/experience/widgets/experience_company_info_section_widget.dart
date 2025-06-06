import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/constants/sizes.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_link_able_title_widget.dart';
import 'package:imam_hossain/features/common/widgets/horizontal_spacing.dart';
import 'package:imam_hossain/features/experience/data/model/company.dart';

class ExperienceCompanyInfoSectionWidget extends StatelessWidget {
  final Company? company;

  const ExperienceCompanyInfoSectionWidget({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    if (company == null) {
      return const AppEmptyWidget();
    }

    return Row(
      children: [
        AppLinkAbleTitleWidget(
          title: company!.name,
          url: company!.link,
        ),
        const HorizontalSpacing(Sizes.px8),
        Text(
          company!.place ?? "",
          style: context.themeData.textTheme.labelMedium,
        ),
      ],
    );
  }
}
