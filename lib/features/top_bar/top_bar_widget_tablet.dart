import 'package:flutter/material.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';

class TopBarWidgetTablet extends StatelessWidget
    implements PreferredSizeWidget {
  const TopBarWidgetTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppEmptyWidget(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
