import 'dart:convert';

import 'package:weewx_now/domain/entities/weather_records/short_term_value.dart';

class ShortTerm {
  final ShortTermValue windSpeed;
  final ShortTermValue windGust;
  final ShortTermValue windDir;
  final ShortTermValue outTemp;
  final ShortTermValue barometer;
  final ShortTermValue rainRate;
  ShortTerm({
    required this.windSpeed,
    required this.windGust,
    required this.windDir,
    required this.outTemp,
    required this.barometer,
    required this.rainRate,
  });

  ShortTerm copyWith({
    ShortTermValue? windSpeed,
    ShortTermValue? windGust,
    ShortTermValue? windDir,
    ShortTermValue? outTemp,
    ShortTermValue? barometer,
    ShortTermValue? rainRate,
  }) {
    return ShortTerm(
      windSpeed: windSpeed ?? this.windSpeed,
      windGust: windGust ?? this.windGust,
      windDir: windDir ?? this.windDir,
      outTemp: outTemp ?? this.outTemp,
      barometer: barometer ?? this.barometer,
      rainRate: rainRate ?? this.rainRate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'windSpeed': windSpeed.toMap(),
      'windGust': windGust.toMap(),
      'windDir': windDir.toMap(),
      'outTemp': outTemp.toMap(),
      'barometer': barometer.toMap(),
      'rainRate': rainRate.toMap(),
    };
  }

  factory ShortTerm.fromMap(Map<String, dynamic> map) {
    return ShortTerm(
      windSpeed: ShortTermValue.fromMap(map['windSpeed']),
      windGust: ShortTermValue.fromMap(map['windGust']),
      windDir: ShortTermValue.fromMap(map['windDir']),
      outTemp: ShortTermValue.fromMap(map['outTemp']),
      barometer: ShortTermValue.fromMap(map['barometer']),
      rainRate: ShortTermValue.fromMap(map['rainRate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortTerm.fromJson(String source) => ShortTerm.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShortTerm(windSpeed: $windSpeed, windGust: $windGust, windDir: $windDir, outTemp: $outTemp, barometer: $barometer, rainRate: $rainRate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShortTerm &&
        other.windSpeed == windSpeed &&
        other.windGust == windGust &&
        other.windDir == windDir &&
        other.outTemp == outTemp &&
        other.barometer == barometer &&
        other.rainRate == rainRate;
  }

  @override
  int get hashCode {
    return windSpeed.hashCode ^ windGust.hashCode ^ windDir.hashCode ^ outTemp.hashCode ^ barometer.hashCode ^ rainRate.hashCode;
  }
}
