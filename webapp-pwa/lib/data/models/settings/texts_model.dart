import 'dart:convert';

import 'package:weewx_pwa/domain/entities/settings/texts_entity.dart';

class TextsModel {
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

  TextsModel({
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

  TextsEntity toEntity() {
    return TextsEntity(
      outTemp: outTemp,
      dewpoint: dewpoint,
      outHumidity: outHumidity,
      heatindex: heatindex,
      barometer: barometer,
      windSpeed: windSpeed,
      windGust: windGust,
      windDir: windDir,
      windchill: windchill,
      rainRate: rainRate,
      inTemp: inTemp,
      inHumidity: inHumidity,
      outTempMax: outTempMax,
      outTempMin: outTempMin,
      dewpointMax: dewpointMax,
      dewpointMin: dewpointMin,
      outHumidityMax: outHumidityMax,
      outHumidityMin: outHumidityMin,
      barometerMax: barometerMax,
      barometerMin: barometerMin,
      windSpeedMax: windSpeedMax,
      windGustMax: windGustMax,
      rainRateMax: rainRateMax,
      rainTotal: rainTotal,
      inTempMax: inTempMax,
      inTempMin: inTempMin,
      inHumidityMax: inHumidityMax,
      inHumidityMin: inHumidityMin,
      currentConditions: currentConditions,
      at: at,
    );
  }

  TextsModel copyWith({
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
    return TextsModel(
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

  factory TextsModel.fromMap(Map<String, dynamic> map) {
    return TextsModel(
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

  factory TextsModel.fromJson(String source) =>
      TextsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TextsModel(outTemp: $outTemp, dewpoint: $dewpoint, outHumidity: $outHumidity, heatindex: $heatindex, barometer: $barometer, windSpeed: $windSpeed, windGust: $windGust, windDir: $windDir, windchill: $windchill, rainRate: $rainRate, inTemp: $inTemp, inHumidity: $inHumidity, outTempMax: $outTempMax, outTempMin: $outTempMin, dewpointMax: $dewpointMax, dewpointMin: $dewpointMin, outHumidityMax: $outHumidityMax, outHumidityMin: $outHumidityMin, barometerMax: $barometerMax, barometerMin: $barometerMin, windSpeedMax: $windSpeedMax, windGustMax: $windGustMax, rainRateMax: $rainRateMax, rainTotal: $rainTotal, inTempMax: $inTempMax, inTempMin: $inTempMin, inHumidityMax: $inHumidityMax, inHumidityMin: $inHumidityMin, currentConditions: $currentConditions, at: $at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextsModel &&
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
