import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:weewx_now_app/data/datasources/theme_data_source.dart';
import 'package:weewx_now_app/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl extends ThemeRepository {
  final ThemeDataSource dataSource;

  ThemeRepositoryImpl({required this.dataSource});

  @override
  Future<ThemeMode> getThemeMode() async {
    String? persistedThemeMode = await dataSource.readThemeMode();
    if (persistedThemeMode == null) {
      return ThemeMode.system;
    }
    return persistedThemeMode == ThemeMode.dark.toString() ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Future setThemeMode(ThemeMode mode) async {
    final sysThemeMode = SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
    if (ThemeMode.system == mode || mode == sysThemeMode) {
      return dataSource.writeThemeMode(null);
    } else {
      return dataSource.writeThemeMode(mode.toString());
    }
  }
}
