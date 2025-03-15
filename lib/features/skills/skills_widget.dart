import 'package:flutter/material.dart';

import '../common/widgets/responsive_widget.dart';
import 'skills_widget_desktop.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: SkillsWidgetDesktop(),
    );
  }
}
