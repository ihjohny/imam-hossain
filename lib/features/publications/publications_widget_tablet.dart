import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/features/common/widgets/app_no_data_widget.dart';
import 'package:imam_hossain/features/common/widgets/app_section_widget.dart';
import 'package:imam_hossain/features/common/widgets/custom_grid_widget.dart';
import 'package:imam_hossain/features/publications/data/model/publication.dart';
import 'package:imam_hossain/features/publications/data/model/publication_data.dart';
import 'package:imam_hossain/features/publications/data/publication_data_service.dart';
import 'package:imam_hossain/features/publications/widgets/publication_item_widget.dart';

import '../../core/utils/constants/sizes.dart';
import '../../di/di_setup.dart';
import '../../generated/localization/locale_keys.g.dart';

class PublicationsWidgetTablet extends StatelessWidget {
  const PublicationsWidgetTablet({super.key});

  @override
  Widget build(BuildContext context) {
    final publicationDataService = getIt<PublicationDataService>();
    publicationDataService.fetchPublicationData(context.locale);

    return AppSectionWidget(
      title: context.tr(LocaleKeys.publicationsTitleSection),
      contentWidget: StreamBuilder<PublicationData>(
        stream: publicationDataService.publications,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.publications.isEmpty) {
            return const AppNoDataWidget();
          }
          return _buildPublicationsGrid(context, snapshot.data!.publications);
        },
      ),
    );
  }

  Widget _buildPublicationsGrid(
      BuildContext context, List<Publication> publications) {
    return CustomGridWidget(
      columns: 1,
      horizontalSpacing: Sizes.px8,
      verticalSpacing: Sizes.px16,
      children: List.generate(
        publications.length,
        (index) => PublicationItemWidget(publication: publications[index]),
      ),
    );
  }
}
