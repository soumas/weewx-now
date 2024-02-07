import 'dart:convert';

class SettingsModel {
  final String generation;
  final Station station;
  final Weewxnow weewxnow;
  SettingsModel({
    required this.generation,
    required this.station,
    required this.weewxnow,
  });

  SettingsModel copyWith({
    String? generation,
    Station? station,
    Weewxnow? weewxnow,
  }) {
    return SettingsModel(
      generation: generation ?? this.generation,
      station: station ?? this.station,
      weewxnow: weewxnow ?? this.weewxnow,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'generation': generation,
      'station': station.toMap(),
      'weewxnow': weewxnow.toMap(),
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      generation: map['generation'] ?? '',
      station: Station.fromMap(map['station']),
      weewxnow: Weewxnow.fromMap(map['weewxnow']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsModel.fromJson(String source) => SettingsModel.fromMap(json.decode(source));

  @override
  String toString() => 'SettingsModel(generation: $generation, station: $station, weewxnow: $weewxnow)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SettingsModel && other.generation == generation && other.station == station && other.weewxnow == weewxnow;
  }

  @override
  int get hashCode => generation.hashCode ^ station.hashCode ^ weewxnow.hashCode;
}

class Station {
  final String location;
  final double latitude;
  final double longitude;
  final double altitudeMeters;
  final String lang;
  final String url;
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
    required this.url,
    required this.hardware,
    required this.uptimeOS,
    required this.uptimeWeeWX,
    required this.versionWeeWX,
  });

  Station copyWith({
    String? location,
    double? latitude,
    double? longitude,
    double? altitudeMeters,
    String? lang,
    String? url,
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
      'lang': lang,
      'url': url,
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
      altitudeMeters: map['altitudeMeters']?.toDouble() ?? 0.0,
      lang: map['lang'] ?? '',
      url: map['url'] ?? '',
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
    return 'Station(location: $location, latitude: $latitude, longitude: $longitude, altitudeMeters: $altitudeMeters, lang: $lang, url: $url, hardware: $hardware, uptimeOS: $uptimeOS, uptimeWeeWX: $uptimeWeeWX, versionWeeWX: $versionWeeWX)';
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
        lang.hashCode ^
        url.hashCode ^
        hardware.hashCode ^
        uptimeOS.hashCode ^
        uptimeWeeWX.hashCode ^
        versionWeeWX.hashCode;
  }
}

class Weewxnow {
  final String responsibleEntityName;
  final String responsibleEntityUrl;
  final bool hideImageViewer;
  final String password;
  Weewxnow({
    required this.responsibleEntityName,
    required this.responsibleEntityUrl,
    required this.hideImageViewer,
    required this.password,
  });

  Weewxnow copyWith({
    String? responsibleEntityName,
    String? responsibleEntityUrl,
    bool? hideImageViewer,
    String? password,
  }) {
    return Weewxnow(
      responsibleEntityName: responsibleEntityName ?? this.responsibleEntityName,
      responsibleEntityUrl: responsibleEntityUrl ?? this.responsibleEntityUrl,
      hideImageViewer: hideImageViewer ?? this.hideImageViewer,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'responsibleEntityName': responsibleEntityName,
      'responsibleEntityUrl': responsibleEntityUrl,
      'hideImageViewer': hideImageViewer,
      'password': password,
    };
  }

  factory Weewxnow.fromMap(Map<String, dynamic> map) {
    return Weewxnow(
      responsibleEntityName: map['responsibleEntityName'] ?? '',
      responsibleEntityUrl: map['responsibleEntityUrl'] ?? '',
      hideImageViewer: map['hideImageViewer'] ?? false,
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Weewxnow.fromJson(String source) => Weewxnow.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Weewxnow(responsibleEntityName: $responsibleEntityName, responsibleEntityUrl: $responsibleEntityUrl, hideImageViewer: $hideImageViewer, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Weewxnow &&
        other.responsibleEntityName == responsibleEntityName &&
        other.responsibleEntityUrl == responsibleEntityUrl &&
        other.hideImageViewer == hideImageViewer &&
        other.password == password;
  }

  @override
  int get hashCode {
    return responsibleEntityName.hashCode ^ responsibleEntityUrl.hashCode ^ hideImageViewer.hashCode ^ password.hashCode;
  }
}
