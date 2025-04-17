import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_tag_chip_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';

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
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: certification.tags
                      ?.map(
                        (item) => AppTagChipWidget(appTag: item),
                      )
                      .toList() ??
                  [const AppEmptyWidget()],
            ),
            const VerticalSpacing(12),
            Text(
              certification.title ?? "",
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const VerticalSpacing(4),
            Text(
              certification.subtitle ?? "",
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const VerticalSpacing(4),
            AppDateWidget(
              durationPeriod: certification.durationPeriod,
            )
          ],
        ),
      ),
    );
  }
}
