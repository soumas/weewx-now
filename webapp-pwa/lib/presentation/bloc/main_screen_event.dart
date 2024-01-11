part of 'main_screen_bloc.dart';

@immutable
sealed class MainScreenEvent {}

final class InitMainScreen extends MainScreenEvent {
  final String? initialEndpoint;
  InitMainScreen({
    this.initialEndpoint,
  });
}
