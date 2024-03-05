import 'dart:convert';

class Station {
  final String location;
  final double latitude;
  final double longitude;
  final int altitudeMeters;
  final String lang;
  final String? stationUrl;
  final String hardware;
  final String uptimeOS;
  final String uptimeWeeWX;
  final String versionWeeWX;
  Station({
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.altitudeMeters,
    required this.lang,
    this.stationUrl,
    required this.hardware,
    required this.uptimeOS,
    required this.uptimeWeeWX,
    required this.versionWeeWX,
  });

  Station copyWith({
    String? location,
    double? latitude,
    double? longitude,
    int? altitudeMeters,
    String? lang,
    String? stationUrl,
    String? hardware,
    String? uptimeOS,
    String? uptimeWeeWX,
    String? versionWeeWX,
  }) {
    return Station(
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      altitudeMeters: altitudeMeters ?? this.altitudeMeters,
      lang: lang ?? this.lang,
      stationUrl: stationUrl ?? this.stationUrl,
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
      'lang': lang,
      'stationUrl': stationUrl,
      'hardware': hardware,
      'uptimeOS': uptimeOS,
      'uptimeWeeWX': uptimeWeeWX,
      'versionWeeWX': versionWeeWX,
    };
  }

  factory Station.fromMap(Map<String, dynamic> map) {
    return Station(
      location: map['location'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      altitudeMeters: map['altitudeMeters']?.toInt() ?? 0,
      lang: map['lang'] ?? '',
      stationUrl: map['stationUrl'],
      hardware: map['hardware'] ?? '',
      uptimeOS: map['uptimeOS'] ?? '',
      uptimeWeeWX: map['uptimeWeeWX'] ?? '',
      versionWeeWX: map['versionWeeWX'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Station.fromJson(String source) => Station.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Station(location: $location, latitude: $latitude, longitude: $longitude, altitudeMeters: $altitudeMeters, lang: $lang, stationUrl: $stationUrl, hardware: $hardware, uptimeOS: $uptimeOS, uptimeWeeWX: $uptimeWeeWX, versionWeeWX: $versionWeeWX)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Station &&
        other.location == location &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.altitudeMeters == altitudeMeters &&
        other.lang == lang &&
        other.stationUrl == stationUrl &&
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
        lang.hashCode ^
        stationUrl.hashCode ^
        hardware.hashCode ^
        uptimeOS.hashCode ^
        uptimeWeeWX.hashCode ^
        versionWeeWX.hashCode;
  }
}