import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:weewx_now/domain/entities/endpoint/endpoint.dart';
import 'package:weewx_now/domain/repositories/endpoint_repository.dart';

part 'my_stations_screen_event.dart';
part 'my_stations_screen_state.dart';

class MyStationsScreenBloc extends Bloc<MyStationsScreenEvent, MyStationsScreenState> {
  final EndpointRepository endpointRepository;

  MyStationsScreenBloc({
    required this.endpointRepository,
  }) : super(MyStationsScreenInitial()) {
    on<LoadMyStations>((event, emit) async {
      emit(MyStationsScreenLoading());
      var stationsLst = await endpointRepository.loadEndpoints();
      emit(MyStationsScreenLoaded(endpoints: stationsLst));
    });
    on<DeleteStation>((event, emit) async {
      emit(MyStationsScreenLoading());
      await endpointRepository.deleteEndpoint(event.endpoint.url);
      if (event.isSelected) {
        await endpointRepository.resetLastSelectedEndpoint();
      }
      emit(StationDeleted());
      add(LoadMyStations());
    });
  }
}
