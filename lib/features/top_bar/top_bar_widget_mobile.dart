import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';

class TopBarWidgetMobile extends StatelessWidget
    implements PreferredSizeWidget {
  const TopBarWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colorScheme.primary,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: context.colorScheme.primary,
      ),
      title: const AppEmptyWidget(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
