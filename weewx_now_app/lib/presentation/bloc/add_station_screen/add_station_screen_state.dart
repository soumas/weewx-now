part of 'add_station_screen_bloc.dart';

@immutable
sealed class AddStationScreenState {}

final class AddStationScreenInitial extends AddStationScreenState {}

final class EndpointCheckLoading extends AddStationScreenState {}

final class EndpointCheckSuccess extends AddStationScreenState {
  final String endpointUrl;
  final WeeWxConfig settings;
  EndpointCheckSuccess({
    required this.endpointUrl,
    required this.settings,
  });
}

final class EndpointCheckError extends AddStationScreenState {
  final String endpointUrl;
  final String message;
  EndpointCheckError({
    required this.endpointUrl,
    required this.message,
  });
}

final class StationAdded extends AddStationScreenState {
  final WeewxEndpoint endpoint;
  StationAdded({
    required this.endpoint,
  });
}
