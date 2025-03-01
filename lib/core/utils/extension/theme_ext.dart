import 'package:flutter/material.dart';

extension ThemeExt on BuildContext {
  ThemeData get themeData => Theme.of(this);

  ColorScheme get colorScheme => themeData.colorScheme;

  TextTheme get textTheme => themeData.textTheme;
}
