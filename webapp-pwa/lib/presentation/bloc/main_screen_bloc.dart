import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weewx_pwa/domain/entities/main_screen_data_entity.dart';

import 'package:weewx_pwa/domain/usecases/update_main_screen_data_usecase.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final UpdateMainScreenDataUsecase updateWeatherDataUsecase;

  MainScreenBloc({required this.updateWeatherDataUsecase})
      : super(MainScreenInitial()) {
    on<LoadMainScreenData>((event, emit) async {
      emit(MainScreenLoading());
      final data = await updateWeatherDataUsecase.execute(event.endpoint);
      emit(MainScreenData(data: data));
    });
  }
}
