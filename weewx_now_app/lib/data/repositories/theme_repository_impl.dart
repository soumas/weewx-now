import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weewx_now/domain/repositories/theme_repository.dart';
import 'package:weewx_now/util/constants.dart';

class ThemeRepositoryImpl extends ThemeRepository {
  ThemeRepositoryImpl();

  @override
  Future<ThemeMode> getThemeMode() async {
    String? persistedThemeMode = (await SharedPreferences.getInstance()).getString(kSharedPrefKeyThemeMode);
    if (persistedThemeMode == null) {
      return ThemeMode.system;
    }
    return persistedThemeMode == ThemeMode.dark.toString() ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Future setThemeMode(ThemeMode mode) async {
    return (await SharedPreferences.getInstance()).setString(kSharedPrefKeyThemeMode, mode.toString());
  }
}
