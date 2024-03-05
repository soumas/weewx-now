import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:weewx_now/domain/entities/endpoint/endpoint.dart';
import 'package:weewx_now/domain/repositories/endpoint_repository.dart';

part 'endpoint_state.dart';

class CurrentEndpointCubit extends Cubit<EndpointState> {
  CurrentEndpointCubit({
    required this.weewxEndpointRepository,
  }) : super(EndpointInitial());

  Endpoint? selectedEndpoint;
  final EndpointRepository weewxEndpointRepository;

  Future init() async {
    final lastSelected = await weewxEndpointRepository.loadLastSelectedEndpoint();
    if (lastSelected != null) {
      selectEndpoint(lastSelected);
    } else {
      final savedEndpointLst = await weewxEndpointRepository.loadEndpoints();
      if (savedEndpointLst.isNotEmpty) {
        selectEndpoint(savedEndpointLst.first);
      } else {
        emit(NoSelectableEndpointFound());
      }
    }
  }

  void selectEndpoint(Endpoint endpoint) async {
    await weewxEndpointRepository.saveLastSelectedEndpoint(endpoint);
    selectedEndpoint = endpoint;
    emit(EndpointSelected());
  }
}
