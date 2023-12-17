import 'package:weewx_pwa/domain/entities/weather/value_data_entity.dart';

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherCurrentEntity &&
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
