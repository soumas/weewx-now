import 'package:weewx_now_app/domain/entities/weather/weather_aggregation_entity.dart';
import 'package:weewx_now_app/domain/entities/weather/weather_current_entity.dart';

class WeatherDataEntity {
  final WeatherCurrentEntity current;
  final WeatherAggregationEntity day;
  final WeatherAggregationEntity week;
  final WeatherAggregationEntity month;
  final WeatherAggregationEntity year;
  WeatherDataEntity({
    required this.current,
    required this.day,
    required this.week,
    required this.month,
    required this.year,
  });
}
