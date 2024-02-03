part of 'add_station_screen_bloc.dart';

@immutable
sealed class AddStationPrecheckScreenEvent {}

class RunCheck extends AddStationPrecheckScreenEvent {
  final String url;
  RunCheck({
    required this.url,
  });
}
