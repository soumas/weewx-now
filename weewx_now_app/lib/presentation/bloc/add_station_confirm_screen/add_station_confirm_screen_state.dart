part of 'add_station_confirm_screen_bloc.dart';

@immutable
sealed class AddStationConfirmScreenState {}

final class AddStationConfirmScreenInitial extends AddStationConfirmScreenState {}

final class AddStationConfirmed extends AddStationConfirmScreenState {
  final Endpoint endpoint;
  AddStationConfirmed({
    required this.endpoint,
  });
}
