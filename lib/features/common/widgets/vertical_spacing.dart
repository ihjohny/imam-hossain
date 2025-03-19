import 'package:flutter/widgets.dart';

class VerticalSpacing extends StatelessWidget {
  final double height;

  const VerticalSpacing([
    this.height = 16,
    Key? key,
  ]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
