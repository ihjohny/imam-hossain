import 'package:flutter/material.dart';
import 'package:imam_hossain/core/utils/extension/theme_ext.dart';
import 'package:imam_hossain/features/common/widgets/app_card_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_cursors_button_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_empty_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_tag_chip_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_wrap_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/publications/data/model/publication.dart';

import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/helper/helper_utils.dart';

class PublicationItemWidget extends StatelessWidget {
  final Publication publication;

  const PublicationItemWidget({
    super.key,
    required this.publication,
  });

  @override
  Widget build(BuildContext context) {
    return AppCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWrapWidget(
            children: publication.tags
                    ?.map(
                      (item) => AppTagChipWidget(appTag: item),
                    )
                    .toList() ??
                [const AppEmptyWidget()],
          ),
          const VerticalSpacing(Sizes.px12),
          _buildClickableTitle(
            context,
            publication.title,
            publication.url,
          ),
          const VerticalSpacing(Sizes.px4),
          Text(
            publication.description ?? "",
            style: context.textTheme.titleSmall?.copyWith(
              color: context.themeData.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClickableTitle(
    BuildContext context,
    String? title,
    String? url,
  ) {
    return AppCursorsButtonWidget(
      onPressed: () {
        safeLaunchURL(context, url);
      },
      child: Text(
        title ?? "",
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
