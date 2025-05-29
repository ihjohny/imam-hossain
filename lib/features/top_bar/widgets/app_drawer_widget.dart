import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/features/top_bar/data/toolbar_data_service.dart';
import 'package:imam_hossain/features/top_bar/widgets/nav_item_widget.dart';
import 'package:imam_hossain/features/top_bar/data/model/toolbar_data.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';
import 'package:imam_hossain/core/utils/helper/helper_utils.dart';
import '../../../core/navigation/navigation_keys.dart';
import '../../../di/di_setup.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final toolbarDataService = getIt<ToolbarDataService>();
    toolbarDataService.fetchToolbarData(context.locale);
    final navigationKeyMap = getIt<NavigationKeys>().keyMap;

    return Drawer(
      child: StreamBuilder<ToolbarData>(
        stream: toolbarDataService.toolbarData,
        builder: (context, snapshot) {
          final items = snapshot.data?.items;
          if (items == null || items.isEmpty) {
            return const Center(child: AppEmptyWidget());
          }
          return ListView(
            padding: EdgeInsets.zero,
            children: items
                .map((item) => NavItemWidget(
                      text: item.title ?? '',
                      onClick: () {
                        final key = item.key;
                        if (key != null && navigationKeyMap.containsKey(key)) {
                          final navKey = navigationKeyMap[key];
                          if (navKey != null) {
                            Navigator.of(context).pop();
                            scrollToPosition(navKey);
                          }
                        }
                      },
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
