import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/string_ext.dart';
import 'package:imam_hossain/features/common/data/model/app_tag.dart';
import 'package:imam_hossain/features/common/widgets/app_chip_widget.dart';

import '../../../core/utils/helper/helper_utils.dart';
import 'app_image_widget.dart';

class AppTagChipWidget extends StatelessWidget {
  final AppTag appTag;

  const AppTagChipWidget({
    super.key,
    required this.appTag,
  });

  @override
  Widget build(BuildContext context) {
    return AppChipWidget(
      leading: appTag.logo != null
          ? AppImageWidget(
              appImage: appTag.logo!,
              height: 24,
              width: 24,
            )
          : null,
      label: appTag.title,
      backgroundColor: _getTagBackgroundColor(appTag),
      textColor: Colors.black87,
      onPressed: !appTag.link.isNullOrEmpty
          ? () {
              safeLaunchURL(context, appTag.link);
            }
          : null,
    );
  }

  Color _getTagBackgroundColor(AppTag appTag) {
    if (appTag.type == "android") {
      return const Color(0xFFF8D7D0);
    } else if (appTag.type == "play_store_link") {
      return const Color(0xFFEEEEE4);
    } else if (appTag.type == "flutter") {
      return const Color(0xFFD6EAF8);
    } else if (appTag.type == "external_link") {
      return const Color(0xFFD5F5E3);
    } else if (appTag.type == "certification") {
      return const Color(0xFFF3E2FB);
    } else if (appTag.type == "education") {
      return const Color(0xFFE5F9B3);
    } else if (appTag.type == "email") {
      return const Color(0xFFF8D7D0);
    } else if (appTag.type == "code_link") {
      return const Color(0xFFEEEEE4);
    } else if (appTag.type == "social_link") {
      return const Color(0xFFD6EAF8);
    } else if (appTag.type == "document_link") {
      return const Color(0xFFD5F5E3);
    }

    return const Color(0xFFF8D7D0);
  }
}
