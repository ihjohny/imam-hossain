import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/constants/sizes.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';
import 'package:imam_hossain/features/common/widgets/horizontal_spacing.dart';
import 'package:imam_hossain/features/experience/data/model/role.dart';
import 'package:imam_hossain/features/common/widgets/app_date_widget.dart';

class ExperienceRolesSectionWidget extends StatelessWidget {
  final List<Role>? roles;

  const ExperienceRolesSectionWidget({
    super.key,
    required this.roles,
  });

  @override
  Widget build(BuildContext context) {
    if (roles == null || roles!.isEmpty) {
      return const AppEmptyWidget();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: roles!
          .map((role) => Row(
                children: [
                  Text(
                    role.title ?? "",
                    style: context.themeData.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const HorizontalSpacing(Sizes.px8),
                  const Spacer(),
                  if (role.durationPeriod != null)
                    AppDateWidget(durationPeriod: role.durationPeriod!),
                ],
              ))
          .toList(),
    );
  }
}
