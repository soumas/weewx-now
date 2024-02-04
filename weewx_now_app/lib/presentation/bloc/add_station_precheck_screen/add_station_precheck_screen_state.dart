part of 'add_station_precheck_screen_bloc.dart';

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
  final Object error;
  final String lastCheckedUrl;
  AddStationPrecheckFailed({
    required this.error,
    required this.lastCheckedUrl,
  });
}
