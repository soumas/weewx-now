part of 'main_screen_bloc.dart';

@immutable
sealed class MainScreenEvent {}

final class ChangeStation extends MainScreenEvent {
  final String endpoint;
  ChangeStation({
    required this.endpoint,
  });
}

final class UpdateMainScreenData extends MainScreenEvent {}
