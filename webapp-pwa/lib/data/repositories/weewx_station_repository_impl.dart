import 'package:weewx_pwa/data/datasources/weewx_station_data_source.dart';
import 'package:weewx_pwa/domain/entities/image/images_entity.dart';
import 'package:weewx_pwa/domain/entities/settings/settings_entity.dart';
import 'package:weewx_pwa/domain/entities/weather/weather_data_entity.dart';
import 'package:weewx_pwa/domain/repositories/weewx_station_repository.dart';

class WeewxStationRepositoryImpl extends WeewxStationRepository {
  final WeewxStationDataSource dataSource;

  WeewxStationRepositoryImpl({required this.dataSource});

  @override
  Future<SettingsEntity> loadSettings(String endpoint) async {
    return (await dataSource.loadSettings(endpoint)).toEntity();
  }

  @override
  Future<ImagesEntity> loadImages(String endpoint) async {
    return (await dataSource.loadImages(endpoint)).toEntity();
  }

  @override
  Future<WeatherDataEntity> loadWeather(String endpoint) async {
    return (await dataSource.loadWeather(endpoint)).toEntity();
  }
}
