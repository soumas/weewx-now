import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:weewx_now/domain/repositories/locale_repository.dart';
import 'package:weewx_now/util/constants.dart';

class LocaleRepositoryImpl extends LocaleRepository {
  LocaleRepositoryImpl();

  @override
  Future<Locale> getLocale() async {
    String? persistedLocale = (await SharedPreferences.getInstance()).getString(kSharedPrefKeyLocale);
    if (persistedLocale == null) {
      final sysLocale = _evalSysLocale();
      if (kSupportedLocales.contains(sysLocale)) {
        return Locale(sysLocale);
      } else {
        return const Locale(kDefaultLocale);
      }
    }
    return Locale(persistedLocale);
  }

  @override
  Future setLocale(Locale locale) async {
    final sysLocale = _evalSysLocale();
    if (sysLocale == locale.languageCode) {
      return (await SharedPreferences.getInstance()).remove(kSharedPrefKeyLocale);
    } else {
      return (await SharedPreferences.getInstance()).setString(kSharedPrefKeyLocale, locale.languageCode);
    }
  }

  String _evalSysLocale() {
    return Platform.localeName.substring(0, 2);
  }
}
