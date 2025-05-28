import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';

import '../../../core/utils/constants/sizes.dart';
import '../../common/data/model/app_tag.dart';
import '../../common/widgets/app_empty_widget.dart';
import '../../common/widgets/app_image_widget.dart';
import '../../common/widgets/app_wrap_widget.dart';
import '../../common/widgets/logo_icon_widget.dart';

class PersonalInfoTags extends StatelessWidget {
  final List<AppTag>? tags;
  const PersonalInfoTags({super.key, this.tags});

  @override
  Widget build(BuildContext context) {
    return AppWrapWidget(
      spacing: Sizes.px12,
      children: List.generate(
        tags?.length ?? 0,
        (index) {
          if (tags?[index].logo != null) {
            return LogoIconWidget(
              child: AppImageWidget(
                appImage: tags![index].logo!,
                tintColor: context.themeData.colorScheme.shadow,
                width: Sizes.px32,
              ),
            );
          } else {
            return const AppEmptyWidget();
          }
        },
      ),
    );
  }
}
