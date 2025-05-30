import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/string_ext.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/data/model/app_tag.dart';
import 'package:imam_hossain/features/common/widgets/app_chip_widget.dart';

import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helper/helper_utils.dart';
import 'app_image_widget.dart';

class AppTagChipWidget extends StatefulWidget {
  final AppTag appTag;

  const AppTagChipWidget({
    super.key,
    required this.appTag,
  });

  @override
  State<AppTagChipWidget> createState() => _AppTagChipWidgetState();
}

class _AppTagChipWidgetState extends State<AppTagChipWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isClickable = !widget.appTag.link.isNullOrEmpty;

    final Color contentColor = _isHovered && isClickable
        ? context.themeData.colorScheme.primary
        : context.themeData.colorScheme.onSecondaryFixedVariant;

    final Color backgroundColor = _isHovered && isClickable
        ? context.themeData.colorScheme.primary.withValues(alpha: .1)
        : _getTagBackgroundColor(widget.appTag);

    return MouseRegion(
      onEnter: (_) {
        if (isClickable) setState(() => _isHovered = true);
      },
      onExit: (_) {
        if (isClickable) setState(() => _isHovered = false);
      },
      child: AppChipWidget(
        leading: widget.appTag.logo != null
            ? AppImageWidget(
                appImage: widget.appTag.logo!,
                height: Sizes.px24,
                width: Sizes.px24,
                tintColor: contentColor,
              )
            : null,
        label: widget.appTag.title,
        backgroundColor: backgroundColor,
        textColor: contentColor,
        onPressed: isClickable
            ? () {
                safeLaunchURL(context, widget.appTag.link);
              }
            : null,
      ),
    );
  }

  Color _getTagBackgroundColor(AppTag appTag) {
    if (appTag.type == "android") {
      return const Color(0xFFF1F8E9);
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
      return const Color(0xFFFFF3CD);
    } else if (appTag.type == "code_link") {
      return const Color(0xFFEEEEE4);
    } else if (appTag.type == "social_link") {
      return const Color(0xFFD6EAF8);
    } else if (appTag.type == "document_link") {
      return const Color(0xFFD5F5E3);
    }

    return const Color(0xFFE1F6F4);
  }
}
