import 'package:flutter/material.dart';

class CustomGridWidget extends StatelessWidget {
  final int columns;
  final List<Widget> children;
  final double horizontalSpacing;
  final double verticalSpacing;

  const CustomGridWidget({
    super.key,
    required this.columns,
    required this.children,
    this.horizontalSpacing = 8.0,
    this.verticalSpacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final int rowCount = (children.length / columns).ceil();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(rowCount, (rowIndex) {
        final int startIndex = rowIndex * columns;
        final int endIndex = (rowIndex + 1) * columns;
        final int itemsInThisRow = endIndex <= children.length
            ? columns
            : children.length - startIndex;

        final Row row = Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(columns, (colIndex) {
            final bool hasContent = colIndex < itemsInThisRow;
            final Widget content =
                hasContent ? children[startIndex + colIndex] : Container();

            return Expanded(
              child: colIndex < columns - 1
                  ? Padding(
                      padding: EdgeInsets.only(right: horizontalSpacing),
                      child: content,
                    )
                  : content,
            );
          }),
        );

        return rowIndex < rowCount - 1
            ? Padding(
                padding: EdgeInsets.only(bottom: verticalSpacing),
                child: row,
              )
            : row;
      }),
    );
  }
}
