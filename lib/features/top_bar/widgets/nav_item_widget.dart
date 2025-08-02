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

class _NavItemWidgetState extends State<NavItemWidget>
    with SingleTickerProviderStateMixin {
  bool _hovering = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onHover(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
    if (hovering) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.px8),
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: Sizes.px2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.px16),
                  gradient: _hovering
                      ? LinearGradient(
                          colors: [
                            context.colorScheme.primary.withValues(alpha: .1),
                            context.colorScheme.primary.withValues(alpha: .05),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  boxShadow: _hovering
                      ? [
                          BoxShadow(
                            color: context.colorScheme.primary
                                .withValues(alpha: .2),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ]
                      : null,
                  border: Border.all(
                    color: context.colorScheme.primary.withValues(alpha: .5),
                    width: 1,
                  ),
                ),
                child: MaterialButton(
                  hoverColor: Colors.transparent,
                  splashColor:
                      context.colorScheme.primary.withValues(alpha: .1),
                  highlightColor:
                      context.colorScheme.primary.withValues(alpha: 0.05),
                  onPressed: widget.onClick,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.px12,
                      vertical: Sizes.px4,
                    ),
                    child: Text(
                      widget.text,
                      style: context.themeData.textTheme.titleMedium?.copyWith(
                        fontWeight:
                            _hovering ? FontWeight.w600 : FontWeight.w500,
                        color: _hovering
                            ? context.colorScheme.primary
                            : context.colorScheme.onSurface,
                        letterSpacing: _hovering ? 0.5 : 0.2,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
