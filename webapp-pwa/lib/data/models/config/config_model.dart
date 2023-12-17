import 'dart:convert';

import 'package:weewx_pwa/data/models/config/station_model.dart';
import 'package:weewx_pwa/domain/entities/config/config_entity.dart';

class ImagesModel {
  final StationModel station;

  ImagesModel({
    required this.station,
  });

  ConfigEntity toEntity() {
    return ConfigEntity(station: station.toEntity());
  }

  ImagesModel copyWith({
    StationModel? station,
  }) {
    return ImagesModel(
      station: station ?? this.station,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'station': station.toMap(),
    };
  }

  factory ImagesModel.fromMap(Map<String, dynamic> map) {
    return ImagesModel(
      station: StationModel.fromMap(map['station']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ImagesModel.fromJson(String source) =>
      ImagesModel.fromMap(json.decode(source));

  @override
  String toString() => 'ConfigModel(station: $station)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImagesModel && other.station == station;
  }

  @override
  int get hashCode => station.hashCode;
}
