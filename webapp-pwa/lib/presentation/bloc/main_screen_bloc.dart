import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:collection/collection.dart';
import 'package:weewx_pwa/domain/entities/endpoint/weewx_endpoint_entity.dart';

import 'package:weewx_pwa/domain/repositories/weewx_endpoint_repository.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final WeewxEndpointRepository endpointRepository;

  MainScreenBloc({
    required this.endpointRepository,
  }) : super(MainScreenInitial()) {
    on<InitMainScreen>((event, emit) async {
      // load existing endpoints
      List<WeewxEndpointEntity> endpoints =
          await endpointRepository.loadEndpoints();

      if (event.initialEndpoint != null) {
        WeewxEndpointEntity? ep = endpoints.firstWhereOrNull(
            (element) => element.url == event.initialEndpoint);
        if (ep == null) {
          // the initial endpoint is new
          emit(NewInitialEndpoint(
              endpoint:
                  WeewxEndpointEntity(name: '', url: event.initialEndpoint!)));
        } else {
          // the initial endpoint is known
          emit(InitialEndpointLoaded(endpoint: ep));
        }
      } else {
        WeewxEndpointEntity? lastSelectedEndpoint =
            await endpointRepository.loadLastSelectedEndpoint();
        if (lastSelectedEndpoint != null) {
          emit(InitialEndpointLoaded(endpoint: lastSelectedEndpoint));
        } else {
          emit(NoEndpointAvailable());
        }
      }
    });
  }
}
