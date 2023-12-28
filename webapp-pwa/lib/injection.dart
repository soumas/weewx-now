import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weewx_pwa/data/datasources/weewx_station_data_source.dart';
import 'package:weewx_pwa/data/repositories/weewx_station_repository_impl.dart';
import 'package:weewx_pwa/domain/repositories/weewx_station_repository.dart';
import 'package:weewx_pwa/domain/usecases/change_station_usecase.dart';
import 'package:weewx_pwa/domain/usecases/update_main_screen_data_usecase.dart';
import 'package:weewx_pwa/presentation/bloc/main_screen_bloc.dart';

final sl = GetIt.instance;

class Injection {
  Injection._();

  static Future<void> init() async {
    // DataSources
    sl.registerLazySingleton<WeewxStationDataSource>(
      () => WeewxStationDataSourceImpl(http: sl()),
    );

    // Repositories
    sl.registerLazySingleton<WeewxStationRepository>(
      () => WeewxStationRepositoryImpl(dataSource: sl()),
    );

    // Usecases
    sl.registerLazySingleton(() => ChangeStationUsecase(repository: sl()));
    sl.registerLazySingleton(
        () => UpdateMainScreenDataUsecase(repository: sl()));

    // Blocs
    sl.registerFactory<MainScreenBloc>(
      () => MainScreenBloc(
        changeStationUsecase: sl(),
        updateWeatherDataUsecase: sl(),
      ),
    );

    // Misc
    sl.registerLazySingleton(() => Dio());
  }
}
