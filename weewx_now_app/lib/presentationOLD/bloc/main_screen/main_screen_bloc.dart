import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:weewx_now_app/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now_app/domain/entities/image/image_bundle.dart';
import 'package:weewx_now_app/domain/entities/wee_wx_config/wee_wx_config.dart';
import 'package:weewx_now_app/domain/entities/weather/weather_data.dart';

import 'package:weewx_now_app/domain/repositories/weewx_endpoint_repository.dart';
import 'package:weewx_now_app/domain/repositories/weewx_station_repository.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final WeewxStationRepository stationRepository;
  final WeewxEndpointRepository endpointRepository;

  MainScreenBloc({
    required this.stationRepository,
    required this.endpointRepository,
  }) : super(MainScreenInitial()) {
    on<InitMainScreen>((event, emit) async {
      // load existing endpoints
      List<WeewxEndpoint> localEndpoints = await endpointRepository.loadEndpoints();

      // initial endpoint is defined (url param 'endpoint')
      if (event.initialEndpoint != null) {
        WeewxEndpoint? ep = localEndpoints.firstWhereOrNull((element) => element.url == event.initialEndpoint);
        if (ep == null) {
          // the initial endpoint is new
          emit(NewInitialEndpoint(endpoint: WeewxEndpoint(name: '', url: event.initialEndpoint!)));
        } else {
          // the initial endpoint is known
          emit(EndpointChanged(endpoint: ep));
        }
      } else {
        WeewxEndpoint? lastSelectedEndpoint = await endpointRepository.loadLastSelectedEndpoint();
        if (lastSelectedEndpoint != null) {
          if (localEndpoints.any((element) => element.url == lastSelectedEndpoint.url)) {
            emit(EndpointChanged(endpoint: lastSelectedEndpoint));
          } else if (localEndpoints.isNotEmpty) {
            emit(EndpointChanged(endpoint: localEndpoints.first));
          } else {
            emit(NoEndpointAvailable());
          }
        } else {
          emit(NoEndpointAvailable());
        }
      }
    });

    on<ChangeEndpoint>((event, emit) async {
      emit(LoadingMainScreenData());
      await endpointRepository.saveLastSelectedEndpoint(event.endpoint);
      emit(EndpointChanged(endpoint: event.endpoint));
    });

    on<LoadMainScreenData>((event, emit) async {
      if (state is MainScreenData) {
        emit((state as MainScreenData).copyWith(busy: true));
      } else {
        emit(LoadingMainScreenData());
      }

      await Future.delayed(const Duration(seconds: 1));

      final weather = await stationRepository.loadWeather(event.endpoint);
      final settings = await stationRepository.loadSettings(event.endpoint);
      final endpointOptions = await endpointRepository.loadEndpoints();

      emit(MainScreenData(
        endpoint: event.endpoint,
        endpointOptions: endpointOptions,
        weather: weather,
        settings: settings,
      ));
    });
  }
}
