import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/features/certifications/widgets/education_item_widget.dart';
import 'package:imam_hossain/features/common/widgets/custom_grid_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';

import '../../di/di_setup.dart';
import '../../generated/localization/locale_keys.g.dart';
import 'data/certification_data_service.dart';
import 'data/model/certification_data.dart';

class CertificationsWidgetDesktop extends StatelessWidget {
  const CertificationsWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final certificationDataService = getIt<CertificationDataService>();
    certificationDataService.fetchEducationData(context.locale);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys.certificationsTitleSection),
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFFBF5A55),
          ),
        ),
        const VerticalSpacing(16),
        StreamBuilder<CertificationData>(
          stream: certificationDataService.educations,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.certifications.isEmpty) {
              return Center(child: Text(context.tr(LocaleKeys.noDataMSg)));
            }
            final certificationData = snapshot.data!;
            return CustomGridWidget(
              columns: 2,
              horizontalSpacing: 8,
              verticalSpacing: 16,
              children: List.generate(
                certificationData.certifications.length,
                (index) {
                  return CertificationItemWidget(
                    certification: certificationData.certifications[index],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
