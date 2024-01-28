import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weewx_now_app/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now_app/domain/entities/image/image_bundle.dart';
import 'package:weewx_now_app/domain/entities/weather/weather_data.dart';
import 'package:weewx_now_app/domain/repositories/weewx_station_repository.dart';

part 'dashboard_screen_event.dart';
part 'dashboard_screen_state.dart';

class DashboardScreenBloc extends Bloc<DashboardScreenEvent, DashboardScreenState> {
  final WeewxStationRepository stationRepository;

  DashboardScreenBloc({
    required this.stationRepository,
  }) : super(DashboardScreenInitial()) {
    on<LoadEverChangingData>((event, emit) async {
      try {
        emit(EverChangingDataLoading(endpoint: event.endpoint));
        final weather = await stationRepository.loadWeather(event.endpoint);
        final images = await stationRepository.loadImages(event.endpoint);
        await Future.delayed(const Duration(seconds: 2)); // TODO do not wait
        emit(EverChangingLoaded(endpoint: event.endpoint, images: images, weather: weather));
      } catch (e) {
        emit(EverChangingDataError(endpoint: event.endpoint, error: e.toString()));
      }
    });

    on<EmitEndpointRequired>((event, emit) async {
      emit(EndpointRequired());
    });
  }
}
