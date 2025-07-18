import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/constants/sizes.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/app_date_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';
import 'package:imam_hossain/features/common/widgets/horizontal_spacing.dart';
import 'package:imam_hossain/features/common/widgets/responsive_widget.dart';
import 'package:imam_hossain/features/experience/data/model/role.dart';

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

    return Responsive(
      desktop: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            roles!.map((role) => _buildDesktopRole(role, context)).toList(),
      ),
      tablet: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            roles!.map((role) => _buildTabletRole(role, context)).toList(),
      ),
    );
  }

  Widget _buildTabletRole(Role role, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _roleTitle(role.title, context),
        if (role.durationPeriod != null)
          AppDateWidget(durationPeriod: role.durationPeriod!),
        const SizedBox(height: Sizes.px8),
      ],
    );
  }

  Widget _buildDesktopRole(Role role, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: _roleTitle(role.title, context),
        ),
        const HorizontalSpacing(Sizes.px8),
        if (role.durationPeriod != null)
          AppDateWidget(durationPeriod: role.durationPeriod!),
      ],
    );
  }

  Widget _roleTitle(String? title, BuildContext context) {
    return Text(
      title ?? "",
      style: context.themeData.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
