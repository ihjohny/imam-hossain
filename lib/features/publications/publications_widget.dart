import 'package:flutter/material.dart';

import '../common/widgets/responsive_widget.dart';
import 'publications_widget_desktop.dart';
import 'publications_widget_mobile.dart';

class PublicationsWidget extends StatelessWidget {
  const PublicationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: PublicationsWidgetDesktop(),
      mobile: PublicationsWidgetMobile(),
    );
  }
}
