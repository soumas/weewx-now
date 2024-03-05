part of 'my_stations_screen_bloc.dart';

@immutable
sealed class MyStationsScreenState {}

final class MyStationsScreenInitial extends MyStationsScreenState {}

final class MyStationsScreenLoading extends MyStationsScreenState {}

final class MyStationsScreenLoaded extends MyStationsScreenState {
  final List<Endpoint> endpoints;
  MyStationsScreenLoaded({
    required this.endpoints,
  });

  MyStationsScreenLoaded copyWith({
    List<Endpoint>? endpoints,
  }) {
    return MyStationsScreenLoaded(
      endpoints: endpoints ?? this.endpoints,
    );
  }
}

final class StationDeleted extends MyStationsScreenState {}
