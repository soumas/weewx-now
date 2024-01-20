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
  final WeewxEndpointEntity endpoint;
  const NewInitialEndpoint({
    required this.endpoint,
  });
}

final class EndpointChanged extends MainScreenState {
  final WeewxEndpointEntity endpoint;
  const EndpointChanged({
    required this.endpoint,
  });
}

final class NoEndpointAvailable extends MainScreenState {}

final class LoadingMainScreenData extends MainScreenState {}

final class MainScreenData extends MainScreenState {
  final WeewxEndpointEntity endpoint;
  final List<WeewxEndpointEntity> endpointOptions;
  final WeatherDataEntity weather;
  final ImagesEntity images;
  const MainScreenData({
    super.busy,
    required this.endpoint,
    required this.endpointOptions,
    required this.weather,
    required this.images,
  });

  MainScreenData copyWith({
    bool? busy,
    WeewxEndpointEntity? endpoint,
    List<WeewxEndpointEntity>? endpointOptions,
    WeatherDataEntity? weather,
    ImagesEntity? images,
  }) {
    return MainScreenData(
      busy: busy ?? super.busy,
      endpoint: endpoint ?? this.endpoint,
      endpointOptions: endpointOptions ?? this.endpointOptions,
      weather: weather ?? this.weather,
      images: images ?? this.images,
    );
  }
}
