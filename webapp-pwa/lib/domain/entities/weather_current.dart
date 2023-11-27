import 'package:weewx_pwa/domain/entities/value_data.dart';

class WeatherCurrent {
  final DateTime generation;
  final ValueData temperature;
  final ValueData dewpoint;
  final ValueData humidity;
  final ValueData heatIndex;
  final ValueData barometer;
  final ValueData windSpeed;
  final ValueData windGust;
  final ValueData windDirection;
  final ValueData windChill;
  final ValueData rainRate;
  final ValueData insideTemperature;
  final ValueData insideHumidity;

  WeatherCurrent({
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
