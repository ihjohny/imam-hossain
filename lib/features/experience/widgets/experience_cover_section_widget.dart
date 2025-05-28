import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/constants/sizes.dart';
import 'package:imam_hossain/features/common/data/model/app_image.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_image_widget.dart';
import 'package:imam_hossain/features/common/widgets/focused_content_widget.dart';

class ExperienceCoverSectionWidget extends StatelessWidget {
  final AppImage? coverImage;

  const ExperienceCoverSectionWidget({
    super.key,
    required this.coverImage,
  });

  @override
  Widget build(BuildContext context) {
    if (coverImage == null || (coverImage!.assetName?.isEmpty == true)) {
      return const AppEmptyWidget();
    }

    return FocusedContentWidget(
      child: AppImageWidget(
        appImage: coverImage!,
        height: Sizes.px300,
        width: double.infinity,
      ),
    );
  }
}
