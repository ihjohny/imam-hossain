import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/constants/sizes.dart';
import 'package:imam_hossain/features/common/widgets/app_card_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/experience/data/model/experience.dart';

import 'experience_company_info_section_widget.dart';
import 'experience_cover_section_widget.dart';
import 'experience_responsibilities_section_widget.dart';
import 'experience_roles_section_widget.dart';

class ExperienceItemDesktop extends StatelessWidget {
  final Experience experience;

  const ExperienceItemDesktop({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return AppCardWidget(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExperienceCompanyInfoSectionWidget(company: experience.company),
                ExperienceRolesSectionWidget(roles: experience.roles),
                const VerticalSpacing(Sizes.px8),
                ExperienceResponsibilitiesSectionWidget(
                    responsibilities: experience.responsibilities),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: Sizes.px32),
              child: ExperienceCoverSectionWidget(coverImage: experience.cover),
            ),
          ),
        ],
      ),
    );
  }
}
