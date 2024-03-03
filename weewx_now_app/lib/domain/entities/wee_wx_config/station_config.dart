import 'dart:convert';

class StationConfig {
  final String location;
  final double latitude;
  final double longitude;
  final double altitudeMeters;
  final String url;
  final String hardware;
  final String uptimeOS;
  final String uptimeWeeWX;
  final String versionWeeWX;
  StationConfig({
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StationConfig &&
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

  StationConfig copyWith({
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
    return StationConfig(
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

  factory StationConfig.fromMap(Map<String, dynamic> map) {
    return StationConfig(
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

  factory StationConfig.fromJson(String source) => StationConfig.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StationConfig(location: $location, latitude: $latitude, longitude: $longitude, altitudeMeters: $altitudeMeters, url: $url, hardware: $hardware, uptimeOS: $uptimeOS, uptimeWeeWX: $uptimeWeeWX, versionWeeWX: $versionWeeWX)';
  }
}
