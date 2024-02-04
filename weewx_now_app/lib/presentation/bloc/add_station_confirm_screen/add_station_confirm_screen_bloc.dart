import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint.dart';

part 'add_station_confirm_screen_event.dart';
part 'add_station_confirm_screen_state.dart';

class AddStationConfirmScreenBloc extends Bloc<AddStationConfirmScreenEvent, AddStationConfirmScreenState> {
  AddStationConfirmScreenBloc() : super(AddStationConfirmScreenInitial()) {
    on<ConfirmAddStation>((event, emit) {
      // TODO: save usw.
      emit(AddStationConfirmed(endpoint: WeewxEndpoint(name: event.name, url: event.url)));
    });
  }
}
