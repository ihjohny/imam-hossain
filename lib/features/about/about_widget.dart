import 'package:flutter/material.dart';

import '../common/widgets/responsive_widget.dart';
import 'about_widget_desktop.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: AboutWidgetDesktop(),
    );
  }
}
