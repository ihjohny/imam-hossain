import 'package:flutter/material.dart';
import 'package:imam_hossain/features/common/widgets/app_selection_area_widget.dart';
import 'package:imam_hossain/features/personal_info/personal_info_widget_desktop.dart';

import '../common/widgets/responsive_widget.dart';
import 'personal_info_widget_mobile.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppSelectionAreaWidget(
      child: Responsive(
        desktop: PersonalInfoWidgetDesktop(),
        mobile: PersonalInfoWidgetMobile(),
      ),
    );
  }
}
