import 'dart:convert';

import 'package:weewx_pwa/domain/entities/settings/station_entity.dart';

class StationModel {
  final String location;
  final double latitude;
  final double longitude;
  final double altitudeMeters;
  final String url;
  final String hardware;
  final String uptimeOS;
  final String uptimeWeeWX;
  final String versionWeeWX;

  StationModel({
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.altitudeMeters,
    required this.url,
    required this.hardware,
    required this.uptimeOS,
    required this.uptimeWeeWX,
    required this.versionWeeWX,
  });

  StationEntity toEntity() {
    return StationEntity(
      location: location,
      latitude: latitude,
      longitude: longitude,
      altitudeMeters: altitudeMeters,
      url: url,
      hardware: hardware,
      uptimeOS: uptimeOS,
      uptimeWeeWX: uptimeWeeWX,
      versionWeeWX: versionWeeWX,
    );
  }

  StationModel copyWith({
    String? location,
    double? latitude,
    double? longitude,
    double? altitudeMeters,
    String? url,
    String? hardware,
    String? uptimeOS,
    String? uptimeWeeWX,
    String? versionWeeWX,
  }) {
    return StationModel(
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      altitudeMeters: altitudeMeters ?? this.altitudeMeters,
      url: url ?? this.url,
      hardware: hardware ?? this.hardware,
      uptimeOS: uptimeOS ?? this.uptimeOS,
      uptimeWeeWX: uptimeWeeWX ?? this.uptimeWeeWX,
      versionWeeWX: versionWeeWX ?? this.versionWeeWX,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'altitudeMeters': altitudeMeters,
      'url': url,
      'hardware': hardware,
      'uptimeOS': uptimeOS,
      'uptimeWeeWX': uptimeWeeWX,
      'versionWeeWX': versionWeeWX,
    };
  }

  factory StationModel.fromMap(Map<String, dynamic> map) {
    return StationModel(
      location: map['location'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      altitudeMeters: map['altitudeMeters']?.toDouble() ?? 0.0,
      url: map['url'] ?? '',
      hardware: map['hardware'] ?? '',
      uptimeOS: map['uptimeOS'] ?? '',
      uptimeWeeWX: map['uptimeWeeWX'] ?? '',
      versionWeeWX: map['versionWeeWX'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StationModel.fromJson(String source) =>
      StationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StationModel(location: $location, latitude: $latitude, longitude: $longitude, altitudeMeters: $altitudeMeters, url: $url, hardware: $hardware, uptimeOS: $uptimeOS, uptimeWeeWX: $uptimeWeeWX, versionWeeWX: $versionWeeWX)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StationModel &&
        other.location == location &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.altitudeMeters == altitudeMeters &&
        other.url == url &&
        other.hardware == hardware &&
        other.uptimeOS == uptimeOS &&
        other.uptimeWeeWX == uptimeWeeWX &&
        other.versionWeeWX == versionWeeWX;
  }

  @override
  int get hashCode {
    return location.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        altitudeMeters.hashCode ^
        url.hashCode ^
        hardware.hashCode ^
        uptimeOS.hashCode ^
        uptimeWeeWX.hashCode ^
        versionWeeWX.hashCode;
  }
}
