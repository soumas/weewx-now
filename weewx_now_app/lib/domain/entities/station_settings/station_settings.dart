import 'dart:convert';

import 'package:weewx_now/domain/entities/station_settings/extras.dart';
import 'package:weewx_now/domain/entities/station_settings/station.dart';

class StationSettings {
  final int generation;
  final Station station;
  final Extras extras;
  StationSettings({
    required this.generation,
    required this.station,
    required this.extras,
  });

  StationSettings copyWith({
    int? generation,
    Station? station,
    Extras? extras,
  }) {
    return StationSettings(
      generation: generation ?? this.generation,
      station: station ?? this.station,
      extras: extras ?? this.extras,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'generation': generation,
      'station': station.toMap(),
      'extras': extras.toMap(),
    };
  }

  factory StationSettings.fromMap(Map<String, dynamic> map) {
    return StationSettings(
      generation: map['generation']?.toInt() ?? 0,
      station: Station.fromMap(map['station']),
      extras: Extras.fromMap(map['extras']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StationSettings.fromJson(String source) => StationSettings.fromMap(json.decode(source));

  @override
  String toString() => 'StationSettings(generation: $generation, station: $station, extras: $extras)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StationSettings && other.generation == generation && other.station == station && other.extras == extras;
  }

  @override
  int get hashCode => generation.hashCode ^ station.hashCode ^ extras.hashCode;
}
