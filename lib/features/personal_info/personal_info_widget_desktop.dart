import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/contact_button_widget.dart';
import 'package:imam_hossain/generated/localization/locale_keys.g.dart';

import '../../core/utils/constants/sizes.dart';

class PersonalInfoWidgetDesktop extends StatelessWidget {
  const PersonalInfoWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          top: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 125,
              backgroundColor: context.colorScheme.onSecondary,
              child: const CircleAvatar(
                radius: 120,
                backgroundImage: AssetImage('assets/images/profile-pic.png'),
              ),
            ),
            spaceH12,
            Text(
              context.tr(LocaleKeys.name),
              style: context.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            spaceH12,
            Text(
              context.tr(LocaleKeys.position),
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.onPrimary,
              ),
            ),
            spaceH12,
            Text(
              context.tr(LocaleKeys.subDescription),
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            spaceH12,
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              children: [
                ContactButtonWidget(
                  icon: FontAwesomeIcons.filePdf,
                  url: context.tr(LocaleKeys.resumeUrl),
                ),
                ContactButtonWidget(
                  icon: FontAwesomeIcons.github,
                  url: context.tr(LocaleKeys.githubUrl),
                ),
                ContactButtonWidget(
                  icon: FontAwesomeIcons.linkedin,
                  url: context.tr(LocaleKeys.linkedinUrl),
                ),
                ContactButtonWidget(
                  icon: FontAwesomeIcons.envelope,
                  url: context.tr(LocaleKeys.emailUrl),
                ),
              ],
            ),
            spaceH12,
          ],
        ),
      ),
    );
  }
}
