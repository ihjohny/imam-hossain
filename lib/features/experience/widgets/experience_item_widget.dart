import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/constants/sizes.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/app_cursors_button_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_image_widget.dart';
import 'package:imam_hossain/features/common/widgets/horizontal_spacing.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/experience/data/model/company.dart';
import 'package:imam_hossain/features/experience/data/model/experience.dart';
import 'package:imam_hossain/features/experience/data/model/role.dart';

import '../../../core/utils/helper/helper_utils.dart';
import 'package:imam_hossain/features/common/widgets/app_date_widget.dart';

class ExperienceItemWidget extends StatelessWidget {
  final Experience experience;

  const ExperienceItemWidget({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCompanyInfoSection(context, experience.company),
              _buildRolesSection(context, experience.roles),
              const VerticalSpacing(Sizes.px8),
              _buildResponsibilitiesSection(
                  context, experience.responsibilities),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.px24),
            child: experience.cover?.assetName?.isNotEmpty == true
                ? AppImageWidget(
                    appImage: experience.cover!,
                    height: 300,
                    width: 300,
                  )
                : const AppEmptyWidget(),
          ),
        ),
      ],
    );
  }

  Widget _buildCompanyInfoSection(
    BuildContext context,
    Company? company,
  ) {
    if (company == null) {
      return const SizedBox.shrink();
    }
    return Row(
      children: [
        AppCursorsButtonWidget(
          onPressed: () {
            safeLaunchURL(context, company.link);
          },
          child: Text(
            company.name ?? "",
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const HorizontalSpacing(Sizes.px8),
        Text(
          company.place ?? "",
          style: context.textTheme.labelMedium,
        ),
      ],
    );
  }

  Widget _buildRolesSection(
    BuildContext context,
    List<Role>? roles,
  ) {
    if (roles == null || roles.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: roles
          .map((role) => Row(
                children: [
                  Text(
                    role.title ?? "",
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: Sizes.px8),
                  const Spacer(),
                  if (role.durationPeriod != null)
                    AppDateWidget(durationPeriod: role.durationPeriod!),
                ],
              ))
          .toList(),
    );
  }

  Widget _buildResponsibilitiesSection(
    BuildContext context,
    List<String>? responsibilities,
  ) {
    if (responsibilities == null || responsibilities.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          responsibilities.length,
          (i) => Padding(
                padding: EdgeInsets.only(
                  bottom: i < responsibilities.length - 1 ? Sizes.px4 : 0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check,
                      size: Sizes.px24,
                      color: context.themeData.colorScheme.primary,
                    ),
                    const HorizontalSpacing(Sizes.px4),
                    Expanded(
                      child: Text(
                        responsibilities[i],
                        style: context.textTheme.titleSmall?.copyWith(
                          color: context.themeData.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
