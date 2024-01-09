import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weewx_pwa/domain/entities/weather/value_data_entity.dart';

part 'weather_current_entity.freezed.dart';

@freezed
class WeatherCurrentEntity with _$WeatherCurrentEntity {
  factory WeatherCurrentEntity({
    required DateTime generation,
    required ValueDataEntity temperature,
    required ValueDataEntity dewpoint,
    required ValueDataEntity humidity,
    required ValueDataEntity heatIndex,
    required ValueDataEntity barometer,
    required ValueDataEntity windSpeed,
    required ValueDataEntity windGust,
    required ValueDataEntity windDirection,
    required ValueDataEntity windChill,
    required ValueDataEntity rainRate,
    required ValueDataEntity insideTemperature,
    required ValueDataEntity insideHumidity,
  }) = _WeatherCurrentEntity;
}
