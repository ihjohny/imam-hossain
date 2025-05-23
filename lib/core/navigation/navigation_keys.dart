import 'package:flutter/material.dart';

class NavigationKeys {
  static const about = 'about';
  static const skills = 'skills';
  static const experience = 'experience';
  static const projects = 'projects';
  static const publications = 'publications';
  static const certifications = 'certifications';

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _publicationsKey = GlobalKey();
  final GlobalKey _certificationsKey = GlobalKey();

  late final Map<String, GlobalKey> keyMap;

  NavigationKeys() {
    keyMap = {
      about: _aboutKey,
      skills: _skillsKey,
      experience: _experienceKey,
      projects: _projectsKey,
      publications: _publicationsKey,
      certifications: _certificationsKey,
    };
  }
}
