import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  /// Default color scheme for the app
  static const FlexScheme defaultScheme = FlexScheme.flutterDash;

  // Get light theme with a custom scheme
  static ThemeData light([FlexScheme? scheme]) => FlexThemeData.light(
        scheme: scheme ?? defaultScheme,
        appBarElevation: 2.0,
        appBarStyle: FlexAppBarStyle.primary,
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          tintedDisabledControls: true,
          useM2StyleDividerInM3: true,
          adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          alignedDropdown: true,
          navigationRailUseIndicator: true,
          navigationRailLabelType: NavigationRailLabelType.all,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      );

  // Get dark theme with a custom scheme
  static ThemeData dark([FlexScheme? scheme]) => FlexThemeData.dark(
        scheme: scheme ?? defaultScheme,
        appBarElevation: 2.0,
        appBarStyle: FlexAppBarStyle.primary,
        subThemesData: const FlexSubThemesData(
          interactionEffects: true,
          tintedDisabledControls: true,
          blendOnColors: true,
          useM2StyleDividerInM3: true,
          adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
          inputDecoratorIsFilled: true,
          inputDecoratorBorderType: FlexInputBorderType.outline,
          alignedDropdown: true,
          navigationRailUseIndicator: true,
          navigationRailLabelType: NavigationRailLabelType.all,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
      );
}
