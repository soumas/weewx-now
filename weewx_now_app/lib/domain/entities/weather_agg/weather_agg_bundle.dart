import 'dart:convert';

import 'package:weewx_now/domain/entities/weather_agg/agg_data_set.dart';

class WeatherAggBundle {
  final DateTime generation;
  final AggDataSet day;
  final AggDataSet week;
  final AggDataSet month;
  final AggDataSet year;
  WeatherAggBundle({
    required this.generation,
    required this.day,
    required this.week,
    required this.month,
    required this.year,
  });

  WeatherAggBundle copyWith({
    DateTime? generation,
    AggDataSet? day,
    AggDataSet? week,
    AggDataSet? month,
    AggDataSet? year,
  }) {
    return WeatherAggBundle(
      generation: generation ?? this.generation,
      day: day ?? this.day,
      week: week ?? this.week,
      month: month ?? this.month,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'generation': generation.millisecondsSinceEpoch,
      'day': day.toMap(),
      'week': week.toMap(),
      'month': month.toMap(),
      'year': year.toMap(),
    };
  }

  factory WeatherAggBundle.fromMap(Map<String, dynamic> map) {
    return WeatherAggBundle(
      generation: DateTime.fromMillisecondsSinceEpoch(map['generation']),
      day: AggDataSet.fromMap(map['day']),
      week: AggDataSet.fromMap(map['week']),
      month: AggDataSet.fromMap(map['month']),
      year: AggDataSet.fromMap(map['year']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherAggBundle.fromJson(String source) => WeatherAggBundle.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeatherAggBundle(generation: $generation, day: $day, week: $week, month: $month, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherAggBundle && other.generation == generation && other.day == day && other.week == week && other.month == month && other.year == year;
  }

  @override
  int get hashCode {
    return generation.hashCode ^ day.hashCode ^ week.hashCode ^ month.hashCode ^ year.hashCode;
  }
}
