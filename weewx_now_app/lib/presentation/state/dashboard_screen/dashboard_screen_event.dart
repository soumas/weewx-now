part of 'dashboard_screen_bloc.dart';

@immutable
sealed class DashboardScreenEvent {}

final class LoadEverChangingData extends DashboardScreenEvent {
  final WeewxEndpoint endpoint;

  LoadEverChangingData({
    required this.endpoint,
  });
}

final class EmitEndpointRequired extends DashboardScreenEvent {}
