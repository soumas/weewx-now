part of 'main_screen_bloc.dart';

@immutable
sealed class MainScreenState {
  final bool busy;
  const MainScreenState({
    this.busy = false,
  });
}

final class MainScreenInitial extends MainScreenState {}

final class NewInitialEndpoint extends MainScreenState {
  final WeewxEndpoint endpoint;
  const NewInitialEndpoint({
    required this.endpoint,
  });
}

final class EndpointChanged extends MainScreenState {
  final WeewxEndpoint endpoint;
  const EndpointChanged({
    required this.endpoint,
  });
}

final class NoEndpointAvailable extends MainScreenState {}

final class LoadingMainScreenData extends MainScreenState {}

final class MainScreenData extends MainScreenState {
  final WeewxEndpoint endpoint;
  final List<WeewxEndpoint> endpointOptions;
  final WeatherData weather;
  final WeeWxConfig settings;
  const MainScreenData({
    super.busy,
    required this.endpoint,
    required this.endpointOptions,
    required this.weather,
    required this.settings,
  });

  MainScreenData copyWith({
    bool? busy,
    WeewxEndpoint? endpoint,
    List<WeewxEndpoint>? endpointOptions,
    WeatherData? weather,
    ImageBundle? images,
    WeeWxConfig? settings,
  }) {
    return MainScreenData(
      busy: busy ?? this.busy,
      endpoint: endpoint ?? this.endpoint,
      endpointOptions: endpointOptions ?? this.endpointOptions,
      weather: weather ?? this.weather,
      settings: settings ?? this.settings,
    );
  }
}
