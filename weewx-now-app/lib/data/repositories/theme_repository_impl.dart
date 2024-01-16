import 'package:flutter/material.dart';
import 'package:weewx_now/data/datasources/theme_data_source.dart';
import 'package:weewx_now/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl extends ThemeRepository {
  final ThemeDataSource dataSource;

  ThemeRepositoryImpl({required this.dataSource});

  @override
  Future<ThemeMode> getThemeMode() {
    return dataSource.readThemeMode();
  }

  @override
  Future setThemeMode(ThemeMode mode) async {
    return dataSource.writeThemeMode(mode);
  }
}
