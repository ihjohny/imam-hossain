import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/features/common/widgets/app_card_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_section_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/skills/data/model/skills_data.dart';
import 'package:imam_hossain/features/skills/data/skills_data_service.dart';
import 'package:imam_hossain/features/skills/widgets/skills_category_widget.dart';

import '../../core/utils/constants/sizes.dart';
import '../../di/di_setup.dart';
import '../../generated/localization/locale_keys.g.dart';

class SkillsWidgetDesktop extends StatelessWidget {
  const SkillsWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final skillsDataService = getIt<SkillsDataService>();
    skillsDataService.fetchSkillsData(context.locale);

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: AppSectionWidget(
        title: context.tr(LocaleKeys.skillsTitleToolbar),
        contentWidget: AppCardWidget(
          child: StreamBuilder<SkillsData>(
            stream: skillsDataService.skillsCategories,
            builder: (context, snapshot) {
              if (!snapshot.hasData ||
                  snapshot.data!.skillsCategories.isEmpty) {
                return Center(child: Text(context.tr(LocaleKeys.noDataMSg)));
              }
              final skillsData = snapshot.data!;
              return Column(
                children:
                    List.generate(skillsData.skillsCategories.length, (index) {
                  return Column(
                    children: [
                      SkillsCategoryWidget(
                        category: skillsData.skillsCategories[index],
                      ),
                      if (index < skillsData.skillsCategories.length - 1)
                        const VerticalSpacing(Sizes.px12),
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
