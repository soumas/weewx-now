import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weewx_pwa/data/datasources/config_remote_data_source.dart';
import 'package:weewx_pwa/data/datasources/images_remote_data_source.dart';
import 'package:weewx_pwa/data/datasources/weather_remote_data_source.dart';
import 'package:weewx_pwa/data/repositories/config_repository_impl.dart';
import 'package:weewx_pwa/data/repositories/images_repository_impl.dart';
import 'package:weewx_pwa/data/repositories/weather_repository_impl.dart';
import 'package:weewx_pwa/domain/repositories/config_repository.dart';
import 'package:weewx_pwa/domain/repositories/images_repository.dart';
import 'package:weewx_pwa/domain/repositories/weather_repository.dart';

final sl = GetIt.instance;

class Injection {
  Injection._();

  static Future<void> init() async {
    // DataSources
    sl.registerLazySingleton<ConfigRemoteDataSource>(
      () => ConfigRemoteDataSourceImpl(http: sl()),
    );
    sl.registerLazySingleton<ImagesRemoteDataSource>(
      () => ImagesRemoteDataSourceImpl(http: sl()),
    );
    sl.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(http: sl()),
    );

    // Repositories
    sl.registerLazySingleton<ConfigRepository>(
      () => ConfigRepositoryImpl(dataSource: sl()),
    );
    sl.registerLazySingleton<ImagesRepository>(
      () => ImagesRepositoryImpl(dataSource: sl()),
    );
    sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(dataSource: sl()),
    );

    // Misc
    sl.registerLazySingleton(() => Dio());
  }
}
