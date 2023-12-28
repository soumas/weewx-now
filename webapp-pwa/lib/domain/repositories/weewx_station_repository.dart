import 'package:weewx_pwa/domain/entities/image/images_entity.dart';
import 'package:weewx_pwa/domain/entities/settings/settings_entity.dart';
import 'package:weewx_pwa/domain/entities/weather/weather_data_entity.dart';

abstract class WeewxStationRepository {
  Future<SettingsEntity> loadSettings(String endpoint);
  Future<WeatherDataEntity> loadWeather(String endpoint);
  Future<ImagesEntity> loadImages(String endpoint);
}
