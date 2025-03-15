import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/helper/helper_utils.dart';
import 'package:imam_hossain/features/common/widgets/item_chip_widget.dart';

import '../../generated/localization/locale_keys.g.dart';

class AboutWidgetDesktop extends StatelessWidget {
  const AboutWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr(LocaleKeys.aboutTitleSection),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFBF5A55),
                ),
              ),
              const SizedBox(height: 4),
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
                spacing: 12,
                runSpacing: 12,
                children: [
                  ItemChipWidget(
                    icon: Icons.mail_outline,
                    label: context.tr(LocaleKeys.emailTitle),
                    backgroundColor: Color(0xFFF8D7D0),
                    textColor: Colors.black87,
                    onPressed: () {
                      safeLaunchURL(context, context.tr(LocaleKeys.emailUrl));
                    },
                  ),
                  ItemChipWidget(
                    icon: Icons.code,
                    label: context.tr(LocaleKeys.githubTitle),
                    backgroundColor: Color(0xFFEEEEE4),
                    textColor: Colors.black87,
                    onPressed: () {
                      safeLaunchURL(context, context.tr(LocaleKeys.githubUrl));
                    },
                  ),
                  ItemChipWidget(
                    icon: Icons.person_outline,
                    label: context.tr(LocaleKeys.linkedinTitle),
                    backgroundColor: Color(0xFFD6EAF8),
                    textColor: Colors.black87,
                    onPressed: () {
                      safeLaunchURL(
                          context, context.tr(LocaleKeys.linkedinUrl));
                    },
                  ),
                  ItemChipWidget(
                    icon: Icons.description_outlined,
                    label: context.tr(LocaleKeys.resumeTitle),
                    backgroundColor: Color(0xFFD5F5E3),
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
