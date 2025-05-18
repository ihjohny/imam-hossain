import 'dart:ui';

import 'package:imam_hossain/features/projects/data/model/project_data.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/localization/json_translation.dart';
import '../../../generated/localization/locale_keys.g.dart';

class ProjectDataService {
  final BehaviorSubject<ProjectData> _projects = BehaviorSubject<ProjectData>();

  Stream<ProjectData> get projects => _projects.stream;

  Future<void> fetchProjectData(Locale locale) async {
    final jsonProjectData = trList(locale, LocaleKeys.projectsData);
    _projects.add(ProjectData.fromJson(jsonProjectData));
  }

  void dispose() {
    _projects.close();
  }
}
