import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weewx_now_app/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now_app/domain/entities/wee_wx_config/wee_wx_config.dart';
import 'package:weewx_now_app/domain/repositories/weewx_endpoint_repository.dart';
import 'package:weewx_now_app/domain/repositories/weewx_station_repository.dart';

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

    on<UserInputUrl>((event, emit) async {
      emit(AddStationScreenData(userInputUrl: event.input));
    });

    on<RunEndpointCheck>((event, emit) async {
      try {
        emit(stateData.copyWith(endpointCheckRunning: true));
        WeeWxConfig cfg = await stationRepository.loadSettings(WeewxEndpoint(name: '', url: stateData.userInputUrl));
        emit(AddStationScreenData(
          userInputUrl: stateData.userInputUrl,
          weeWxConfig: cfg,
        ));
      } catch (e) {
        emit(stateData.copyWith(endpointCheckError: e.toString()));
      } finally {
        emit(stateData.copyWith(endpointCheckRunning: false));
      }
    });

    on<AddStation>((event, emit) async {
      final ep = WeewxEndpoint(name: stateData.weeWxConfig!.station.location, url: stateData.userInputUrl);
      await endpointRepository.addOrUpdateEndpoint(ep);
      emit(AddStationCompleted(endpoint: ep));
    });

    on<ClearStation>((event, emit) async {
      emit(AddStationScreenData(userInputUrl: stateData.userInputUrl));
    });
  }
  AddStationScreenData get stateData => state as AddStationScreenData;
}
