import 'package:rxdart/rxdart.dart';

class AppThemeService {
  final BehaviorSubject<bool> _isDarkModeController =
      BehaviorSubject<bool>.seeded(false);

  Stream<bool> get isDarkModeStream => _isDarkModeController.stream;

  bool get isDarkMode => _isDarkModeController.value;

  void toggleTheme() {
    _isDarkModeController.add(!isDarkMode);
  }

  void dispose() {
    _isDarkModeController.close();
  }
}
