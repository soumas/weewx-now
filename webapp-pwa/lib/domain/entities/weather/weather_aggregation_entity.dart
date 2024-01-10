import 'package:weewx_pwa/domain/entities/weather/value_agg_data_entity.dart';

class WeatherAggregationEntity {
  final ValueAggDataEntity maxTemperature;
  final ValueAggDataEntity minTemperature;
  final ValueAggDataEntity maxDewpoint;
  final ValueAggDataEntity minDewpoint;
  final ValueAggDataEntity maxHumidity;
  final ValueAggDataEntity minHumidity;
  final ValueAggDataEntity maxBarometer;
  final ValueAggDataEntity minBarometer;
  final ValueAggDataEntity maxWindSpeed;
  final ValueAggDataEntity maxWindGust;
  final ValueAggDataEntity maxRainRate;
  final ValueAggDataEntity rainTotal;
  final ValueAggDataEntity maxInsideTemperature;
  final ValueAggDataEntity minInsideTemperature;
  final ValueAggDataEntity maxInsideHumidity;
  final ValueAggDataEntity minInsideHumidity;
  WeatherAggregationEntity({
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
