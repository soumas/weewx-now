import 'package:weewx_now/domain/entities/weather/value_data_entity.dart';

class WeatherCurrentEntity {
  final DateTime generation;
  final ValueDataEntity temperature;
  final ValueDataEntity dewpoint;
  final ValueDataEntity humidity;
  final ValueDataEntity heatIndex;
  final ValueDataEntity barometer;
  final ValueDataEntity windSpeed;
  final ValueDataEntity windGust;
  final ValueDataEntity windDirection;
  final ValueDataEntity windChill;
  final ValueDataEntity rainRate;
  final ValueDataEntity insideTemperature;
  final ValueDataEntity insideHumidity;
  WeatherCurrentEntity({
    required this.generation,
    required this.temperature,
    required this.dewpoint,
    required this.humidity,
    required this.heatIndex,
    required this.barometer,
    required this.windSpeed,
    required this.windGust,
    required this.windDirection,
    required this.windChill,
    required this.rainRate,
    required this.insideTemperature,
    required this.insideHumidity,
  });
}
