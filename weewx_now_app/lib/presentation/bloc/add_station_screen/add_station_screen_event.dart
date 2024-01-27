part of 'add_station_screen_bloc.dart';

@immutable
sealed class AddStationScreenEvent {}

class CheckEndpoint extends AddStationScreenEvent {
  final String endpointUrl;
  CheckEndpoint({
    required this.endpointUrl,
  });
}

class AddStation extends AddStationScreenEvent {
  final String name;
  final String url;
  AddStation({
    required this.name,
    required this.url,
  });
}
