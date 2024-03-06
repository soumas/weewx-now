part of 'dashboard_screen_bloc.dart';

@immutable
sealed class DashboardScreenEvent {}

final class LoadDashboardData extends DashboardScreenEvent {
  final Endpoint endpoint;

  LoadDashboardData({
    required this.endpoint,
  });
}

final class EmitEndpointRequired extends DashboardScreenEvent {}

class SelectTimePeriod extends DashboardScreenEvent {
  final AggregationPeriod timePeriod;
  SelectTimePeriod({
    required this.timePeriod,
  });
}
