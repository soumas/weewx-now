import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:weewx_pwa/domain/entities/image/image_category_entity.dart';

import 'package:weewx_pwa/domain/entities/main_screen_data_entity.dart';
import 'package:weewx_pwa/domain/entities/weather/time_period.dart';
import 'package:weewx_pwa/domain/usecases/change_station_usecase.dart';
import 'package:weewx_pwa/domain/usecases/update_main_screen_data_usecase.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final ChangeStationUsecase changeStationUsecase;
  final UpdateMainScreenDataUsecase updateWeatherDataUsecase;

  MainScreenBloc({
    required this.changeStationUsecase,
    required this.updateWeatherDataUsecase,
  }) : super(MainScreenInitial()) {
    on<ChangeStation>((event, emit) async {
      emit(ChangingStation(endpoint: event.endpoint));
      final data = await changeStationUsecase.execute(event.endpoint);
      emit(MainScreenData(
        isUpdating: false,
        data: data,
        selectedTimePeriod: TimePeriod.current,
        selectedImageCategory: data.images.map.isNotEmpty
            ? data.images.map.keys.first
            : ImageCategoryEntity(id: 'dummy'),
      ));
    });

    on<UpdateMainScreenData>((event, emit) async {
      if (state is MainScreenData) {
        emit((state as MainScreenData).copyWith(isUpdating: true));
        final data = await updateWeatherDataUsecase.execute();
        emit((state as MainScreenData).copyWith(data: data, isUpdating: false));
      }
    });
  }
}
