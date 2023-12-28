import 'package:weewx_pwa/domain/entities/weather/weather_data_entity.dart';

abstract class WeatherRepository {
  Future<WeatherDataEntity> loadWeather();
}
