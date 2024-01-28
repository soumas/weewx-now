import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:weewx_now_app/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now_app/domain/repositories/weewx_endpoint_repository.dart';

part 'weewx_endpoint_state.dart';

class CurrentEndpointCubit extends Cubit<WeewxEndpointState> {
  CurrentEndpointCubit({
    required this.weewxEndpointRepository,
  }) : super(WeewxEndpointInitial());

  WeewxEndpoint? selectedEndpoint;
  final WeewxEndpointRepository weewxEndpointRepository;

  Future init() async {
    final lastSelected = await weewxEndpointRepository.loadLastSelectedEndpoint();
    if (lastSelected != null) {
      selectEndpoint(lastSelected);
    } else {
      emit(NoSelectableEndpointFound());
    }
  }

  void selectEndpoint(WeewxEndpoint endpoint) async {
    await weewxEndpointRepository.saveLastSelectedEndpoint(endpoint);
    selectedEndpoint = endpoint;
    emit(WeewxEndpointSelected());
  }
}
