import 'dart:convert';

import 'package:weewx_pwa/data/models/settings/station_model.dart';
import 'package:weewx_pwa/data/models/settings/webapp_model.dart';
import 'package:weewx_pwa/domain/entities/settings/settings_entity.dart';

class SettingsModel {
  final String generation;
  final StationModel station;
  final WebappModel webapp;

  SettingsModel({
    required this.generation,
    required this.station,
    required this.webapp,
  });

  SettingsEntity toEntity() {
    return SettingsEntity(station: station.toEntity());
  }

  SettingsModel copyWith({
    String? generation,
    StationModel? station,
    WebappModel? webapp,
  }) {
    return SettingsModel(
      generation: generation ?? this.generation,
      station: station ?? this.station,
      webapp: webapp ?? this.webapp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'generation': generation,
      'station': station.toMap(),
      'webapp': webapp.toMap(),
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      generation: map['generation'] ?? '',
      station: StationModel.fromMap(map['station']),
      webapp: WebappModel.fromMap(map['webapp']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsModel.fromJson(String source) =>
      SettingsModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'SettingsModel(generation: $generation, station: $station, webapp: $webapp)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SettingsModel &&
        other.generation == generation &&
        other.station == station &&
        other.webapp == webapp;
  }

  @override
  int get hashCode => generation.hashCode ^ station.hashCode ^ webapp.hashCode;
}
