import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weewx_pwa/data/datasources/weewx_station_data_source.dart';
import 'package:weewx_pwa/data/repositories/weewx_station_repository_impl.dart';
import 'package:weewx_pwa/domain/repositories/weewx_station_repository.dart';
import 'package:weewx_pwa/presentation/cubit/theme/theme_cubit.dart';
import 'package:weewx_pwa/presentation/cubit/weewx_endpoint/weewx_endpoint_cubit.dart';

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
    //sl.registerLazySingleton(() => ChangeStationUsecase(repository: sl()));
    //sl.registerLazySingleton(
    //    () => UpdateMainScreenDataUsecase(repository: sl()));

    // Blocs
    sl.registerFactory<ThemeCubit>(
      () => ThemeCubit(),
    );
    sl.registerFactory<WeewxEndpointCubit>(
      () => WeewxEndpointCubit(),
    );

    // Misc
    sl.registerLazySingleton(() {
      final ret = Dio();
      ret.options = BaseOptions();
      return ret;
    });
  }
}
