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

final class InitialEndpointLoaded extends MainScreenState {
  final WeewxEndpointEntity endpoint;
  const InitialEndpointLoaded({
    required this.endpoint,
  });
}

final class NoEndpointAvailable extends MainScreenState {}
