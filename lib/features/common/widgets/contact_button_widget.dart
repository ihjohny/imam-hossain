import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';

import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helper/helper_utils.dart';

class ContactButtonWidget extends StatelessWidget {
  final IconData icon;
  final String url;

  const ContactButtonWidget({super.key, required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: url,
      onPressed: () async {
        safeLaunchURL(context, url);
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(Sizes.px16)),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (states) => context.colorScheme.onPrimary.withValues(alpha: .2),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.px12),
            side: BorderSide(
              width: Sizes.px2,
              color: context.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
      icon: Icon(
        icon,
        size: Sizes.px32,
      ),
    );
  }
}
