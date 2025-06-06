import 'package:flutter/material.dart';

class AppAnimatedFadeSlideWidget extends StatefulWidget {
  const AppAnimatedFadeSlideWidget({
    super.key,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 500),
    this.offset = const Offset(0, -64),
    required this.child,
  });

  final Duration delay;
  final Duration duration;
  final Offset offset;
  final Widget child;

  @override
  State<AppAnimatedFadeSlideWidget> createState() => _AnimatedFadeSlideState();
}

class _AnimatedFadeSlideState extends State<AppAnimatedFadeSlideWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _dxAnimation;
  late Animation<double> _dyAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );

    _dxAnimation = Tween<double>(
      begin: widget.offset.dx,
      end: 0.0,
    ).animate(curve);

    _dyAnimation = Tween<double>(
      begin: widget.offset.dy,
      end: 0.0,
    ).animate(curve);

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Opacity(
          opacity: _controller.value,
          child: Transform.translate(
            offset: Offset(_dxAnimation.value, _dyAnimation.value),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
