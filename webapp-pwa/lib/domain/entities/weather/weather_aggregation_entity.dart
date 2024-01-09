import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weewx_pwa/domain/entities/weather/value_agg_data_entity.dart';

part 'weather_aggregation_entity.freezed.dart';

@freezed
class WeatherAggregationEntity with _$WeatherAggregationEntity {
  factory WeatherAggregationEntity({
    required ValueAggDataEntity maxTemperature,
    required ValueAggDataEntity minTemperature,
    required ValueAggDataEntity maxDewpoint,
    required ValueAggDataEntity minDewpoint,
    required ValueAggDataEntity maxHumidity,
    required ValueAggDataEntity minHumidity,
    required ValueAggDataEntity maxBarometer,
    required ValueAggDataEntity minBarometer,
    required ValueAggDataEntity maxWindSpeed,
    required ValueAggDataEntity maxWindGust,
    required ValueAggDataEntity maxRainRate,
    required ValueAggDataEntity rainTotal,
    required ValueAggDataEntity maxInsideTemperature,
    required ValueAggDataEntity minInsideTemperature,
    required ValueAggDataEntity maxInsideHumidity,
    required ValueAggDataEntity minInsideHumidity,
  }) = _WeatherAggregationEntity;
}
