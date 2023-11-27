import 'package:weewx_pwa/domain/entities/value_agg_data.dart';

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
}
