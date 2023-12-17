import 'package:weewx_pwa/domain/entities/weather/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> loadWeather();
}
