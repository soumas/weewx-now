import 'dart:convert';

import 'package:weewx_now/domain/entities/weather_records/current_value.dart';

class Current {
  final int dateTime;
  final CurrentValue outTemp;
  final CurrentValue dewpoint;
  final CurrentValue outHumidity;
  final CurrentValue heatindex;
  final CurrentValue barometer;
  final CurrentValue windSpeed;
  final CurrentValue windGust;
  final CurrentValue windDir;
  final CurrentValue windchill;
  final CurrentValue rainRate;
  final CurrentValue inTemp;
  final CurrentValue inHumidity;
  Current({
    required this.dateTime,
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
  });

  Current copyWith({
    int? dateTime,
    CurrentValue? outTemp,
    CurrentValue? dewpoint,
    CurrentValue? outHumidity,
    CurrentValue? heatindex,
    CurrentValue? barometer,
    CurrentValue? windSpeed,
    CurrentValue? windGust,
    CurrentValue? windDir,
    CurrentValue? windchill,
    CurrentValue? rainRate,
    CurrentValue? inTemp,
    CurrentValue? inHumidity,
  }) {
    return Current(
      dateTime: dateTime ?? this.dateTime,
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
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dateTime': dateTime,
      'outTemp': outTemp.toMap(),
      'dewpoint': dewpoint.toMap(),
      'outHumidity': outHumidity.toMap(),
      'heatindex': heatindex.toMap(),
      'barometer': barometer.toMap(),
      'windSpeed': windSpeed.toMap(),
      'windGust': windGust.toMap(),
      'windDir': windDir.toMap(),
      'windchill': windchill.toMap(),
      'rainRate': rainRate.toMap(),
      'inTemp': inTemp.toMap(),
      'inHumidity': inHumidity.toMap(),
    };
  }

  factory Current.fromMap(Map<String, dynamic> map) {
    return Current(
      dateTime: map['dateTime']?.toInt() ?? 0,
      outTemp: CurrentValue.fromMap(map['outTemp']),
      dewpoint: CurrentValue.fromMap(map['dewpoint']),
      outHumidity: CurrentValue.fromMap(map['outHumidity']),
      heatindex: CurrentValue.fromMap(map['heatindex']),
      barometer: CurrentValue.fromMap(map['barometer']),
      windSpeed: CurrentValue.fromMap(map['windSpeed']),
      windGust: CurrentValue.fromMap(map['windGust']),
      windDir: CurrentValue.fromMap(map['windDir']),
      windchill: CurrentValue.fromMap(map['windchill']),
      rainRate: CurrentValue.fromMap(map['rainRate']),
      inTemp: CurrentValue.fromMap(map['inTemp']),
      inHumidity: CurrentValue.fromMap(map['inHumidity']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Current.fromJson(String source) => Current.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Current(dateTime: $dateTime, outTemp: $outTemp, dewpoint: $dewpoint, outHumidity: $outHumidity, heatindex: $heatindex, barometer: $barometer, windSpeed: $windSpeed, windGust: $windGust, windDir: $windDir, windchill: $windchill, rainRate: $rainRate, inTemp: $inTemp, inHumidity: $inHumidity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Current &&
        other.dateTime == dateTime &&
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
        other.inHumidity == inHumidity;
  }

  @override
  int get hashCode {
    return dateTime.hashCode ^
        outTemp.hashCode ^
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
        inHumidity.hashCode;
  }
}
