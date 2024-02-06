import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now/domain/repositories/weewx_endpoint_repository.dart';

part 'add_station_confirm_screen_event.dart';
part 'add_station_confirm_screen_state.dart';

class AddStationConfirmScreenBloc extends Bloc<AddStationConfirmScreenEvent, AddStationConfirmScreenState> {
  final WeewxEndpointRepository endpointRepository;

  AddStationConfirmScreenBloc({
    required this.endpointRepository,
  }) : super(AddStationConfirmScreenInitial()) {
    on<ConfirmAddStation>((event, emit) async {
      final ep = WeewxEndpoint(name: event.name, url: event.url);
      await endpointRepository.addOrUpdateEndpoint(ep);
      emit(AddStationConfirmed(endpoint: ep));
    });
  }
}
