import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';

import '../../../core/utils/helper/helper_utils.dart';
import 'app_cursors_button_widget.dart';

class AppLinkAbleTitleWidget extends StatelessWidget {
  const AppLinkAbleTitleWidget({
    super.key,
    required this.title,
    required this.url,
  });

  final String? title;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return AppCursorsButtonWidget(
      onPressed: () {
        safeLaunchURL(context, url);
      },
      child: Text(
        title ?? "",
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
