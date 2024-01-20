import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weewx_now_app/util/constants.dart';

abstract class ThemeDataSource {
  Future<ThemeMode> readThemeMode();
  Future writeThemeMode(ThemeMode themeMode);
}

class ThemeDataSourceImpl extends ThemeDataSource {
  @override
  Future<ThemeMode> readThemeMode() async {
    final persisted = (await SharedPreferences.getInstance())
        .getString(kSharedPrefKeyThemeMode);
    if (persisted != null && persisted == ThemeMode.dark.toString()) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  @override
  Future writeThemeMode(ThemeMode themeMode) async {
    (await SharedPreferences.getInstance())
        .setString(kSharedPrefKeyThemeMode, themeMode.toString());
  }
}
