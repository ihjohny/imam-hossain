import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../generated/localization/locale_keys.g.dart';

void showLaunchUrlError(BuildContext context, {String? url}) {
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${tr(LocaleKeys.openUrlError)} $url"),
      ),
    );
  }
}

Future<void> launchURL(String url) async {
  try {
    await launchUrl(Uri.parse(url));
  } catch (e) {
    throw '${tr(LocaleKeys.openUrlError)} $url';
  }
}

Future<void> safeLaunchURL(BuildContext context, String? url) async {
  if (url == null || url.isEmpty) return;
  try {
    await launchURL(url);
  } catch (e) {
    if (context.mounted) {
      showLaunchUrlError(context, url: url);
    }
  }
}

void scrollToPosition(GlobalKey positionKey) {
  final positionKeyCurrentContext = positionKey.currentContext;
  if (positionKeyCurrentContext != null) {
    Scrollable.ensureVisible(
      positionKeyCurrentContext,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }
}
