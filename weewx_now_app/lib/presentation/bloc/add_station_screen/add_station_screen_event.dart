part of 'add_station_screen_bloc.dart';

@immutable
sealed class AddStationScreenEvent {}

class InitAddStationScreenData extends AddStationScreenEvent {}

class RunEndpointCheck extends AddStationScreenEvent {
  final String url;
  RunEndpointCheck({
    required this.url,
  });
}

class AddStation extends AddStationScreenEvent {}

class ClearStation extends AddStationScreenEvent {}
