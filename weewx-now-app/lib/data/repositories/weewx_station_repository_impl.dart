import 'package:weewx_now/data/datasources/weewx_station_data_source.dart';
import 'package:weewx_now/data/models/images_model_ext.dart';
import 'package:weewx_now/data/models/settings_model_ext.dart';
import 'package:weewx_now/data/models/weather_model_ext.dart';
import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint_entity.dart';
import 'package:weewx_now/domain/entities/image/images_entity.dart';
import 'package:weewx_now/domain/entities/settings/settings_entity.dart';
import 'package:weewx_now/domain/entities/weather/weather_data_entity.dart';
import 'package:weewx_now/domain/repositories/weewx_station_repository.dart';

class WeewxStationRepositoryImpl extends WeewxStationRepository {
  final WeewxStationDataSource dataSource;

  WeewxStationRepositoryImpl({required this.dataSource});

  @override
  Future<SettingsEntity> loadSettings(WeewxEndpointEntity endpoint) async {
    return (await dataSource.loadSettings(endpoint)).toEntity();
  }

  @override
  Future<ImagesEntity> loadImages(WeewxEndpointEntity endpoint) async {
    return (await dataSource.loadImages(endpoint)).toEntity();
  }

  @override
  Future<WeatherDataEntity> loadWeather(WeewxEndpointEntity endpoint) async {
    return (await dataSource.loadWeather(endpoint)).toEntity();
  }
}
