import 'dart:convert';

import 'package:weewx_pwa/data/models/settings/station_model.dart';
import 'package:weewx_pwa/data/models/settings/texts_model.dart';
import 'package:weewx_pwa/data/models/settings/webapp_model.dart';
import 'package:weewx_pwa/domain/entities/settings/settings_entity.dart';

class SettingsModel {
  final String generation;
  final StationModel station;
  final WebappModel webapp;
  final TextsModel texts;

  SettingsModel({
    required this.generation,
    required this.station,
    required this.webapp,
    required this.texts,
  });

  SettingsEntity toEntity() {
    return SettingsEntity(
      station: station.toEntity(),
      webapp: webapp.toEntity(),
      texts: texts.toEntity(),
    );
  }

  SettingsModel copyWith({
    String? generation,
    StationModel? station,
    WebappModel? webapp,
    TextsModel? texts,
  }) {
    return SettingsModel(
      generation: generation ?? this.generation,
      station: station ?? this.station,
      webapp: webapp ?? this.webapp,
      texts: texts ?? this.texts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'generation': generation,
      'station': station.toMap(),
      'webapp': webapp.toMap(),
      'texts': texts.toMap(),
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      generation: map['generation'] ?? '',
      station: StationModel.fromMap(map['station']),
      webapp: WebappModel.fromMap(map['webapp']),
      texts: TextsModel.fromMap(map['texts']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsModel.fromJson(String source) =>
      SettingsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SettingsModel(generation: $generation, station: $station, webapp: $webapp, texts: $texts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SettingsModel &&
        other.generation == generation &&
        other.station == station &&
        other.webapp == webapp &&
        other.texts == texts;
  }

  @override
  int get hashCode {
    return generation.hashCode ^
        station.hashCode ^
        webapp.hashCode ^
        texts.hashCode;
  }
}
