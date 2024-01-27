import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:weewx_now_app/domain/repositories/theme_repository.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemeRepository themeRepository;

  ThemeCubit({
    required this.themeRepository,
  }) : super(ThemeInitial());

  Future init() async {
    setThemeMode(await themeRepository.getThemeMode());
  }

  ThemeMode? _themeMode;
  ThemeMode? get currentThemeMode => _themeMode;

  toggleThemeMode() async {
    if (_themeMode == ThemeMode.dark) {
      setThemeMode(ThemeMode.light);
    } else {
      setThemeMode(ThemeMode.dark);
    }
  }

  setThemeMode(ThemeMode themeMode) async {
    _themeMode = themeMode;
    await themeRepository.setThemeMode(themeMode);
    emit(ThemeChanged());
  }
}
