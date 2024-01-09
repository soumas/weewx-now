import 'package:freezed_annotation/freezed_annotation.dart';

part 'texts_entity.freezed.dart';

@freezed
class TextsEntity with _$TextsEntity {
  factory TextsEntity({
    required String outTemp,
    required String dewpoint,
    required String outHumidity,
    required String heatindex,
    required String barometer,
    required String windSpeed,
    required String windGust,
    required String windDir,
    required String windchill,
    required String rainRate,
    required String inTemp,
    required String inHumidity,
    required String outTempMax,
    required String outTempMin,
    required String dewpointMax,
    required String dewpointMin,
    required String outHumidityMax,
    required String outHumidityMin,
    required String barometerMax,
    required String barometerMin,
    required String windSpeedMax,
    required String windGustMax,
    required String rainRateMax,
    required String rainTotal,
    required String inTempMax,
    required String inTempMin,
    required String inHumidityMax,
    required String inHumidityMin,
    required String currentConditions,
    required String at,
  }) = _TextsEntity;
}
