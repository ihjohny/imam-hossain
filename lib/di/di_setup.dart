import 'package:get_it/get_it.dart';
import 'package:imam_hossain/app/app_init/app_init_service.dart';
import 'package:imam_hossain/core/theme/app_theme_service.dart';

final GetIt getIt = GetIt.instance;

void setupServices() {
  getIt.registerSingleton<AppInitService>(AppInitService());

  getIt.registerSingleton<AppThemeService>(AppThemeService(),
      dispose: (service) => service.dispose());
}
