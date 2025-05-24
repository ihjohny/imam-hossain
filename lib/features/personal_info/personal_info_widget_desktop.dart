import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_image_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_wrap_widget.dart';
import 'package:imam_hossain/features/common/widgets/logo_icon_widget.dart';
import 'package:imam_hossain/features/personal_info/data/model/personal_info.dart';
import 'package:imam_hossain/features/personal_info/data/personal_info_data_service.dart';

import '../../core/utils/constants/sizes.dart';
import '../../di/di_setup.dart';
import 'package:imam_hossain/features/common/widgets/app_no_data_widget.dart';

class PersonalInfoWidgetDesktop extends StatelessWidget {
  const PersonalInfoWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final personalInfoDataService = getIt<PersonalInfoDataService>();
    personalInfoDataService.fetchPersonalInfoData(context.locale);

    return Container(
      color: context.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.only(
          left: Sizes.px24,
          right: Sizes.px24,
          top: Sizes.px100,
        ),
        child: StreamBuilder(
          stream: personalInfoDataService.personalInfo,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return const AppNoDataWidget();
            }
            final personalInfoData = snapshot.data!;
            return _buildPersonalInfoContent(context, personalInfoData);
          },
        ),
      ),
    );
  }

  Widget _buildPersonalInfoContent(
    BuildContext context,
    PersonalInfo personalInfo,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 125,
          backgroundColor: context.colorScheme.onSecondary,
          child: CircleAvatar(
            radius: 120,
            backgroundImage: AssetImage(personalInfo.photo?.assetName ?? ''),
          ),
        ),
        spaceH12,
        Text(
          personalInfo.name ?? '',
          style: context.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        spaceH12,
        Text(
          personalInfo.positionTitle ?? '',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: context.colorScheme.onPrimary,
          ),
        ),
        spaceH12,
        Text(
          personalInfo.message ?? '',
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        spaceH12,
        AppWrapWidget(
          spacing: Sizes.px12,
          children: List.generate(
            personalInfo.tags?.length ?? 0,
            (index) {
              if (personalInfo.tags?[index].logo != null) {
                return LogoIconWidget(
                  child: AppImageWidget(
                    appImage: personalInfo.tags![index].logo!,
                    tintColor: context.themeData.colorScheme.shadow,
                    width: Sizes.px32,
                  ),
                );
              } else {
                return const AppEmptyWidget();
              }
            },
          ),
        ),
        spaceH12,
      ],
    );
  }
}
