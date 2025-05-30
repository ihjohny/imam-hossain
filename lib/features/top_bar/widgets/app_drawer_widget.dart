import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/responsive_ext.dart';
import 'package:imam_hossain/core/utils/helper/helper_utils.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/top_bar/data/model/toolbar_data.dart';
import 'package:imam_hossain/features/top_bar/data/toolbar_data_service.dart';
import 'package:imam_hossain/features/top_bar/widgets/nav_item_widget.dart';

import '../../../core/navigation/navigation_keys.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../di/di_setup.dart';
import '../data/model/toolbar_item.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final toolbarDataService = getIt<ToolbarDataService>();
    toolbarDataService.fetchToolbarData(context.locale);
    final navigationKeyMap = getIt<NavigationKeys>().keyMap;

    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(Sizes.px8),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
            Divider(
              height: Sizes.px8,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
            const VerticalSpacing(Sizes.px16),
            Expanded(
              child: StreamBuilder<ToolbarData>(
                stream: toolbarDataService.toolbarData,
                builder: (context, snapshot) {
                  final items = snapshot.data?.getToolbarItems(
                    context.deviceType,
                  );
                  if (items == null || items.isEmpty) {
                    return const Center(child: AppEmptyWidget());
                  }
                  return ListView(
                    padding: EdgeInsets.zero,
                    children: _buildNavItemWidgets(
                      context,
                      items,
                      navigationKeyMap,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildNavItemWidgets(
    BuildContext context,
    List<ToolbarItem> items,
    Map<String, GlobalKey> navigationKeyMap,
  ) {
    return items
        .map((item) => Column(
              children: [
                NavItemWidget(
                  text: item.title ?? '',
                  onClick: () {
                    final key = item.key;
                    final navKey = key != null ? navigationKeyMap[key] : null;
                    if (navKey != null) {
                      Navigator.of(context).pop();
                      scrollToPosition(navKey);
                    }
                  },
                ),
                const VerticalSpacing(Sizes.px16),
              ],
            ))
        .toList();
  }
}
