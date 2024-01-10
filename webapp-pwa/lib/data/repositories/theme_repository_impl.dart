import 'package:flutter/material.dart';
import 'package:weewx_pwa/data/datasources/theme_data_source.dart';
import 'package:weewx_pwa/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl extends ThemeRepository {
  final ThemeDataSource themeDataSource;

  ThemeRepositoryImpl({required this.themeDataSource});

  @override
  Future<ThemeMode> getThemeMode() {
    return themeDataSource.readThemeMode();
  }

  @override
  Future setThemeMode(ThemeMode mode) async {
    return themeDataSource.writeThemeMode(mode);
  }
}
