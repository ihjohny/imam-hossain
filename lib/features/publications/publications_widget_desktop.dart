import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:imam_hossain/features/common/widgets/custom_grid_widget.dart';
import 'package:imam_hossain/features/common/widgets/vertical_spacing.dart';
import 'package:imam_hossain/features/publications/data/model/publication_data.dart';
import 'package:imam_hossain/features/publications/data/publication_data_service.dart';
import 'package:imam_hossain/features/publications/widgets/publication_item_widget.dart';

import '../../di/di_setup.dart';
import '../../generated/localization/locale_keys.g.dart';

class PublicationsWidgetDesktop extends StatelessWidget {
  const PublicationsWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final publicationDataService = getIt<PublicationDataService>();
    publicationDataService.fetchPublicationData(context.locale);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr(LocaleKeys.publicationsTitleSection),
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFFBF5A55),
          ),
        ),
        const VerticalSpacing(16),
        StreamBuilder<PublicationData>(
          stream: publicationDataService.publications,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.publications.isEmpty) {
              return Center(child: Text(context.tr(LocaleKeys.noDataMSg)));
            }
            final publicationData = snapshot.data!;
            return CustomGridWidget(
              columns: 2,
              horizontalSpacing: 8,
              verticalSpacing: 16,
              children: List.generate(
                publicationData.publications.length,
                (index) {
                  return PublicationItemWidget(
                    publication: publicationData.publications[index],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
