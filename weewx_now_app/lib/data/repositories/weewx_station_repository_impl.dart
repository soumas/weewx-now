import 'package:weewx_now_app/data/datasources/weewx_station_data_source.dart';
import 'package:weewx_now_app/data/models/images_model_ext.dart';
import 'package:weewx_now_app/data/models/settings_model_ext.dart';
import 'package:weewx_now_app/data/models/weather_model_ext.dart';
import 'package:weewx_now_app/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now_app/domain/entities/image/image_bundle.dart';
import 'package:weewx_now_app/domain/entities/wee_wx_config/wee_wx_config.dart';
import 'package:weewx_now_app/domain/entities/weather/weather_data.dart';
import 'package:weewx_now_app/domain/repositories/weewx_station_repository.dart';

class WeewxStationRepositoryImpl extends WeewxStationRepository {
  final WeewxStationDataSource dataSource;

  WeewxStationRepositoryImpl({required this.dataSource});

  @override
  Future<WeeWxConfig> loadSettings(WeewxEndpoint endpoint) async {
    return (await dataSource.loadSettings(endpoint)).toEntity();
  }

  @override
  Future<ImageBundle> loadImages(WeewxEndpoint endpoint) async {
    return (await dataSource.loadImages(endpoint)).toEntity();
  }

  @override
  Future<WeatherData> loadWeather(WeewxEndpoint endpoint) async {
    return (await dataSource.loadWeather(endpoint)).toEntity();
  }
}
