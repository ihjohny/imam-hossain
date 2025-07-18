import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:imam_hossain/app/app_init/app_init_service.dart';
import 'package:imam_hossain/core/theme/app_theme_service.dart';
import 'package:imam_hossain/features/about/data/about_data_service.dart';
import 'package:imam_hossain/features/experience/data/experience_data_service.dart';
import 'package:imam_hossain/features/personal_info/data/personal_info_data_service.dart';
import 'package:imam_hossain/features/projects/data/project_data_service.dart';
import 'package:imam_hossain/features/skills/data/skills_data_service.dart';
import 'package:imam_hossain/features/top_bar/data/toolbar_data_service.dart';

import '../core/navigation/navigation_keys.dart';
import '../features/certifications/data/certification_data_service.dart';
import '../features/publications/data/publication_data_service.dart';

final GetIt getIt = GetIt.instance;

void setupServices() {
  getIt.registerLazySingleton<AppInitService>(
    () => AppInitService(),
    dispose: (service) => service.dispose(),
  );

  getIt.registerLazySingleton<NavigationKeys>(() => NavigationKeys());

  getIt.registerLazySingleton<ScrollController>(() => ScrollController());

  getIt.registerLazySingleton<AppThemeService>(
    () => AppThemeService(),
    dispose: (service) => service.dispose(),
  );

  getIt.registerLazySingleton<ToolbarDataService>(
    () => ToolbarDataService(),
    dispose: (service) => service.dispose(),
  );

  getIt.registerLazySingleton<PersonalInfoDataService>(
    () => PersonalInfoDataService(),
    dispose: (service) => service.dispose(),
  );

  getIt.registerLazySingleton<AboutDataService>(
    () => AboutDataService(),
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

  getIt.registerLazySingleton<PublicationDataService>(
    () => PublicationDataService(),
    dispose: (service) => service.dispose(),
  );

  getIt.registerLazySingleton<CertificationDataService>(
    () => CertificationDataService(),
    dispose: (service) => service.dispose(),
  );
}
