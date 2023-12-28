class TextsEntity {
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
  TextsEntity({
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextsEntity &&
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
