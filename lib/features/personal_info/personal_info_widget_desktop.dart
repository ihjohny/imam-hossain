import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/app_no_data_widget.dart';
import 'package:imam_hossain/features/personal_info/data/model/personal_info.dart';
import 'package:imam_hossain/features/personal_info/data/personal_info_data_service.dart';
import 'package:imam_hossain/features/personal_info/widgets/personal_info_top_bar_widget_desktop.dart';

import '../../core/utils/constants/sizes.dart';
import '../../di/di_setup.dart';
import 'widgets/personal_info_avatar_widget.dart';
import 'widgets/personal_info_tags_widget.dart';
import 'widgets/personal_info_text_widget.dart';

class PersonalInfoWidgetDesktop extends StatelessWidget {
  const PersonalInfoWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final personalInfoDataService = getIt<PersonalInfoDataService>();
    personalInfoDataService.fetchPersonalInfoData(context.locale);

    return Container(
      color: context.colorScheme.primary,
      child: Column(
        children: [
          const PersonalInfoTopBarWidgetDesktop(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Sizes.px24,
                  right: Sizes.px24,
                  top: Sizes.px24,
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
            ),
          ),
        ],
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
        PersonalInfoAvatar(assetName: personalInfo.photo?.assetName),
        spaceH12,
        PersonalInfoText(
          name: personalInfo.name,
          positionTitle: personalInfo.positionTitle,
          message: personalInfo.message,
        ),
        spaceH12,
        PersonalInfoTags(tags: personalInfo.tags),
        spaceH24,
      ],
    );
  }
}
