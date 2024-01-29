import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weewx_now_app/data/datasources/locale_data_source.dart';
import 'package:weewx_now_app/domain/repositories/locale_repository.dart';
import 'package:weewx_now_app/util/constants.dart';

class LocaleRepositoryImpl extends LocaleRepository {
  final LocaleDataSource dataSource;

  LocaleRepositoryImpl({required this.dataSource});

  @override
  Future<Locale> getLocale() async {
    String? persistedLocale = await dataSource.readLocale();
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
      return dataSource.writeLocale(null);
    } else {
      return dataSource.writeLocale(locale.languageCode);
    }
  }

  String _evalSysLocale() {
    return Platform.localeName.substring(0, 2);
  }
}
