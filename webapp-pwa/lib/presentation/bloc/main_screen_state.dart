part of 'main_screen_bloc.dart';

@immutable
sealed class MainScreenState {}

final class MainScreenInitial extends MainScreenState {}

final class ChangingStation extends MainScreenState {
  final String endpoint;
  ChangingStation({
    required this.endpoint,
  });
}

final class MainScreenData extends MainScreenState {
  final bool isUpdating;
  final ImageCategoryEntity selectedImageCategory;
  final TimePeriod selectedTimePeriod;

  MainScreenData({
    required this.isUpdating,
    required this.selectedImageCategory,
    required this.selectedTimePeriod,
  });

  MainScreenData copyWith({
    bool? isUpdating,
    ImageCategoryEntity? selectedImageCategory,
    TimePeriod? selectedTimePeriod,
  }) {
    return MainScreenData(
      isUpdating: isUpdating ?? this.isUpdating,
      selectedImageCategory:
          selectedImageCategory ?? this.selectedImageCategory,
      selectedTimePeriod: selectedTimePeriod ?? this.selectedTimePeriod,
    );
  }
}
