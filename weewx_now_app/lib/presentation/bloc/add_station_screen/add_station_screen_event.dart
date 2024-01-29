part of 'add_station_screen_bloc.dart';

@immutable
sealed class AddStationScreenEvent {}

class InitAddStationScreenData extends AddStationScreenEvent {}

class UserInputUrl extends AddStationScreenEvent {
  final String input;
  UserInputUrl({
    required this.input,
  });
}

class RunEndpointCheck extends AddStationScreenEvent {}

class AddStation extends AddStationScreenEvent {}

class ClearStation extends AddStationScreenEvent {}
