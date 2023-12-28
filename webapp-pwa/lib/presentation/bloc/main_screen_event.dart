part of 'main_screen_bloc.dart';

@immutable
sealed class MainScreenEvent {}

final class LoadMainScreenData extends MainScreenEvent {
  final String endpoint;
  LoadMainScreenData({
    required this.endpoint,
  });
}
