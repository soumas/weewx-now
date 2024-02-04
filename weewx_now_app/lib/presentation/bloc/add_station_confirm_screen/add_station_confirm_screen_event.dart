part of 'add_station_confirm_screen_bloc.dart';

@immutable
sealed class AddStationConfirmScreenEvent {}

final class ConfirmAddStation extends AddStationConfirmScreenEvent {
  final String url;
  final String name;
  ConfirmAddStation({
    required this.url,
    required this.name,
  });
}
