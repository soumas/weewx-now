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
    on<CheckEndpoint>((event, emit) async {
      emit(EndpointCheckLoading());
      try {
        WeeWxConfig settings = await stationRepository.loadSettings(
          WeewxEndpoint(name: '_', url: event.endpointUrl),
        );
        emit(EndpointCheckSuccess(endpointUrl: event.endpointUrl, settings: settings));
      } catch (e) {
        emit(EndpointCheckError(message: e.toString(), endpointUrl: event.endpointUrl));
      }
    });

    on<AddStation>((event, emit) async {
      final ep = WeewxEndpoint(name: event.name, url: event.url);
      await endpointRepository.addOrUpdateEndpoint(ep);
      emit(StationAdded(endpoint: ep));
    });
  }
}
