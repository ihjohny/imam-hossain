import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/di/di_setup.dart';
import 'package:imam_hossain/generated/localization/locale_keys.g.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  final scrollController = getIt<ScrollController>();

  double _height = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_displayFooter);
  }

  @override
  void dispose() {
    scrollController.removeListener(_displayFooter);
    super.dispose();
  }

  void _displayFooter() {
    final scrollPosition = scrollController.position;
    if (scrollPosition.pixels >= scrollPosition.maxScrollExtent - 64) {
      setState(() => _height = kBottomNavigationBarHeight);
    } else {
      setState(() => _height = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: double.maxFinite,
      height: _height,
      color: context.colorScheme.surfaceContainer,
      child: Center(
        child: Text(
          context.tr(LocaleKeys.footerTitle),
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium,
          maxLines: 1,
        ),
      ),
    );
  }
}
