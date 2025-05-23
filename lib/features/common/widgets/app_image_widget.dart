import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imam_hossain/core/utils/extension/string_ext.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import '../../../core/utils/constants/custom_icons.dart';
import '../data/model/app_image.dart';

class AppImageWidget extends StatelessWidget {
  final AppImage appImage;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? tintColor;

  const AppImageWidget({
    super.key,
    required this.appImage,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.tintColor,
  });

  @override
  Widget build(BuildContext context) {
    if (appImage.assetName.isNullOrEmpty) {
      if (!appImage.iconType.isNullOrEmpty) {
        return Icon(
          _getIconData(appImage.iconType!),
          size: width,
          color: tintColor ?? context.themeData.colorScheme.onSurfaceVariant,
        );
      } else {
        return Icon(
          Icons.image_not_supported,
          size: width,
          color: tintColor ?? context.themeData.colorScheme.onSurfaceVariant,
        );
      }
    }

    return Image.asset(
      appImage.assetName!,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Icon(
        Icons.image_not_supported,
        size: width,
        color: context.themeData.colorScheme.onSurfaceVariant,
      ),
    );
  }

  IconData _getIconData(String iconType) {
    switch (iconType) {
      case "email":
        return FontAwesomeIcons.envelope;
      case "code":
        return FontAwesomeIcons.github;
      case "person":
        return FontAwesomeIcons.linkedin;
      case "document":
        return FontAwesomeIcons.filePdf;
      case "kotlin":
        return CustomIcons.kotlin;
      case "android":
        return FontAwesomeIcons.android;
      case "apple":
        return FontAwesomeIcons.apple;
      case "flutter":
        return FontAwesomeIcons.flutter;
      default:
        return Icons.image_not_supported;
    }
  }
}
