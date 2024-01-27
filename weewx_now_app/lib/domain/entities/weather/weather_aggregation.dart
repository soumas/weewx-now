import 'package:weewx_now_app/domain/entities/weather/value_agg_data.dart';

class WeatherAggregation {
  final ValueAggData maxTemperature;
  final ValueAggData minTemperature;
  final ValueAggData maxDewpoint;
  final ValueAggData minDewpoint;
  final ValueAggData maxHumidity;
  final ValueAggData minHumidity;
  final ValueAggData maxBarometer;
  final ValueAggData minBarometer;
  final ValueAggData maxWindSpeed;
  final ValueAggData maxWindGust;
  final ValueAggData maxRainRate;
  final ValueAggData rainTotal;
  final ValueAggData maxInsideTemperature;
  final ValueAggData minInsideTemperature;
  final ValueAggData maxInsideHumidity;
  final ValueAggData minInsideHumidity;
  WeatherAggregation({
    required this.maxTemperature,
    required this.minTemperature,
    required this.maxDewpoint,
    required this.minDewpoint,
    required this.maxHumidity,
    required this.minHumidity,
    required this.maxBarometer,
    required this.minBarometer,
    required this.maxWindSpeed,
    required this.maxWindGust,
    required this.maxRainRate,
    required this.rainTotal,
    required this.maxInsideTemperature,
    required this.minInsideTemperature,
    required this.maxInsideHumidity,
    required this.minInsideHumidity,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherAggregation &&
        other.maxTemperature == maxTemperature &&
        other.minTemperature == minTemperature &&
        other.maxDewpoint == maxDewpoint &&
        other.minDewpoint == minDewpoint &&
        other.maxHumidity == maxHumidity &&
        other.minHumidity == minHumidity &&
        other.maxBarometer == maxBarometer &&
        other.minBarometer == minBarometer &&
        other.maxWindSpeed == maxWindSpeed &&
        other.maxWindGust == maxWindGust &&
        other.maxRainRate == maxRainRate &&
        other.rainTotal == rainTotal &&
        other.maxInsideTemperature == maxInsideTemperature &&
        other.minInsideTemperature == minInsideTemperature &&
        other.maxInsideHumidity == maxInsideHumidity &&
        other.minInsideHumidity == minInsideHumidity;
  }

  @override
  int get hashCode {
    return maxTemperature.hashCode ^
        minTemperature.hashCode ^
        maxDewpoint.hashCode ^
        minDewpoint.hashCode ^
        maxHumidity.hashCode ^
        minHumidity.hashCode ^
        maxBarometer.hashCode ^
        minBarometer.hashCode ^
        maxWindSpeed.hashCode ^
        maxWindGust.hashCode ^
        maxRainRate.hashCode ^
        rainTotal.hashCode ^
        maxInsideTemperature.hashCode ^
        minInsideTemperature.hashCode ^
        maxInsideHumidity.hashCode ^
        minInsideHumidity.hashCode;
  }
}
