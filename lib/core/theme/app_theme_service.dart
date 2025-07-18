import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:rxdart/rxdart.dart';

import 'app_theme.dart';

class AppThemeService {
  // theme mode
  final BehaviorSubject<bool> _isDarkModeController =
      BehaviorSubject<bool>.seeded(false);

  Stream<bool> get isDarkModeStream => _isDarkModeController.stream;

  bool get isDarkMode => _isDarkModeController.value;

  void toggleTheme() {
    _isDarkModeController.add(!isDarkMode);
  }

  // color scheme
  final BehaviorSubject<FlexScheme> _colorScheme =
      BehaviorSubject<FlexScheme>.seeded(AppTheme.defaultScheme);

  Stream<FlexScheme> get colorSchemeStream => _colorScheme.stream;

  FlexScheme get currentColorScheme => _colorScheme.value;

  void updateColorScheme(FlexScheme scheme) {
    _colorScheme.add(scheme);
  }

  void dispose() {
    _isDarkModeController.close();
    _colorScheme.close();
  }
}
