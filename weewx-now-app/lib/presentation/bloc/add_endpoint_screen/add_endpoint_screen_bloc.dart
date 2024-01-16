import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint_entity.dart';
import 'package:weewx_now/domain/entities/settings/settings_entity.dart';
import 'package:weewx_now/domain/repositories/weewx_endpoint_repository.dart';
import 'package:weewx_now/domain/repositories/weewx_station_repository.dart';

part 'add_endpoint_screen_event.dart';
part 'add_endpoint_screen_state.dart';

class AddEndpointScreenBloc
    extends Bloc<AddEndpointScreenEvent, AddEndpointScreenState> {
  final WeewxStationRepository stationRepository;
  final WeewxEndpointRepository endpointRepository;

  AddEndpointScreenBloc({
    required this.stationRepository,
    required this.endpointRepository,
  }) : super(AddEndpointScreenInitial()) {
    on<CheckEndpoint>((event, emit) async {
      emit(CheckingEndpoint());
      try {
        SettingsEntity settings = await stationRepository.loadSettings(
          WeewxEndpointEntity(name: '_', url: event.endpointUrl),
        );
        emit(EndpointCheckSuccess(
            endpointUrl: event.endpointUrl, settings: settings));
      } catch (e) {
        emit(EndpointCheckFailed(
            message: e.toString(), endpointUrl: event.endpointUrl));
      }
    });

    on<AddEndpoint>((event, emit) async {
      final ep = WeewxEndpointEntity(name: event.name, url: event.url);
      await endpointRepository.addOrUpdateEndpoint(ep);
      emit(EndpointAdded(endpoint: ep));
    });
  }
}
