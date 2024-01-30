import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/wee_wx_config.dart';
import 'package:weewx_now/domain/repositories/weewx_endpoint_repository.dart';
import 'package:weewx_now/domain/repositories/weewx_station_repository.dart';

part 'add_station_screen_event.dart';
part 'add_station_screen_state.dart';

class AddStationScreenBloc extends Bloc<AddStationScreenEvent, AddStationScreenState> {
  final WeewxStationRepository stationRepository;
  final WeewxEndpointRepository endpointRepository;

  AddStationScreenBloc({
    required this.stationRepository,
    required this.endpointRepository,
  }) : super(AddStationScreenInitial()) {
    on<InitAddStationScreenData>((event, emit) async {
      emit(AddStationScreenData());
    });

    on<RunEndpointCheck>((event, emit) async {
      try {
        emit(stateData.copyWith(endpointCheckRunning: true, lastCheckeEndpoint: event.url));
        WeeWxConfig cfg = await stationRepository.loadSettings(WeewxEndpoint(name: '', url: event.url));
        emit(AddStationScreenData(
          lastCheckeEndpoint: stateData.lastCheckeEndpoint,
          weeWxConfig: cfg,
        ));
      } catch (e) {
        emit(stateData.copyWith(endpointCheckError: e.toString()));
      } finally {
        emit(stateData.copyWith(endpointCheckRunning: false));
      }
    });

    on<AddStation>((event, emit) async {
      final ep = WeewxEndpoint(name: stateData.weeWxConfig!.station.location, url: stateData.lastCheckeEndpoint);
      await endpointRepository.addOrUpdateEndpoint(ep);
      emit(AddStationCompleted(endpoint: ep));
    });

    on<ClearStation>((event, emit) async {
      emit(AddStationScreenData(lastCheckeEndpoint: stateData.lastCheckeEndpoint));
    });
  }
  AddStationScreenData get stateData => state as AddStationScreenData;
}
