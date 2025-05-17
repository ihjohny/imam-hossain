import 'package:flutter/material.dart';

import '../../../core/utils/constants/sizes.dart';

class AppCardWidget extends StatelessWidget {
  const AppCardWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.px16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.px16),
        child: child,
      ),
    );
  }
}
