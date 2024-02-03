part of 'add_station_screen_bloc.dart';

@immutable
sealed class AddStationPrecheckScreenState {}

final class AddStationPrecheckScreenInitial extends AddStationPrecheckScreenState {}

final class AddStationPrecheckRunning extends AddStationPrecheckScreenState {
  final String url;
  AddStationPrecheckRunning({
    required this.url,
  });
}

final class AddStationPrecheckSuccess extends AddStationPrecheckScreenState {
  final WeeWxConfig weeWxConfig;
  AddStationPrecheckSuccess({
    required this.weeWxConfig,
  });
}

final class AddStationPrecheckFailed extends AddStationPrecheckScreenState {
  final String error;
  final String lastCheckedUrl;
  AddStationPrecheckFailed({
    required this.error,
    required this.lastCheckedUrl,
  });
}

/*final class AddStationPrecheckScreenData extends AddStationPrecheckScreenState {
  final String lastCheckeEndpoint;
  final bool endpointCheckRunning;
  final String? endpointCheckError;
  final WeeWxConfig? weeWxConfig;

  AddStationPrecheckScreenData({
    this.lastCheckeEndpoint = '',
    this.endpointCheckRunning = false,
    this.endpointCheckError,
    this.weeWxConfig,
  });

  AddStationPrecheckScreenData copyWith({
    String? lastCheckeEndpoint,
    bool? endpointCheckRunning,
    String? endpointCheckError,
    WeeWxConfig? weeWxConfig,
  }) {
    return AddStationPrecheckScreenData(
      lastCheckeEndpoint: lastCheckeEndpoint ?? this.lastCheckeEndpoint,
      endpointCheckRunning: endpointCheckRunning ?? this.endpointCheckRunning,
      endpointCheckError: endpointCheckError ?? this.endpointCheckError,
      weeWxConfig: weeWxConfig ?? this.weeWxConfig,
    );
  }
}
final class AddStationCompleted extends AddStationPrecheckScreenState {
  final WeewxEndpoint endpoint;
  AddStationCompleted({
    required this.endpoint,
  });
}

*/