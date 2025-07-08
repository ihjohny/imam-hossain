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

class _FooterWidgetState extends State<FooterWidget>
    with SingleTickerProviderStateMixin {
  final scrollController = getIt<ScrollController>();
  late AnimationController _animationController;
  late Animation<double> _jumpAnimation;

  double _height = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_displayFooter);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _jumpAnimation = Tween<double>(
      begin: 1.0,
      end: 1.3,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    scrollController.removeListener(_displayFooter);
    _animationController.dispose();
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
        child: RichText(
          textAlign: TextAlign.center,
          maxLines: 1,
          text: TextSpan(
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.primary,
            ),
            children: [
              TextSpan(text: '${context.tr(LocaleKeys.footerCraftedWith)} '),
              WidgetSpan(
                child: AnimatedBuilder(
                  animation: _jumpAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _jumpAnimation.value,
                      child: const FlutterLogo(
                        size: 20,
                      ),
                    );
                  },
                ),
              ),
              TextSpan(
                  text: ' ${context.tr(LocaleKeys.footerCopyright, namedArgs: {
                    'year': DateTime.now().year.toString()
                  })}'),
            ],
          ),
        ),
      ),
    );
  }
}
