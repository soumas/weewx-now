part of 'dashboard_screen_bloc.dart';

@immutable
sealed class DashboardScreenEvent {}

final class LoadDashboardData extends DashboardScreenEvent {
  final WeewxEndpoint endpoint;

  LoadDashboardData({
    required this.endpoint,
  });
}

final class EmitEndpointRequired extends DashboardScreenEvent {}
