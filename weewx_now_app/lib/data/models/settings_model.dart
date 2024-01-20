import 'dart:convert';

class SettingsModel {
  final String generation;
  final Station station;
  final Extras extras;
  final Texts texts;
  SettingsModel({
    required this.generation,
    required this.station,
    required this.extras,
    required this.texts,
  });

  SettingsModel copyWith({
    String? generation,
    Station? station,
    Extras? extras,
    Texts? texts,
  }) {
    return SettingsModel(
      generation: generation ?? this.generation,
      station: station ?? this.station,
      extras: extras ?? this.extras,
      texts: texts ?? this.texts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'generation': generation,
      'station': station.toMap(),
      'extras': extras.toMap(),
      'texts': texts.toMap(),
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      generation: map['generation'] ?? '',
      station: Station.fromMap(map['station']),
      extras: Extras.fromMap(map['extras']),
      texts: Texts.fromMap(map['texts']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsModel.fromJson(String source) =>
      SettingsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SettingsModel(generation: $generation, station: $station, extras: $extras, texts: $texts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SettingsModel &&
        other.generation == generation &&
        other.station == station &&
        other.extras == extras &&
        other.texts == texts;
  }

  @override
  int get hashCode {
    return generation.hashCode ^
        station.hashCode ^
        extras.hashCode ^
        texts.hashCode;
  }
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

  factory Station.fromJson(String source) =>
      Station.fromMap(json.decode(source));

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

class Extras {
  final String password;
  Extras({
    required this.password,
  });

  Extras copyWith({
    String? password,
  }) {
    return Extras(
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'password': password,
    };
  }

  factory Extras.fromMap(Map<String, dynamic> map) {
    return Extras(
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Extras.fromJson(String source) => Extras.fromMap(json.decode(source));

  @override
  String toString() => 'Extras(password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Extras && other.password == password;
  }

  @override
  int get hashCode => password.hashCode;
}

class Texts {
  final String outTemp;
  final String dewpoint;
  final String outHumidity;
  final String heatindex;
  final String barometer;
  final String windSpeed;
  final String windGust;
  final String windDir;
  final String windchill;
  final String rainRate;
  final String inTemp;
  final String inHumidity;
  final String outTempMax;
  final String outTempMin;
  final String dewpointMax;
  final String dewpointMin;
  final String outHumidityMax;
  final String outHumidityMin;
  final String barometerMax;
  final String barometerMin;
  final String windSpeedMax;
  final String windGustMax;
  final String rainRateMax;
  final String rainTotal;
  final String inTempMax;
  final String inTempMin;
  final String inHumidityMax;
  final String inHumidityMin;
  final String currentConditions;
  final String at;
  Texts({
    required this.outTemp,
    required this.dewpoint,
    required this.outHumidity,
    required this.heatindex,
    required this.barometer,
    required this.windSpeed,
    required this.windGust,
    required this.windDir,
    required this.windchill,
    required this.rainRate,
    required this.inTemp,
    required this.inHumidity,
    required this.outTempMax,
    required this.outTempMin,
    required this.dewpointMax,
    required this.dewpointMin,
    required this.outHumidityMax,
    required this.outHumidityMin,
    required this.barometerMax,
    required this.barometerMin,
    required this.windSpeedMax,
    required this.windGustMax,
    required this.rainRateMax,
    required this.rainTotal,
    required this.inTempMax,
    required this.inTempMin,
    required this.inHumidityMax,
    required this.inHumidityMin,
    required this.currentConditions,
    required this.at,
  });

  Texts copyWith({
    String? outTemp,
    String? dewpoint,
    String? outHumidity,
    String? heatindex,
    String? barometer,
    String? windSpeed,
    String? windGust,
    String? windDir,
    String? windchill,
    String? rainRate,
    String? inTemp,
    String? inHumidity,
    String? outTempMax,
    String? outTempMin,
    String? dewpointMax,
    String? dewpointMin,
    String? outHumidityMax,
    String? outHumidityMin,
    String? barometerMax,
    String? barometerMin,
    String? windSpeedMax,
    String? windGustMax,
    String? rainRateMax,
    String? rainTotal,
    String? inTempMax,
    String? inTempMin,
    String? inHumidityMax,
    String? inHumidityMin,
    String? currentConditions,
    String? at,
  }) {
    return Texts(
      outTemp: outTemp ?? this.outTemp,
      dewpoint: dewpoint ?? this.dewpoint,
      outHumidity: outHumidity ?? this.outHumidity,
      heatindex: heatindex ?? this.heatindex,
      barometer: barometer ?? this.barometer,
      windSpeed: windSpeed ?? this.windSpeed,
      windGust: windGust ?? this.windGust,
      windDir: windDir ?? this.windDir,
      windchill: windchill ?? this.windchill,
      rainRate: rainRate ?? this.rainRate,
      inTemp: inTemp ?? this.inTemp,
      inHumidity: inHumidity ?? this.inHumidity,
      outTempMax: outTempMax ?? this.outTempMax,
      outTempMin: outTempMin ?? this.outTempMin,
      dewpointMax: dewpointMax ?? this.dewpointMax,
      dewpointMin: dewpointMin ?? this.dewpointMin,
      outHumidityMax: outHumidityMax ?? this.outHumidityMax,
      outHumidityMin: outHumidityMin ?? this.outHumidityMin,
      barometerMax: barometerMax ?? this.barometerMax,
      barometerMin: barometerMin ?? this.barometerMin,
      windSpeedMax: windSpeedMax ?? this.windSpeedMax,
      windGustMax: windGustMax ?? this.windGustMax,
      rainRateMax: rainRateMax ?? this.rainRateMax,
      rainTotal: rainTotal ?? this.rainTotal,
      inTempMax: inTempMax ?? this.inTempMax,
      inTempMin: inTempMin ?? this.inTempMin,
      inHumidityMax: inHumidityMax ?? this.inHumidityMax,
      inHumidityMin: inHumidityMin ?? this.inHumidityMin,
      currentConditions: currentConditions ?? this.currentConditions,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'outTemp': outTemp,
      'dewpoint': dewpoint,
      'outHumidity': outHumidity,
      'heatindex': heatindex,
      'barometer': barometer,
      'windSpeed': windSpeed,
      'windGust': windGust,
      'windDir': windDir,
      'windchill': windchill,
      'rainRate': rainRate,
      'inTemp': inTemp,
      'inHumidity': inHumidity,
      'outTempMax': outTempMax,
      'outTempMin': outTempMin,
      'dewpointMax': dewpointMax,
      'dewpointMin': dewpointMin,
      'outHumidityMax': outHumidityMax,
      'outHumidityMin': outHumidityMin,
      'barometerMax': barometerMax,
      'barometerMin': barometerMin,
      'windSpeedMax': windSpeedMax,
      'windGustMax': windGustMax,
      'rainRateMax': rainRateMax,
      'rainTotal': rainTotal,
      'inTempMax': inTempMax,
      'inTempMin': inTempMin,
      'inHumidityMax': inHumidityMax,
      'inHumidityMin': inHumidityMin,
      'currentConditions': currentConditions,
      'at': at,
    };
  }

  factory Texts.fromMap(Map<String, dynamic> map) {
    return Texts(
      outTemp: map['outTemp'] ?? '',
      dewpoint: map['dewpoint'] ?? '',
      outHumidity: map['outHumidity'] ?? '',
      heatindex: map['heatindex'] ?? '',
      barometer: map['barometer'] ?? '',
      windSpeed: map['windSpeed'] ?? '',
      windGust: map['windGust'] ?? '',
      windDir: map['windDir'] ?? '',
      windchill: map['windchill'] ?? '',
      rainRate: map['rainRate'] ?? '',
      inTemp: map['inTemp'] ?? '',
      inHumidity: map['inHumidity'] ?? '',
      outTempMax: map['outTempMax'] ?? '',
      outTempMin: map['outTempMin'] ?? '',
      dewpointMax: map['dewpointMax'] ?? '',
      dewpointMin: map['dewpointMin'] ?? '',
      outHumidityMax: map['outHumidityMax'] ?? '',
      outHumidityMin: map['outHumidityMin'] ?? '',
      barometerMax: map['barometerMax'] ?? '',
      barometerMin: map['barometerMin'] ?? '',
      windSpeedMax: map['windSpeedMax'] ?? '',
      windGustMax: map['windGustMax'] ?? '',
      rainRateMax: map['rainRateMax'] ?? '',
      rainTotal: map['rainTotal'] ?? '',
      inTempMax: map['inTempMax'] ?? '',
      inTempMin: map['inTempMin'] ?? '',
      inHumidityMax: map['inHumidityMax'] ?? '',
      inHumidityMin: map['inHumidityMin'] ?? '',
      currentConditions: map['currentConditions'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Texts.fromJson(String source) => Texts.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Texts(outTemp: $outTemp, dewpoint: $dewpoint, outHumidity: $outHumidity, heatindex: $heatindex, barometer: $barometer, windSpeed: $windSpeed, windGust: $windGust, windDir: $windDir, windchill: $windchill, rainRate: $rainRate, inTemp: $inTemp, inHumidity: $inHumidity, outTempMax: $outTempMax, outTempMin: $outTempMin, dewpointMax: $dewpointMax, dewpointMin: $dewpointMin, outHumidityMax: $outHumidityMax, outHumidityMin: $outHumidityMin, barometerMax: $barometerMax, barometerMin: $barometerMin, windSpeedMax: $windSpeedMax, windGustMax: $windGustMax, rainRateMax: $rainRateMax, rainTotal: $rainTotal, inTempMax: $inTempMax, inTempMin: $inTempMin, inHumidityMax: $inHumidityMax, inHumidityMin: $inHumidityMin, currentConditions: $currentConditions, at: $at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Texts &&
        other.outTemp == outTemp &&
        other.dewpoint == dewpoint &&
        other.outHumidity == outHumidity &&
        other.heatindex == heatindex &&
        other.barometer == barometer &&
        other.windSpeed == windSpeed &&
        other.windGust == windGust &&
        other.windDir == windDir &&
        other.windchill == windchill &&
        other.rainRate == rainRate &&
        other.inTemp == inTemp &&
        other.inHumidity == inHumidity &&
        other.outTempMax == outTempMax &&
        other.outTempMin == outTempMin &&
        other.dewpointMax == dewpointMax &&
        other.dewpointMin == dewpointMin &&
        other.outHumidityMax == outHumidityMax &&
        other.outHumidityMin == outHumidityMin &&
        other.barometerMax == barometerMax &&
        other.barometerMin == barometerMin &&
        other.windSpeedMax == windSpeedMax &&
        other.windGustMax == windGustMax &&
        other.rainRateMax == rainRateMax &&
        other.rainTotal == rainTotal &&
        other.inTempMax == inTempMax &&
        other.inTempMin == inTempMin &&
        other.inHumidityMax == inHumidityMax &&
        other.inHumidityMin == inHumidityMin &&
        other.currentConditions == currentConditions &&
        other.at == at;
  }

  @override
  int get hashCode {
    return outTemp.hashCode ^
        dewpoint.hashCode ^
        outHumidity.hashCode ^
        heatindex.hashCode ^
        barometer.hashCode ^
        windSpeed.hashCode ^
        windGust.hashCode ^
        windDir.hashCode ^
        windchill.hashCode ^
        rainRate.hashCode ^
        inTemp.hashCode ^
        inHumidity.hashCode ^
        outTempMax.hashCode ^
        outTempMin.hashCode ^
        dewpointMax.hashCode ^
        dewpointMin.hashCode ^
        outHumidityMax.hashCode ^
        outHumidityMin.hashCode ^
        barometerMax.hashCode ^
        barometerMin.hashCode ^
        windSpeedMax.hashCode ^
        windGustMax.hashCode ^
        rainRateMax.hashCode ^
        rainTotal.hashCode ^
        inTempMax.hashCode ^
        inTempMin.hashCode ^
        inHumidityMax.hashCode ^
        inHumidityMin.hashCode ^
        currentConditions.hashCode ^
        at.hashCode;
  }
}
