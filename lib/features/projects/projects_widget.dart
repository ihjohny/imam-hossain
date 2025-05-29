import 'package:flutter/material.dart';

import '../common/widgets/responsive_widget.dart';
import 'projects_widget_desktop.dart';
import 'projects_widget_tablet.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: ProjectsWidgetDesktop(),
      tablet: ProjectsWidgetTablet(),
    );
  }
}
