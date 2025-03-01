import 'package:flutter/material.dart';
import 'package:imam_hossain/features/personal_info/personal_info_widget.dart';

class DashboardWidgetDesktop extends StatelessWidget {
  const DashboardWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: PersonalInfoWidget(),
        ),
        Expanded(
          flex: 8,
          child: Container(
            color: Colors.green,
            height: 100,
            child: Center(child: Text("70%")),
          ),
        ),
      ],
    );
  }
}
