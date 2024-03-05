import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:weewx_now/domain/entities/endpoint/endpoint.dart';
import 'package:weewx_now/domain/repositories/endpoint_repository.dart';

part 'add_station_confirm_screen_event.dart';
part 'add_station_confirm_screen_state.dart';

class AddStationConfirmScreenBloc extends Bloc<AddStationConfirmScreenEvent, AddStationConfirmScreenState> {
  final EndpointRepository endpointRepository;

  AddStationConfirmScreenBloc({
    required this.endpointRepository,
  }) : super(AddStationConfirmScreenInitial()) {
    on<ConfirmAddStation>((event, emit) async {
      final ep = Endpoint(name: event.name, url: event.url);
      await endpointRepository.addOrUpdateEndpoint(ep);
      emit(AddStationConfirmed(endpoint: ep));
    });
  }
}
