import 'package:weewx_now/data/models/now_weather_agg_model.dart';
import 'package:weewx_now/domain/entities/weather_data/aggregations/aggregations.dart';

extension NowWeatherAggModelExt on NowWeatherAggModel {
  Aggregations toEntity() {
    return Aggregations(generation: DateTime.now(), values: {});
  }
}
