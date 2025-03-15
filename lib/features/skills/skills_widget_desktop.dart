import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../generated/localization/locale_keys.g.dart';

class SkillsWidgetDesktop extends StatelessWidget {
  const SkillsWidgetDesktop({super.key});

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
                context.tr(LocaleKeys.skillsTitleToolbar),
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
            ],
          ),
        ),
      ),
    );
  }
}
