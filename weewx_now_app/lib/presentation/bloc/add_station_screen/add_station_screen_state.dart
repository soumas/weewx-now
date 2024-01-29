part of 'add_station_screen_bloc.dart';

@immutable
sealed class AddStationScreenState {}

final class AddStationScreenInitial extends AddStationScreenState {}

class AddStationScreenData extends AddStationScreenState {
  final String userInputUrl;
  final bool endpointCheckRunning;
  final String? endpointCheckError;
  final WeeWxConfig? weeWxConfig;

  AddStationScreenData({
    this.userInputUrl = '',
    this.endpointCheckRunning = false,
    this.endpointCheckError,
    this.weeWxConfig,
  });

  AddStationScreenData copyWith({
    String? userInputUrl,
    bool? endpointCheckRunning,
    String? endpointCheckError,
    WeeWxConfig? weeWxConfig,
  }) {
    return AddStationScreenData(
      userInputUrl: userInputUrl ?? this.userInputUrl,
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
