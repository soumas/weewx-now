import 'dart:convert';

import 'package:weewx_pwa/data/models/weather/value_agg_data_model.dart';
import 'package:weewx_pwa/domain/entities/weather/weather_aggregation_entity.dart';

class WeatherAggregationModel {
  final ValueAggDataModel maxTemperature;
  final ValueAggDataModel minTemperature;
  final ValueAggDataModel maxDewpoint;
  final ValueAggDataModel minDewpoint;
  final ValueAggDataModel maxHumidity;
  final ValueAggDataModel minHumidity;
  final ValueAggDataModel maxBarometer;
  final ValueAggDataModel minBarometer;
  final ValueAggDataModel maxWindSpeed;
  final ValueAggDataModel maxWindGust;
  final ValueAggDataModel maxRainRate;
  final ValueAggDataModel rainTotal;
  final ValueAggDataModel maxInsideTemperature;
  final ValueAggDataModel minInsideTemperature;
  final ValueAggDataModel maxInsideHumidity;
  final ValueAggDataModel minInsideHumidity;

  WeatherAggregationModel({
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

  WeatherAggregationEntity toEntity() {
    return WeatherAggregationEntity(
      maxTemperature: maxTemperature.toEntity(),
      minTemperature: minTemperature.toEntity(),
      maxDewpoint: maxDewpoint.toEntity(),
      minDewpoint: minDewpoint.toEntity(),
      maxHumidity: maxHumidity.toEntity(),
      minHumidity: minHumidity.toEntity(),
      maxBarometer: maxBarometer.toEntity(),
      minBarometer: minBarometer.toEntity(),
      maxWindSpeed: maxWindSpeed.toEntity(),
      maxWindGust: maxWindGust.toEntity(),
      maxRainRate: maxRainRate.toEntity(),
      rainTotal: rainTotal.toEntity(),
      maxInsideTemperature: maxInsideTemperature.toEntity(),
      minInsideTemperature: minInsideTemperature.toEntity(),
      maxInsideHumidity: maxInsideHumidity.toEntity(),
      minInsideHumidity: minInsideHumidity.toEntity(),
    );
  }

  WeatherAggregationModel copyWith({
    ValueAggDataModel? maxTemperature,
    ValueAggDataModel? minTemperature,
    ValueAggDataModel? maxDewpoint,
    ValueAggDataModel? minDewpoint,
    ValueAggDataModel? maxHumidity,
    ValueAggDataModel? minHumidity,
    ValueAggDataModel? maxBarometer,
    ValueAggDataModel? minBarometer,
    ValueAggDataModel? maxWindSpeed,
    ValueAggDataModel? maxWindGust,
    ValueAggDataModel? maxRainRate,
    ValueAggDataModel? rainTotal,
    ValueAggDataModel? maxInsideTemperature,
    ValueAggDataModel? minInsideTemperature,
    ValueAggDataModel? maxInsideHumidity,
    ValueAggDataModel? minInsideHumidity,
  }) {
    return WeatherAggregationModel(
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

  factory WeatherAggregationModel.fromMap(Map<String, dynamic> map) {
    return WeatherAggregationModel(
      maxTemperature: ValueAggDataModel.fromMap(map['maxTemperature']),
      minTemperature: ValueAggDataModel.fromMap(map['minTemperature']),
      maxDewpoint: ValueAggDataModel.fromMap(map['maxDewpoint']),
      minDewpoint: ValueAggDataModel.fromMap(map['minDewpoint']),
      maxHumidity: ValueAggDataModel.fromMap(map['maxHumidity']),
      minHumidity: ValueAggDataModel.fromMap(map['minHumidity']),
      maxBarometer: ValueAggDataModel.fromMap(map['maxBarometer']),
      minBarometer: ValueAggDataModel.fromMap(map['minBarometer']),
      maxWindSpeed: ValueAggDataModel.fromMap(map['maxWindSpeed']),
      maxWindGust: ValueAggDataModel.fromMap(map['maxWindGust']),
      maxRainRate: ValueAggDataModel.fromMap(map['maxRainRate']),
      rainTotal: ValueAggDataModel.fromMap(map['rainTotal']),
      maxInsideTemperature:
          ValueAggDataModel.fromMap(map['maxInsideTemperature']),
      minInsideTemperature:
          ValueAggDataModel.fromMap(map['minInsideTemperature']),
      maxInsideHumidity: ValueAggDataModel.fromMap(map['maxInsideHumidity']),
      minInsideHumidity: ValueAggDataModel.fromMap(map['minInsideHumidity']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherAggregationModel.fromJson(String source) =>
      WeatherAggregationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeatherAggregationModel(maxTemperature: $maxTemperature, minTemperature: $minTemperature, maxDewpoint: $maxDewpoint, minDewpoint: $minDewpoint, maxHumidity: $maxHumidity, minHumidity: $minHumidity, maxBarometer: $maxBarometer, minBarometer: $minBarometer, maxWindSpeed: $maxWindSpeed, maxWindGust: $maxWindGust, maxRainRate: $maxRainRate, rainTotal: $rainTotal, maxInsideTemperature: $maxInsideTemperature, minInsideTemperature: $minInsideTemperature, maxInsideHumidity: $maxInsideHumidity, minInsideHumidity: $minInsideHumidity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherAggregationModel &&
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
}
