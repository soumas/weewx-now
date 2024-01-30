part of 'add_station_screen_bloc.dart';

@immutable
sealed class AddStationScreenState {}

final class AddStationScreenInitial extends AddStationScreenState {}

final class AddStationScreenData extends AddStationScreenState {
  final String lastCheckeEndpoint;
  final bool endpointCheckRunning;
  final String? endpointCheckError;
  final WeeWxConfig? weeWxConfig;

  AddStationScreenData({
    this.lastCheckeEndpoint = '',
    this.endpointCheckRunning = false,
    this.endpointCheckError,
    this.weeWxConfig,
  });

  AddStationScreenData copyWith({
    String? lastCheckeEndpoint,
    bool? endpointCheckRunning,
    String? endpointCheckError,
    WeeWxConfig? weeWxConfig,
  }) {
    return AddStationScreenData(
      lastCheckeEndpoint: lastCheckeEndpoint ?? this.lastCheckeEndpoint,
      endpointCheckRunning: endpointCheckRunning ?? this.endpointCheckRunning,
      endpointCheckError: endpointCheckError ?? this.endpointCheckError,
      weeWxConfig: weeWxConfig ?? this.weeWxConfig,
    );
  }
}

final class AddStationCompleted extends AddStationScreenState {
  final WeewxEndpoint endpoint;
  AddStationCompleted({
    required this.endpoint,
  });
}
