import 'package:flutter/widgets.dart';

class HorizontalSpacing extends StatelessWidget {
  final double width;

  const HorizontalSpacing([
    this.width = 16,
    Key? key,
  ]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
