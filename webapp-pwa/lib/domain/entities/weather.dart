import 'package:weewx_pwa/domain/entities/weather_aggregation.dart';
import 'package:weewx_pwa/domain/entities/weather_current.dart';

class Weather {
  final WeatherCurrent current;
  final WeatherAggregation day;
  final WeatherAggregation week;
  final WeatherAggregation month;
  final WeatherAggregation year;

  Weather({
    required this.current,
    required this.day,
    required this.week,
    required this.month,
    required this.year,
  });
}
