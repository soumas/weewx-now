import 'package:flutter/material.dart';

abstract class ThemeRepository {
  Future<ThemeMode> getThemeMode();
  Future setThemeMode(ThemeMode mode);
}
