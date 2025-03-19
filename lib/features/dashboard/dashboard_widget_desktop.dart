import 'package:flutter/material.dart';
import 'package:imam_hossain/features/about/about_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/experience/experience_widget.dart';
import 'package:imam_hossain/features/personal_info/personal_info_widget.dart';
import 'package:imam_hossain/features/skills/skills_widget.dart';
import 'package:imam_hossain/features/top_bar/top_bar_widget.dart';

class DashboardWidgetDesktop extends StatelessWidget {
  const DashboardWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.33,
          child: const PersonalInfoWidget(),
        ),
        const Expanded(
          child: Column(
            children: [
              TopBarWidget(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AboutWidget(),
                        VerticalSpacing(16),
                        SkillsWidget(),
                        VerticalSpacing(16),
                        ExperienceWidget(),
                        VerticalSpacing(16),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
