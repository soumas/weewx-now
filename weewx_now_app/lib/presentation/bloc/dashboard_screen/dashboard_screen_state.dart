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
  final NowStationSettingsModel settings;
  final ImagesSet images;
  final RecordsSet weatherRecords;
  final Aggregations weatherAgg;
  final AggregationPeriod selectedTimePeriod;
  DashboardData({
    required this.loading,
    required this.endpoint,
    required this.settings,
    required this.images,
    required this.weatherRecords,
    required this.weatherAgg,
    required this.selectedTimePeriod,
  });

  DashboardData copyWith({
    bool? loading,
    Endpoint? endpoint,
    NowStationSettingsModel? settings,
    ImagesSet? images,
    RecordsSet? weatherRecords,
    Aggregations? weatherAgg,
    AggregationPeriod? selectedTimePeriod,
  }) {
    return DashboardData(
      loading: loading ?? this.loading,
      endpoint: endpoint ?? this.endpoint,
      settings: settings ?? this.settings,
      images: images ?? this.images,
      weatherRecords: weatherRecords ?? this.weatherRecords,
      weatherAgg: weatherAgg ?? this.weatherAgg,
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
