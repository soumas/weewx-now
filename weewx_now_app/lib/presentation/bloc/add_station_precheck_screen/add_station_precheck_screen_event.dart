part of 'add_station_precheck_screen_bloc.dart';

@immutable
sealed class AddStationPrecheckScreenEvent {}

class RunCheck extends AddStationPrecheckScreenEvent {
  final String url;
  RunCheck({
    required this.url,
  });
}
