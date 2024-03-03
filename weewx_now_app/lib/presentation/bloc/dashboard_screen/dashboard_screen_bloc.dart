import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now/domain/entities/image/image_bundle.dart';
import 'package:weewx_now/domain/entities/weather_agg/time_period.dart';
import 'package:weewx_now/domain/entities/weather_agg/weather_agg_bundle.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/wee_wx_config.dart';
import 'package:weewx_now/domain/repositories/weewx_station_repository.dart';

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
        final config = await stationRepository.loadSettings(event.endpoint);
        final weather = await stationRepository.loadWeatherAgg(event.endpoint);
        final images = await stationRepository.loadImages(event.endpoint);
        emit(DashboardData(loading: false, endpoint: event.endpoint, config: config, images: images, weather: weather, selectedTimePeriod: TimePeriod.day));
      } catch (e) {
        emit(DashboardDataError(endpoint: event.endpoint, error: e.toString()));
      }
    });

    on<EmitEndpointRequired>((event, emit) async {
      emit(EndpointRequired());
    });

    on<SelectTimePeriod>((event, emit) async {
      if (state is DashboardData) {
        emit((state as DashboardData).copyWith(selectedTimePeriod: event.timePeriod));
      }
    });
  }

  bool _isFirstRequestForEndpoint(LoadDashboardData event) {
    return state.runtimeType == DashboardScreenInitial || (state.runtimeType == DashboardData && (state as DashboardData).endpoint != event.endpoint);
  }
}
