import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/features/common/widgets/app_card_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_section_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/experience/data/experience_data_service.dart';
import 'package:imam_hossain/features/experience/data/model/experience_data.dart';
import 'package:imam_hossain/features/experience/widgets/experience_item_widget.dart';

import '../../di/di_setup.dart';
import '../../generated/localization/locale_keys.g.dart';

class ExperienceWidgetDesktop extends StatelessWidget {
  const ExperienceWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final experienceDataService = getIt<ExperienceDataService>();
    experienceDataService.fetchExperienceData(context.locale);

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: AppSectionWidget(
        title: context.tr(LocaleKeys.experienceTitleSection),
        contentWidget: AppCardWidget(
          child: StreamBuilder<ExperienceData>(
            stream: experienceDataService.experiences,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data!.experiences.isEmpty) {
                return Center(child: Text(context.tr(LocaleKeys.noDataMSg)));
              }
              final skillsData = snapshot.data!;
              return Column(
                children: List.generate(skillsData.experiences.length, (index) {
                  return Column(
                    children: [
                      ExperienceItemWidget(
                        experience: skillsData.experiences[index],
                      ),
                      if (index < skillsData.experiences.length - 1)
                        const VerticalSpacing(12),
                    ],
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
