import 'package:weewx_now/domain/entities/weather/weather_aggregation.dart';
import 'package:weewx_now/domain/entities/weather/weather_current.dart';

class WeatherData {
  final WeatherCurrent current;
  final WeatherAggregation day;
  final WeatherAggregation week;
  final WeatherAggregation month;
  final WeatherAggregation year;
  WeatherData({
    required this.current,
    required this.day,
    required this.week,
    required this.month,
    required this.year,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherData && other.current == current && other.day == day && other.week == week && other.month == month && other.year == year;
  }

  @override
  int get hashCode {
    return current.hashCode ^ day.hashCode ^ week.hashCode ^ month.hashCode ^ year.hashCode;
  }
}
