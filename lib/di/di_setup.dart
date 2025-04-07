import 'package:get_it/get_it.dart';
import 'package:imam_hossain/app/app_init/app_init_service.dart';
import 'package:imam_hossain/core/theme/app_theme_service.dart';
import 'package:imam_hossain/features/experience/data/experience_data_service.dart';
import 'package:imam_hossain/features/projects/data/project_data_service.dart';
import 'package:imam_hossain/features/skills/data/skills_data_service.dart';

import '../core/navigation/navigation_keys.dart';

final GetIt getIt = GetIt.instance;

void setupServices() {
  getIt.registerSingleton<AppInitService>(AppInitService());

  getIt.registerSingleton<NavigationKeys>(NavigationKeys());

  getIt.registerSingleton<AppThemeService>(
    AppThemeService(),
    dispose: (service) => service.dispose(),
  );

  getIt.registerLazySingleton<SkillsDataService>(
    () => SkillsDataService(),
    dispose: (service) => service.dispose(),
  );

  getIt.registerLazySingleton<ExperienceDataService>(
    () => ExperienceDataService(),
    dispose: (service) => service.dispose(),
  );

  getIt.registerLazySingleton<ProjectDataService>(
    () => ProjectDataService(),
    dispose: (service) => service.dispose(),
  );
}
