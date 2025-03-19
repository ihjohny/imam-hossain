import 'package:flutter/material.dart';

import '../common/widgets/responsive_widget.dart';
import 'experience_widget_desktop.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: ExperienceWidgetDesktop(),
    );
  }
}
