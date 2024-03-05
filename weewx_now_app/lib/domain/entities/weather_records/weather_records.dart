import 'dart:convert';

import 'package:weewx_now/domain/entities/weather_records/current.dart';
import 'package:weewx_now/domain/entities/weather_records/short_term.dart';

class WeatherRecords {
  final int generation;
  final Current current;
  final ShortTerm shortTerm;
  WeatherRecords({
    required this.generation,
    required this.current,
    required this.shortTerm,
  });

  WeatherRecords copyWith({
    int? generation,
    Current? current,
    ShortTerm? shortTerm,
  }) {
    return WeatherRecords(
      generation: generation ?? this.generation,
      current: current ?? this.current,
      shortTerm: shortTerm ?? this.shortTerm,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'generation': generation,
      'current': current.toMap(),
      'shortTerm': shortTerm.toMap(),
    };
  }

  factory WeatherRecords.fromMap(Map<String, dynamic> map) {
    return WeatherRecords(
      generation: map['generation']?.toInt() ?? 0,
      current: Current.fromMap(map['current']),
      shortTerm: ShortTerm.fromMap(map['shortTerm']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherRecords.fromJson(String source) => WeatherRecords.fromMap(json.decode(source));

  @override
  String toString() => 'WeatherRecords(generation: $generation, current: $current, shortTerm: $shortTerm)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherRecords && other.generation == generation && other.current == current && other.shortTerm == shortTerm;
  }

  @override
  int get hashCode => generation.hashCode ^ current.hashCode ^ shortTerm.hashCode;
}
