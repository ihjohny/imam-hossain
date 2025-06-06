import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/app_card_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_link_able_title_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_tag_chip_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_wrap_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';

import '../../../core/utils/constants/sizes.dart';
import '../../common/widgets/app_date_widget.dart';
import '../data/model/certification.dart';

class CertificationItemWidget extends StatelessWidget {
  final Certification certification;

  const CertificationItemWidget({
    super.key,
    required this.certification,
  });

  @override
  Widget build(BuildContext context) {
    return AppCardWidget(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWrapWidget(
          children: certification.tags
                  ?.map(
                    (item) => AppTagChipWidget(appTag: item),
                  )
                  .toList() ??
              [const AppEmptyWidget()],
        ),
        const VerticalSpacing(Sizes.px12),
        AppLinkAbleTitleWidget(
          title: certification.title,
          url: certification.url,
        ),
        const VerticalSpacing(Sizes.px4),
        Text(
          certification.subtitle ?? "",
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const VerticalSpacing(Sizes.px4),
        AppDateWidget(
          durationPeriod: certification.durationPeriod,
        )
      ],
    ));
  }
}
