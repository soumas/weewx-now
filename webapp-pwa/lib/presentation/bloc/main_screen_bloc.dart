import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:weewx_pwa/domain/entities/image/image_category_entity.dart';

import 'package:weewx_pwa/domain/entities/weather/time_period.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenInitial()) {
    on<ChangeStation>((event, emit) async {});

    on<UpdateMainScreenData>((event, emit) async {});
  }
}
