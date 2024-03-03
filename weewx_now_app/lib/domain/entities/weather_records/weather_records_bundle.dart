import 'dart:convert';

import 'package:weewx_now/domain/entities/weather_records/weather_current.dart';

class WeatherRecordsBundle {
  final DateTime generation;
  final WeatherCurrent current;
  final String shortTerm;
  WeatherRecordsBundle({
    required this.generation,
    required this.current,
    required this.shortTerm,
  });

  WeatherRecordsBundle copyWith({
    DateTime? generation,
    WeatherCurrent? current,
    String? shortTerm,
  }) {
    return WeatherRecordsBundle(
      generation: generation ?? this.generation,
      current: current ?? this.current,
      shortTerm: shortTerm ?? this.shortTerm,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'generation': generation.millisecondsSinceEpoch,
      'current': current.toMap(),
      'shortTerm': shortTerm,
    };
  }

  factory WeatherRecordsBundle.fromMap(Map<String, dynamic> map) {
    return WeatherRecordsBundle(
      generation: DateTime.fromMillisecondsSinceEpoch(map['generation']),
      current: WeatherCurrent.fromMap(map['current']),
      shortTerm: map['shortTerm'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherRecordsBundle.fromJson(String source) => WeatherRecordsBundle.fromMap(json.decode(source));

  @override
  String toString() => 'WeatherRecordsBundle(generation: $generation, current: $current, shortTerm: $shortTerm)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherRecordsBundle && other.generation == generation && other.current == current && other.shortTerm == shortTerm;
  }

  @override
  int get hashCode => generation.hashCode ^ current.hashCode ^ shortTerm.hashCode;
}
