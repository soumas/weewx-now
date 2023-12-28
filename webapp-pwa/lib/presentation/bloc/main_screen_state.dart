part of 'main_screen_bloc.dart';

@immutable
sealed class MainScreenState {}

final class MainScreenInitial extends MainScreenState {}

final class MainScreenLoading extends MainScreenState {}

final class MainScreenData extends MainScreenState {
  final MainScreenDataEntity data;
  MainScreenData({
    required this.data,
  });
}
