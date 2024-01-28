import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weewx_now_app/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now_app/domain/entities/image/image_bundle.dart';
import 'package:weewx_now_app/domain/entities/weather/weather_data.dart';
import 'package:weewx_now_app/domain/entities/wee_wx_config/wee_wx_config.dart';
import 'package:weewx_now_app/domain/repositories/weewx_station_repository.dart';

part 'dashboard_screen_event.dart';
part 'dashboard_screen_state.dart';

class DashboardScreenBloc extends Bloc<DashboardScreenEvent, DashboardScreenState> {
  final WeewxStationRepository stationRepository;

  DashboardScreenBloc({
    required this.stationRepository,
  }) : super(DashboardScreenInitial()) {
    on<LoadDashboardData>((event, emit) async {
      try {
        if (state is DashboardData) {
          emit((state as DashboardData).copyWith(loading: true));
        }
        if (_isFirstRequestForEndpoint(event)) {
          emit(DashboardInitializing(endpoint: event.endpoint));
        }
        await Future.delayed(const Duration(seconds: 1, milliseconds: 100)); // TODO do not wait
        final config = await stationRepository.loadSettings(event.endpoint);
        final weather = await stationRepository.loadWeather(event.endpoint);
        final images = await stationRepository.loadImages(event.endpoint);
        emit(DashboardData(loading: false, endpoint: event.endpoint, config: config, images: images, weather: weather));
      } catch (e) {
        emit(DashboardDataError(endpoint: event.endpoint, error: e.toString()));
      }
    });

    on<EmitEndpointRequired>((event, emit) async {
      emit(EndpointRequired());
    });
  }

  bool _isFirstRequestForEndpoint(LoadDashboardData event) {
    return state.runtimeType == DashboardScreenInitial || (state.runtimeType == DashboardData && (state as DashboardData).endpoint != event.endpoint);
  }
}
