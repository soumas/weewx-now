part of 'my_stations_screen_bloc.dart';

@immutable
sealed class MyStationsScreenEvent {}

final class LoadMyStations extends MyStationsScreenEvent {}

final class DeleteStation extends MyStationsScreenEvent {
  final Endpoint endpoint;
  final bool isSelected;
  DeleteStation({
    required this.endpoint,
    required this.isSelected,
  });
}
