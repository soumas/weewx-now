import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weewx_now/data/models/now_station_settings_model.dart';
import 'package:weewx_now/domain/entities/endpoint/endpoint.dart';
import 'package:weewx_now/domain/entities/weather_data/aggregations/aggregation_period.dart';
import 'package:weewx_now/domain/entities/weather_data/aggregations/aggregations.dart';
import 'package:weewx_now/domain/entities/weather_data/images/images_set.dart';
import 'package:weewx_now/domain/entities/weather_data/records/records_set.dart';
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
        final settings = await stationRepository.loadSettings(event.endpoint);
        final weather = await stationRepository.loadWeatherData(event.endpoint);
        emit(DashboardData(
          loading: false,
          endpoint: event.endpoint,
          settings: settings,
          images: weather.images,
          weatherAgg: weather.aggregations,
          weatherRecords: weather.records,
          selectedTimePeriod: AggregationPeriod.day,
        ));
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
