part of 'dashboard_screen_bloc.dart';

@immutable
sealed class DashboardScreenState {}

final class DashboardScreenInitial extends DashboardScreenState {}

final class EndpointRequired extends DashboardScreenState {}

final class DashboardInitializing extends DashboardScreenState {
  final WeewxEndpoint endpoint;
  DashboardInitializing({
    required this.endpoint,
  });
}

final class DashboardData extends DashboardScreenState {
  final bool loading;
  final WeewxEndpoint endpoint;
  final WeeWxConfig config;
  final ImageBundle images;
  final WeatherData weather;
  final TimePeriod selectedTimePeriod;
  DashboardData({
    required this.loading,
    required this.endpoint,
    required this.config,
    required this.images,
    required this.weather,
    required this.selectedTimePeriod,
  });

  DashboardData copyWith({
    bool? loading,
    WeewxEndpoint? endpoint,
    WeeWxConfig? config,
    ImageBundle? images,
    WeatherData? weather,
    TimePeriod? selectedTimePeriod,
  }) {
    return DashboardData(
      loading: loading ?? this.loading,
      endpoint: endpoint ?? this.endpoint,
      config: config ?? this.config,
      images: images ?? this.images,
      weather: weather ?? this.weather,
      selectedTimePeriod: selectedTimePeriod ?? this.selectedTimePeriod,
    );
  }
}

final class DashboardDataError extends DashboardScreenState {
  final WeewxEndpoint endpoint;
  final String error;
  DashboardDataError({
    required this.endpoint,
    required this.error,
  });
}
