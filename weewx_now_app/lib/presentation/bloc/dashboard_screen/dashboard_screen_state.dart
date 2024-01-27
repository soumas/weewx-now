part of 'dashboard_screen_bloc.dart';

@immutable
sealed class DashboardScreenState {}

final class DashboardScreenInitial extends DashboardScreenState {}

final class EndpointRequired extends DashboardScreenState {}

final class EverChangingDataLoading extends DashboardScreenState {
  final WeewxEndpoint endpoint;
  EverChangingDataLoading({
    required this.endpoint,
  });
}

final class EverChangingLoaded extends DashboardScreenState {
  final WeewxEndpoint endpoint;
  final ImageBundle images;
  final WeatherData weather;
  EverChangingLoaded({
    required this.endpoint,
    required this.images,
    required this.weather,
  });

  EverChangingLoaded copyWith({
    WeewxEndpoint? endpoint,
    ImageBundle? images,
    WeatherData? weather,
  }) {
    return EverChangingLoaded(
      endpoint: endpoint ?? this.endpoint,
      images: images ?? this.images,
      weather: weather ?? this.weather,
    );
  }
}

final class EverChangingDataError extends DashboardScreenState {
  final WeewxEndpoint endpoint;
  final String error;
  EverChangingDataError({
    required this.endpoint,
    required this.error,
  });
}
