import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/wee_wx_config.dart';
import 'package:weewx_now/domain/repositories/weewx_endpoint_repository.dart';
import 'package:weewx_now/domain/repositories/weewx_station_repository.dart';

part 'add_station_precheck_screen_event.dart';
part 'add_station_precheck_screen_state.dart';

class AddStationPrecheckScreenBloc extends Bloc<AddStationPrecheckScreenEvent, AddStationPrecheckScreenState> {
  final WeewxStationRepository stationRepository;
  final WeewxEndpointRepository endpointRepository;

  AddStationPrecheckScreenBloc({
    required this.stationRepository,
    required this.endpointRepository,
  }) : super(AddStationPrecheckScreenInitial()) {
    on<RunCheck>((event, emit) async {
      try {
        emit(AddStationPrecheckRunning(url: event.url));
        WeeWxConfig cfg = await stationRepository.loadSettings(WeewxEndpoint(name: '', url: event.url));
        emit(AddStationPrecheckSuccess(weeWxConfig: cfg));
      } catch (e) {
        emit(AddStationPrecheckFailed(lastCheckedUrl: event.url, error: e));
      }
    });
  }
}
