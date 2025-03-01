// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "name": "Md Imam Hossain",
  "position": "Senior Software Engineer",
  "subDescription": "Who loves to tinker with new technologies and build cool mobile apps from crafting seamless user experiences to architecting robust solutions.",
  "resumeUrl": "https://drive.google.com/file/d/1UVBpzDWfOwwaZQb176yc8DGHHXkcnk47/view?usp=sharing",
  "githubUrl": "https://github.com/ihjohny",
  "linkedinUrl": "https://www.linkedin.com/in/ihjohny",
  "emailUrl": "mailto:iimamhossain23@gmail.com"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
