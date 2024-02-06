import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weewx_now/data/datasources/locale_data_source.dart';
import 'package:weewx_now/data/datasources/theme_data_source.dart';
import 'package:weewx_now/data/datasources/weewx_endpoint_data_source.dart';
import 'package:weewx_now/data/datasources/weewx_station_data_source.dart';
import 'package:weewx_now/data/repositories/locale_repository_impl.dart';
import 'package:weewx_now/data/repositories/theme_repository_impl.dart';
import 'package:weewx_now/data/repositories/weewx_endpoint_repository_impl.dart';
import 'package:weewx_now/data/repositories/weewx_station_repository_impl.dart';
import 'package:weewx_now/domain/repositories/locale_repository.dart';
import 'package:weewx_now/domain/repositories/theme_repository.dart';
import 'package:weewx_now/domain/repositories/weewx_endpoint_repository.dart';
import 'package:weewx_now/domain/repositories/weewx_station_repository.dart';
import 'package:weewx_now/presentation/bloc/add_station_confirm_screen/add_station_confirm_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/add_station_precheck_screen/add_station_precheck_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/busy/busy_cubit.dart';
import 'package:weewx_now/presentation/bloc/dashboard_screen/dashboard_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/locale/locale_cubit.dart';
import 'package:weewx_now/presentation/bloc/my_stations_screen/my_stations_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/theme/theme_cubit.dart';
import 'package:weewx_now/presentation/bloc/weewx_endpoint/weewx_endpoint_cubit.dart';

final sl = GetIt.instance;

class Injection {
  Injection._();

  static Future<void> init() async {
    // DataSources
    sl.registerLazySingleton<ThemeDataSource>(
      () => ThemeDataSourceImpl(),
    );
    sl.registerLazySingleton<LocaleDataSource>(
      () => LocaleDataSourceImpl(),
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
    sl.registerLazySingleton<LocaleRepository>(
      () => LocaleRepositoryImpl(dataSource: sl()),
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
    // LocaleCubit is singleton because it wraps the whole app
    sl.registerLazySingleton<LocaleCubit>(
      () => LocaleCubit(localeRepository: sl()),
    );
    // WeewxEndpointCubit is singleton because it wraps the whole app
    sl.registerLazySingleton<CurrentEndpointCubit>(
      () => CurrentEndpointCubit(weewxEndpointRepository: sl()),
    );
    // WeewxEndpointCubit is singleton because it wraps the whole app
    sl.registerLazySingleton<BusyCubit>(
      () => BusyCubit(),
    );
    sl.registerFactory<DashboardScreenBloc>(
      () => DashboardScreenBloc(stationRepository: sl()),
    );
    sl.registerFactory<AddStationPrecheckScreenBloc>(
      () => AddStationPrecheckScreenBloc(stationRepository: sl()),
    );
    sl.registerFactory<AddStationConfirmScreenBloc>(
      () => AddStationConfirmScreenBloc(endpointRepository: sl()),
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
