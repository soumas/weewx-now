import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weewx_now/data/models/now_station_settings_model.dart';
import 'package:weewx_now/domain/entities/endpoint/endpoint.dart';
import 'package:weewx_now/domain/repositories/weewx_station_repository.dart';

part 'add_station_precheck_screen_event.dart';
part 'add_station_precheck_screen_state.dart';

class AddStationPrecheckScreenBloc extends Bloc<AddStationPrecheckScreenEvent, AddStationPrecheckScreenState> {
  final WeewxStationRepository stationRepository;

  AddStationPrecheckScreenBloc({
    required this.stationRepository,
  }) : super(AddStationPrecheckScreenInitial()) {
    on<RunCheck>((event, emit) async {
      try {
        emit(AddStationPrecheckRunning(url: event.url));
        NowStationSettingsModel cfg = await stationRepository.loadSettings(Endpoint(name: '', url: event.url));
        emit(AddStationPrecheckSuccess(endpointUrl: event.url, settings: cfg));
      } catch (e) {
        emit(AddStationPrecheckFailed(lastCheckedUrl: event.url, error: e));
      }
    });
  }
}
