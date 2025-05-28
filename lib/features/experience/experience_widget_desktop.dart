import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/features/common/widgets/app_no_data_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_section_widget.dart';
import 'package:imam_hossain/features/common/widgets/responsive_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/experience/data/experience_data_service.dart';
import 'package:imam_hossain/features/experience/data/model/experience_data.dart';
import 'package:imam_hossain/features/experience/widgets/experience_item_widget_desktop.dart';

import '../../core/utils/constants/sizes.dart';
import '../../di/di_setup.dart';
import '../../generated/localization/locale_keys.g.dart';
import 'data/model/experience.dart';
import 'widgets/experience_item_widget_mobile.dart';

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
        contentWidget: StreamBuilder<ExperienceData>(
          stream: experienceDataService.experiences,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.experiences.isEmpty) {
              return const AppNoDataWidget();
            }
            final experiences = snapshot.data!.experiences;
            return _buildExperienceList(context, experiences);
          },
        ),
      ),
    );
  }

  Widget _buildExperienceList(
    BuildContext context,
    List<Experience> experiences,
  ) {
    return Column(
      children: List.generate(experiences.length, (index) {
        return Column(
          children: [
            Responsive(
              desktop: ExperienceItemDesktop(experience: experiences[index]),
              mobile: ExperienceItemMobile(experience: experiences[index]),
            ),
            if (index < experiences.length - 1)
              const VerticalSpacing(Sizes.px12),
          ],
        );
      }),
    );
  }
}
