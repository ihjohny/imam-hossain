import 'package:flutter/material.dart';

import '../../color_scheme_selection/color_scheme_selection_dialog.dart';
import '../../common/widgets/app_cursors_button_widget.dart';

class AppColorSwitchWidget extends StatelessWidget {
  const AppColorSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCursorsButtonWidget(
      child: const Icon(Icons.color_lens_sharp),
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => const ColorSchemeSelectionDialog(),
        );
      },
    );
  }
}
