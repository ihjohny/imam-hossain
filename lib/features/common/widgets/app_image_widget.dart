import 'package:flutter/material.dart';

import '../data/model/app_image.dart';

class AppImageWidget extends StatelessWidget {
  final AppImage appImage;
  final double? width;
  final double? height;
  final BoxFit fit;

  const AppImageWidget({
    super.key,
    required this.appImage,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (appImage.assetName == null || appImage.assetName!.isEmpty) {
      return Icon(
        Icons.image_not_supported,
        size: width,
        color: Colors.grey,
      );
    }

    return Image.asset(
      appImage.assetName!,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Icon(
        Icons.image_not_supported,
        size: width,
        color: Colors.grey,
      ),
    );
  }
}
