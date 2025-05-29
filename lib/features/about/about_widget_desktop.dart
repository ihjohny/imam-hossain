import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/about/data/about_data_service.dart';
import 'package:imam_hossain/features/about/data/model/about_data.dart';
import 'package:imam_hossain/features/common/widgets/app_card_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_no_data_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_section_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_tag_chip_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_wrap_widget.dart';
import '../../core/utils/constants/sizes.dart';
import '../../di/di_setup.dart';
import '../../generated/localization/locale_keys.g.dart';

class AboutWidgetDesktop extends StatelessWidget {
  const AboutWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final aboutDataService = getIt<AboutDataService>();
    aboutDataService.fetchAboutData(context.locale);

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: AppSectionWidget(
        title: context.tr(LocaleKeys.aboutTitleSection),
        contentWidget: StreamBuilder(
          stream: aboutDataService.aboutData,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return const AppNoDataWidget();
            }
            final aboutData = snapshot.data!;
            return _buildAboutContent(context, aboutData);
          },
        ),
      ),
    );
  }

  Widget _buildAboutContent(BuildContext context, AboutData aboutData) {
    return AppCardWidget(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildAboutDetails(context, aboutData.details),
        const SizedBox(height: Sizes.px12),
        AppWrapWidget(
          children: List.generate(
            aboutData.tags?.length ?? 0,
            (index) {
              return AppTagChipWidget(
                appTag: aboutData.tags![index],
              );
            },
          ),
        ),
      ]),
    );
  }

  Widget _buildAboutDetails(BuildContext context, String? details) {
    return Text(
      details ?? "",
      style: context.themeData.textTheme.titleMedium?.copyWith(
        color: context.themeData.colorScheme.onSurfaceVariant,
      ),
    );
  }
}
