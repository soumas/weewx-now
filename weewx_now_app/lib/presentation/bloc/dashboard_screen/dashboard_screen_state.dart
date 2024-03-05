part of 'dashboard_screen_bloc.dart';

@immutable
sealed class DashboardScreenState {}

final class DashboardScreenInitial extends DashboardScreenState {}

final class EndpointRequired extends DashboardScreenState {}

final class DashboardInitializing extends DashboardScreenState {
  final Endpoint endpoint;
  DashboardInitializing({
    required this.endpoint,
  });
}

final class DashboardData extends DashboardScreenState {
  final bool loading;
  final Endpoint endpoint;
  final StationSettings settings;
  final ImageBundle images;
  final WeatherAggBundle weather;
  final TimePeriod selectedTimePeriod;
  DashboardData({
    required this.loading,
    required this.endpoint,
    required this.settings,
    required this.images,
    required this.weather,
    required this.selectedTimePeriod,
  });

  DashboardData copyWith({
    bool? loading,
    Endpoint? endpoint,
    StationSettings? settings,
    ImageBundle? images,
    WeatherAggBundle? weather,
    TimePeriod? selectedTimePeriod,
  }) {
    return DashboardData(
      loading: loading ?? this.loading,
      endpoint: endpoint ?? this.endpoint,
      settings: settings ?? this.settings,
      images: images ?? this.images,
      weather: weather ?? this.weather,
      selectedTimePeriod: selectedTimePeriod ?? this.selectedTimePeriod,
    );
  }
}

final class DashboardDataError extends DashboardScreenState {
  final Endpoint endpoint;
  final String error;
  DashboardDataError({
    required this.endpoint,
    required this.error,
  });
}
