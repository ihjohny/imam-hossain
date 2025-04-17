import 'package:flutter/material.dart';

import '../common/widgets/responsive_widget.dart';
import 'certifications_widget_desktop.dart';

class CertificationsWidget extends StatelessWidget {
  const CertificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: CertificationsWidgetDesktop(),
    );
  }
}
