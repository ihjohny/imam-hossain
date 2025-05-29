import 'package:flutter/material.dart';
import 'package:imam_hossain/features/common/widgets/responsive_widget.dart';
import 'package:imam_hossain/features/dashboard/dashboard_widget_desktop.dart';
import 'package:imam_hossain/features/dashboard/dashboard_widget_mobile.dart';
import 'package:imam_hossain/features/dashboard/dashboard_widget_tablet.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: DashboardWidgetDesktop(),
      tablet: DashboardWidgetTablet(),
      mobile: DashboardWidgetMobile(),
    );
  }
}
