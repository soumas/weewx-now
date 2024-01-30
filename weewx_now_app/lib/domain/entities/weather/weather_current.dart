import 'package:weewx_now/domain/entities/weather/value_data.dart';

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherCurrent &&
        other.generation == generation &&
        other.temperature == temperature &&
        other.dewpoint == dewpoint &&
        other.humidity == humidity &&
        other.heatIndex == heatIndex &&
        other.barometer == barometer &&
        other.windSpeed == windSpeed &&
        other.windGust == windGust &&
        other.windDirection == windDirection &&
        other.windChill == windChill &&
        other.rainRate == rainRate &&
        other.insideTemperature == insideTemperature &&
        other.insideHumidity == insideHumidity;
  }

  @override
  int get hashCode {
    return generation.hashCode ^
        temperature.hashCode ^
        dewpoint.hashCode ^
        humidity.hashCode ^
        heatIndex.hashCode ^
        barometer.hashCode ^
        windSpeed.hashCode ^
        windGust.hashCode ^
        windDirection.hashCode ^
        windChill.hashCode ^
        rainRate.hashCode ^
        insideTemperature.hashCode ^
        insideHumidity.hashCode;
  }
}
