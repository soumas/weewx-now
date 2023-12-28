import 'package:weewx_pwa/domain/entities/weather/weather_aggregation_entity.dart';
import 'package:weewx_pwa/domain/entities/weather/weather_current_entity.dart';

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherDataEntity &&
        other.current == current &&
        other.day == day &&
        other.week == week &&
        other.month == month &&
        other.year == year;
  }

  @override
  int get hashCode {
    return current.hashCode ^
        day.hashCode ^
        week.hashCode ^
        month.hashCode ^
        year.hashCode;
  }
}
