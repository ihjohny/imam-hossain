import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:imam_hossain/features/top_bar/data/model/toolbar_data.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/localization/json_translation.dart';
import '../../../generated/localization/locale_keys.g.dart';

class ToolbarDataService {
  final BehaviorSubject<ToolbarData> _toolbarData =
      BehaviorSubject<ToolbarData>();

  Stream<ToolbarData> get toolbarData => _toolbarData.stream;

  Future<void> fetchToolbarData(Locale locale) async {
    final jsonToolbarData = trList(locale, LocaleKeys.toolbarData);
    _toolbarData.add(ToolbarData.fromJson(jsonToolbarData));
  }

  void dispose() {
    _toolbarData.close();
  }
}
