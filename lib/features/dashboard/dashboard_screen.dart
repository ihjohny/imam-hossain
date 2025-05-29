import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/responsive_widget.dart';
import 'package:imam_hossain/features/dashboard/dashboard_widget_desktop.dart';
import 'package:imam_hossain/features/dashboard/dashboard_widget_mobile.dart';
import 'package:imam_hossain/features/dashboard/dashboard_widget_tablet.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      body: const SafeArea(
        child: Responsive(
          desktop: DashboardWidgetDesktop(),
          tablet: DashboardWidgetTablet(),
          mobile: DashboardWidgetMobile(),
        ),
      ),
    );
  }
}
