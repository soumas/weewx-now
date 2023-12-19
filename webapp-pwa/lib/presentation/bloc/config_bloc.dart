import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:weewx_pwa/domain/entities/config/config_entity.dart';
import 'package:weewx_pwa/domain/usecases/load_config_usecase.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  final LoadConfigUsecase loadConfigUsecase;

  ConfigBloc({required this.loadConfigUsecase}) : super(ConfigInitial()) {
    on<LoadConfigEvent>((event, emit) async {
      emit(ConfigLoading());
      final cfg = await loadConfigUsecase.execute(event.endpoint);
      emit(ConfigLoaded(config: cfg));
    });
  }
}
