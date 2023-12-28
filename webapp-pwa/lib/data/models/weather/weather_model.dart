import 'dart:convert';

import 'package:weewx_pwa/data/models/weather/weather_aggregation_model.dart';
import 'package:weewx_pwa/data/models/weather/weather_current_model.dart';
import 'package:weewx_pwa/domain/entities/weather/weather_data_entity.dart';

class WeatherModel {
  final WeatherCurrentModel current;
  final WeatherAggregationModel day;
  final WeatherAggregationModel week;
  final WeatherAggregationModel month;
  final WeatherAggregationModel year;

  WeatherModel({
    required this.current,
    required this.day,
    required this.week,
    required this.month,
    required this.year,
  });

  WeatherDataEntity toEntity() {
    return WeatherDataEntity(
      current: current.toEntity(),
      day: day.toEntity(),
      week: week.toEntity(),
      month: month.toEntity(),
      year: year.toEntity(),
    );
  }

  WeatherModel copyWith({
    WeatherCurrentModel? current,
    WeatherAggregationModel? day,
    WeatherAggregationModel? week,
    WeatherAggregationModel? month,
    WeatherAggregationModel? year,
  }) {
    return WeatherModel(
      current: current ?? this.current,
      day: day ?? this.day,
      week: week ?? this.week,
      month: month ?? this.month,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current': current.toMap(),
      'day': day.toMap(),
      'week': week.toMap(),
      'month': month.toMap(),
      'year': year.toMap(),
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      current: WeatherCurrentModel.fromMap(map['current']),
      day: WeatherAggregationModel.fromMap(map['day']),
      week: WeatherAggregationModel.fromMap(map['week']),
      month: WeatherAggregationModel.fromMap(map['month']),
      year: WeatherAggregationModel.fromMap(map['year']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeatherModel(current: $current, day: $day, week: $week, month: $month, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherModel &&
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
