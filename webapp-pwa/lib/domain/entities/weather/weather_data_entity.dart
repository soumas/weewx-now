import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weewx_pwa/domain/entities/weather/weather_aggregation_entity.dart';
import 'package:weewx_pwa/domain/entities/weather/weather_current_entity.dart';

part 'weather_data_entity.freezed.dart';

@freezed
class WeatherDataEntity with _$WeatherDataEntity {
  factory WeatherDataEntity({
    required WeatherCurrentEntity current,
    required WeatherAggregationEntity day,
    required WeatherAggregationEntity week,
    required WeatherAggregationEntity month,
    required WeatherAggregationEntity year,
  }) = _WeatherDataEntity;
}
