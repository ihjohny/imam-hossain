import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';

import '../../../core/utils/constants/sizes.dart';

class NavItemWidget extends StatefulWidget {
  final String text;
  final VoidCallback onClick;

  const NavItemWidget({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  State<NavItemWidget> createState() => _NavItemWidgetState();
}

class _NavItemWidgetState extends State<NavItemWidget> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(
          () {
            _hovering = true;
          },
        );
      },
      onExit: (_) {
        setState(
          () {
            _hovering = false;
          },
        );
      },
      child: MaterialButton(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: widget.onClick,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.px4),
          child: Text(
            widget.text,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: _hovering ? context.colorScheme.primary : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
