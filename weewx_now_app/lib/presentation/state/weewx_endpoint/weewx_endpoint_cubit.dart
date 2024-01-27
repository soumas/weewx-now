import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:weewx_now_app/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now_app/domain/repositories/weewx_endpoint_repository.dart';

part 'weewx_endpoint_state.dart';

class WeewxEndpointCubit extends Cubit<WeewxEndpointState> {
  WeewxEndpointCubit({
    required this.weewxEndpointRepository,
  }) : super(WeewxEndpointInitial());

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
    emit(WeewxEndpointSelection(endpoint: endpoint));
  }
}
