import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/app_image_widget.dart';
import 'package:imam_hossain/features/common/widgets/horizontal_spacing.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/experience/data/model/experience.dart';
import 'package:imam_hossain/features/experience/widgets/experience_date_widget.dart';

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
              Row(
                children: [
                  Text(
                    experience.company ?? "",
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const HorizontalSpacing(12),
                  Text(
                    experience.place.toString() ?? "",
                    style: context.textTheme.titleSmall,
                  ),
                  const Spacer(),
                  ExperienceDateWidget(
                    experience: experience,
                  )
                ],
              ),
              Text(
                experience.role ?? "",
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const VerticalSpacing(8),
              Text(
                experience.description ?? "",
                style: context.textTheme.bodyMedium,
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: experience.cover?.assetName?.isNotEmpty == true
                ? AppImageWidget(
                appImage: experience.cover!,
                height: 300,
                width: 300,
            )
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
