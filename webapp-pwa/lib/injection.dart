import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weewx_pwa/data/datasources/theme_data_source.dart';
import 'package:weewx_pwa/data/datasources/weewx_endpoint_data_source.dart';
import 'package:weewx_pwa/data/datasources/weewx_station_data_source.dart';
import 'package:weewx_pwa/data/repositories/theme_repository_impl.dart';
import 'package:weewx_pwa/data/repositories/weewx_endpoint_repository_impl.dart';
import 'package:weewx_pwa/data/repositories/weewx_station_repository_impl.dart';
import 'package:weewx_pwa/domain/repositories/theme_repository.dart';
import 'package:weewx_pwa/domain/repositories/weewx_endpoint_repository.dart';
import 'package:weewx_pwa/domain/repositories/weewx_station_repository.dart';
import 'package:weewx_pwa/presentation/bloc/add_endpoint_screen/add_endpoint_screen_bloc.dart';
import 'package:weewx_pwa/presentation/bloc/main_screen/main_screen_bloc.dart';
import 'package:weewx_pwa/presentation/cubit/theme/theme_cubit.dart';
import 'package:weewx_pwa/presentation/cubit/weewx_endpoint/weewx_endpoint_cubit.dart';

final sl = GetIt.instance;

class Injection {
  Injection._();

  static Future<void> init() async {
    // DataSources
    sl.registerLazySingleton<ThemeDataSource>(
      () => ThemeDataSourceImpl(),
    );
    sl.registerLazySingleton<WeewxStationDataSource>(
      () => WeewxStationDataSourceImpl(http: sl()),
    );
    sl.registerLazySingleton<WeewxEndpointDataSource>(
      () => WeewxEndpointDataSourceImpl(),
    );

    // Repositories
    sl.registerLazySingleton<ThemeRepository>(
      () => ThemeRepositoryImpl(dataSource: sl()),
    );
    sl.registerLazySingleton<WeewxStationRepository>(
      () => WeewxStationRepositoryImpl(dataSource: sl()),
    );
    sl.registerLazySingleton<WeewxEndpointRepository>(
      () => WeewxEndpointRepositoryImpl(dataSource: sl()),
    );

    // Usecases
    //sl.registerLazySingleton(() => ChangeStationUsecase(repository: sl()));
    //sl.registerLazySingleton(
    //    () => UpdateMainScreenDataUsecase(repository: sl()));

    // Blocs
    sl.registerFactory<ThemeCubit>(
      () => ThemeCubit(themeRepository: sl())..init(),
    );
    sl.registerFactory<WeewxEndpointCubit>(
      () => WeewxEndpointCubit(),
    );
    sl.registerFactory<MainScreenBloc>(
      () => MainScreenBloc(
        stationRepository: sl(),
        endpointRepository: sl(),
      ),
    );
    sl.registerFactory<AddEndpointScreenBloc>(
      () => AddEndpointScreenBloc(
        stationRepository: sl(),
        endpointRepository: sl(),
      ),
    );

    // Misc
    sl.registerLazySingleton(() {
      final ret = Dio();
      ret.options = BaseOptions();
      return ret;
    });
  }
}
