import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weewx_now_app/domain/repositories/locale_repository.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final LocaleRepository localeRepository;

  LocaleCubit({
    required this.localeRepository,
  }) : super(LocaleInitial());

  Future init() async {
    setLocale(await localeRepository.getLocale());
  }

  Locale? _locale;
  Locale? get currentLocale => _locale;

  setLocale(Locale locale) async {
    _locale = locale;
    await localeRepository.setLocale(locale);
    emit(LocaleChanged());
  }
}
