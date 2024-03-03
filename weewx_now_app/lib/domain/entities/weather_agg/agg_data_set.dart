import 'dart:convert';

import 'package:weewx_now/domain/entities/weather_agg/agg_data_entry.dart';

class AggDataSet {
  final AggDataEntry maxTemperature;
  final AggDataEntry minTemperature;
  final AggDataEntry maxDewpoint;
  final AggDataEntry minDewpoint;
  final AggDataEntry maxHumidity;
  final AggDataEntry minHumidity;
  final AggDataEntry maxBarometer;
  final AggDataEntry minBarometer;
  final AggDataEntry maxWindSpeed;
  final AggDataEntry maxWindGust;
  final AggDataEntry maxRainRate;
  final AggDataEntry rainTotal;
  final AggDataEntry maxInsideTemperature;
  final AggDataEntry minInsideTemperature;
  final AggDataEntry maxInsideHumidity;
  final AggDataEntry minInsideHumidity;
  AggDataSet({
    required this.maxTemperature,
    required this.minTemperature,
    required this.maxDewpoint,
    required this.minDewpoint,
    required this.maxHumidity,
    required this.minHumidity,
    required this.maxBarometer,
    required this.minBarometer,
    required this.maxWindSpeed,
    required this.maxWindGust,
    required this.maxRainRate,
    required this.rainTotal,
    required this.maxInsideTemperature,
    required this.minInsideTemperature,
    required this.maxInsideHumidity,
    required this.minInsideHumidity,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AggDataSet &&
        other.maxTemperature == maxTemperature &&
        other.minTemperature == minTemperature &&
        other.maxDewpoint == maxDewpoint &&
        other.minDewpoint == minDewpoint &&
        other.maxHumidity == maxHumidity &&
        other.minHumidity == minHumidity &&
        other.maxBarometer == maxBarometer &&
        other.minBarometer == minBarometer &&
        other.maxWindSpeed == maxWindSpeed &&
        other.maxWindGust == maxWindGust &&
        other.maxRainRate == maxRainRate &&
        other.rainTotal == rainTotal &&
        other.maxInsideTemperature == maxInsideTemperature &&
        other.minInsideTemperature == minInsideTemperature &&
        other.maxInsideHumidity == maxInsideHumidity &&
        other.minInsideHumidity == minInsideHumidity;
  }

  @override
  int get hashCode {
    return maxTemperature.hashCode ^
        minTemperature.hashCode ^
        maxDewpoint.hashCode ^
        minDewpoint.hashCode ^
        maxHumidity.hashCode ^
        minHumidity.hashCode ^
        maxBarometer.hashCode ^
        minBarometer.hashCode ^
        maxWindSpeed.hashCode ^
        maxWindGust.hashCode ^
        maxRainRate.hashCode ^
        rainTotal.hashCode ^
        maxInsideTemperature.hashCode ^
        minInsideTemperature.hashCode ^
        maxInsideHumidity.hashCode ^
        minInsideHumidity.hashCode;
  }

  AggDataSet copyWith({
    AggDataEntry? maxTemperature,
    AggDataEntry? minTemperature,
    AggDataEntry? maxDewpoint,
    AggDataEntry? minDewpoint,
    AggDataEntry? maxHumidity,
    AggDataEntry? minHumidity,
    AggDataEntry? maxBarometer,
    AggDataEntry? minBarometer,
    AggDataEntry? maxWindSpeed,
    AggDataEntry? maxWindGust,
    AggDataEntry? maxRainRate,
    AggDataEntry? rainTotal,
    AggDataEntry? maxInsideTemperature,
    AggDataEntry? minInsideTemperature,
    AggDataEntry? maxInsideHumidity,
    AggDataEntry? minInsideHumidity,
  }) {
    return AggDataSet(
      maxTemperature: maxTemperature ?? this.maxTemperature,
      minTemperature: minTemperature ?? this.minTemperature,
      maxDewpoint: maxDewpoint ?? this.maxDewpoint,
      minDewpoint: minDewpoint ?? this.minDewpoint,
      maxHumidity: maxHumidity ?? this.maxHumidity,
      minHumidity: minHumidity ?? this.minHumidity,
      maxBarometer: maxBarometer ?? this.maxBarometer,
      minBarometer: minBarometer ?? this.minBarometer,
      maxWindSpeed: maxWindSpeed ?? this.maxWindSpeed,
      maxWindGust: maxWindGust ?? this.maxWindGust,
      maxRainRate: maxRainRate ?? this.maxRainRate,
      rainTotal: rainTotal ?? this.rainTotal,
      maxInsideTemperature: maxInsideTemperature ?? this.maxInsideTemperature,
      minInsideTemperature: minInsideTemperature ?? this.minInsideTemperature,
      maxInsideHumidity: maxInsideHumidity ?? this.maxInsideHumidity,
      minInsideHumidity: minInsideHumidity ?? this.minInsideHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'maxTemperature': maxTemperature.toMap(),
      'minTemperature': minTemperature.toMap(),
      'maxDewpoint': maxDewpoint.toMap(),
      'minDewpoint': minDewpoint.toMap(),
      'maxHumidity': maxHumidity.toMap(),
      'minHumidity': minHumidity.toMap(),
      'maxBarometer': maxBarometer.toMap(),
      'minBarometer': minBarometer.toMap(),
      'maxWindSpeed': maxWindSpeed.toMap(),
      'maxWindGust': maxWindGust.toMap(),
      'maxRainRate': maxRainRate.toMap(),
      'rainTotal': rainTotal.toMap(),
      'maxInsideTemperature': maxInsideTemperature.toMap(),
      'minInsideTemperature': minInsideTemperature.toMap(),
      'maxInsideHumidity': maxInsideHumidity.toMap(),
      'minInsideHumidity': minInsideHumidity.toMap(),
    };
  }

  factory AggDataSet.fromMap(Map<String, dynamic> map) {
    return AggDataSet(
      maxTemperature: AggDataEntry.fromMap(map['maxTemperature']),
      minTemperature: AggDataEntry.fromMap(map['minTemperature']),
      maxDewpoint: AggDataEntry.fromMap(map['maxDewpoint']),
      minDewpoint: AggDataEntry.fromMap(map['minDewpoint']),
      maxHumidity: AggDataEntry.fromMap(map['maxHumidity']),
      minHumidity: AggDataEntry.fromMap(map['minHumidity']),
      maxBarometer: AggDataEntry.fromMap(map['maxBarometer']),
      minBarometer: AggDataEntry.fromMap(map['minBarometer']),
      maxWindSpeed: AggDataEntry.fromMap(map['maxWindSpeed']),
      maxWindGust: AggDataEntry.fromMap(map['maxWindGust']),
      maxRainRate: AggDataEntry.fromMap(map['maxRainRate']),
      rainTotal: AggDataEntry.fromMap(map['rainTotal']),
      maxInsideTemperature: AggDataEntry.fromMap(map['maxInsideTemperature']),
      minInsideTemperature: AggDataEntry.fromMap(map['minInsideTemperature']),
      maxInsideHumidity: AggDataEntry.fromMap(map['maxInsideHumidity']),
      minInsideHumidity: AggDataEntry.fromMap(map['minInsideHumidity']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AggDataSet.fromJson(String source) => AggDataSet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeatherAggregation(maxTemperature: $maxTemperature, minTemperature: $minTemperature, maxDewpoint: $maxDewpoint, minDewpoint: $minDewpoint, maxHumidity: $maxHumidity, minHumidity: $minHumidity, maxBarometer: $maxBarometer, minBarometer: $minBarometer, maxWindSpeed: $maxWindSpeed, maxWindGust: $maxWindGust, maxRainRate: $maxRainRate, rainTotal: $rainTotal, maxInsideTemperature: $maxInsideTemperature, minInsideTemperature: $minInsideTemperature, maxInsideHumidity: $maxInsideHumidity, minInsideHumidity: $minInsideHumidity)';
  }
}
