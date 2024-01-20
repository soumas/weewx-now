import 'package:weewx_now_app/domain/entities/endpoint/weewx_endpoint_entity.dart';
import 'package:weewx_now_app/domain/entities/image/images_entity.dart';
import 'package:weewx_now_app/domain/entities/settings/settings_entity.dart';
import 'package:weewx_now_app/domain/entities/weather/weather_data_entity.dart';

abstract class WeewxStationRepository {
  Future<SettingsEntity> loadSettings(WeewxEndpointEntity endpoint);
  Future<WeatherDataEntity> loadWeather(WeewxEndpointEntity endpoint);
  Future<ImagesEntity> loadImages(WeewxEndpointEntity endpoint);
}
