import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/helper/helper_utils.dart';
import 'package:imam_hossain/features/common/widgets/app_card_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_chip_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_section_widget.dart';

import '../../generated/localization/locale_keys.g.dart';

class AboutWidgetDesktop extends StatelessWidget {
  const AboutWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: AppSectionWidget(
        title: context.tr(LocaleKeys.aboutTitleSection),
        contentWidget: AppCardWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr(LocaleKeys.aboutDetailsSection),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  AppChipWidget(
                    leading: const Icon(
                      Icons.mail_outline,
                      color: Colors.black87,
                    ),
                    label: context.tr(LocaleKeys.emailTitle),
                    backgroundColor: const Color(0xFFF8D7D0),
                    textColor: Colors.black87,
                    onPressed: () {
                      safeLaunchURL(context, context.tr(LocaleKeys.emailUrl));
                    },
                  ),
                  AppChipWidget(
                    leading: const Icon(
                      Icons.code,
                      color: Colors.black87,
                    ),
                    label: context.tr(LocaleKeys.githubTitle),
                    backgroundColor: const Color(0xFFEEEEE4),
                    textColor: Colors.black87,
                    onPressed: () {
                      safeLaunchURL(context, context.tr(LocaleKeys.githubUrl));
                    },
                  ),
                  AppChipWidget(
                    leading: const Icon(
                      Icons.person_outline,
                      color: Colors.black87,
                    ),
                    label: context.tr(LocaleKeys.linkedinTitle),
                    backgroundColor: const Color(0xFFD6EAF8),
                    textColor: Colors.black87,
                    onPressed: () {
                      safeLaunchURL(
                          context, context.tr(LocaleKeys.linkedinUrl));
                    },
                  ),
                  AppChipWidget(
                    leading: const Icon(
                      Icons.description_outlined,
                      color: Colors.black87,
                    ),
                    label: context.tr(LocaleKeys.resumeTitle),
                    backgroundColor: const Color(0xFFD5F5E3),
                    textColor: Colors.black87,
                    onPressed: () {
                      safeLaunchURL(context, context.tr(LocaleKeys.resumeUrl));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
