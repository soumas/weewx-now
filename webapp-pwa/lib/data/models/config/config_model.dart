import 'dart:convert';

import 'package:weewx_pwa/data/models/config/station_model.dart';
import 'package:weewx_pwa/domain/entities/config/config_entity.dart';

class ConfigModel {
  final StationModel station;

  ConfigModel({
    required this.station,
  });

  ConfigEntity toEntity() {
    return ConfigEntity(station: station.toEntity());
  }

  ConfigModel copyWith({
    StationModel? station,
  }) {
    return ConfigModel(
      station: station ?? this.station,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'station': station.toMap(),
    };
  }

  factory ConfigModel.fromMap(Map<String, dynamic> map) {
    return ConfigModel(
      station: StationModel.fromMap(map['station']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigModel.fromJson(String source) =>
      ConfigModel.fromMap(json.decode(source));

  @override
  String toString() => 'ConfigModel(station: $station)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConfigModel && other.station == station;
  }

  @override
  int get hashCode => station.hashCode;
}
