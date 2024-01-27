import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weewx_now_app/data/datasources/theme_data_source.dart';
import 'package:weewx_now_app/data/datasources/weewx_endpoint_data_source.dart';
import 'package:weewx_now_app/data/datasources/weewx_station_data_source.dart';
import 'package:weewx_now_app/data/repositories/theme_repository_impl.dart';
import 'package:weewx_now_app/data/repositories/weewx_endpoint_repository_impl.dart';
import 'package:weewx_now_app/data/repositories/weewx_station_repository_impl.dart';
import 'package:weewx_now_app/domain/repositories/theme_repository.dart';
import 'package:weewx_now_app/domain/repositories/weewx_endpoint_repository.dart';
import 'package:weewx_now_app/domain/repositories/weewx_station_repository.dart';
import 'package:weewx_now_app/presentation/bloc/add_station_screen/add_station_screen_bloc.dart';
import 'package:weewx_now_app/presentation/bloc/dashboard_screen/dashboard_screen_bloc.dart';
import 'package:weewx_now_app/presentation/bloc/my_stations_screen/my_stations_screen_bloc.dart';
import 'package:weewx_now_app/presentation/bloc/theme/theme_cubit.dart';
import 'package:weewx_now_app/presentation/bloc/weewx_endpoint/weewx_endpoint_cubit.dart';

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

    // BLOC
    // ThemeCubit is singleton because it wraps the whole app
    sl.registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(themeRepository: sl()),
    );
    // WeewxEndpointCubit is singleton because it wraps the whole app
    sl.registerLazySingleton<WeewxEndpointCubit>(
      () => WeewxEndpointCubit(weewxEndpointRepository: sl())..init(),
    );
    sl.registerFactory<DashboardScreenBloc>(
      () => DashboardScreenBloc(stationRepository: sl()),
    );
    sl.registerFactory<AddStationScreenBloc>(
      () => AddStationScreenBloc(endpointRepository: sl(), stationRepository: sl()),
    );
    sl.registerFactory<MyStationsScreenBloc>(
      () => MyStationsScreenBloc(endpointRepository: sl())..add(LoadMyStations()),
    );

    // Misc
    sl.registerLazySingleton(() {
      final ret = Dio();
      ret.options = BaseOptions();
      return ret;
    });
  }
}
