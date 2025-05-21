import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';

import '../../../core/utils/constants/sizes.dart';

class FocusedContentWidget extends StatefulWidget {
  const FocusedContentWidget({
    super.key,
    required this.child,
    this.applyBorder = false,
  });

  final Widget child;
  final bool applyBorder;

  @override
  State<FocusedContentWidget> createState() => _FocusedContentWidgetState();
}

class _FocusedContentWidgetState extends State<FocusedContentWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        decoration: widget.applyBorder
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.px12),
                border: Border.all(
                  width: Sizes.px4,
                  color: context.themeData.colorScheme.primary,
                ),
              )
            : null,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.px8),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              return AnimatedContainer(
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    tileMode: TileMode.decal,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      isHovered ? Colors.black12 : Colors.transparent,
                      isHovered ? Colors.black26 : Colors.transparent,
                      isHovered ? Colors.black54 : Colors.transparent,
                    ],
                  ),
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate,
                transform: isHovered
                    ? (Matrix4.identity()
                      ..translate(0.5 * width, 0.5 * width)
                      ..scale(1.2)
                      ..translate(0.5 * -width, 0.5 * -width))
                    : Matrix4.identity(),
                child: widget.child,
              );
            },
          ),
        ),
      ),
    );
  }
}
