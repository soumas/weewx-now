import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weewx_pwa/domain/entities/image/images_entity.dart';
import 'package:weewx_pwa/domain/entities/weather/weather_data_entity.dart';

part 'main_screen_data_entity.freezed.dart';

@freezed
class MainScreenDataEntity with _$MainScreenDataEntity {
  factory MainScreenDataEntity({
    required String stationname,
    required WeatherDataEntity weather,
    required ImagesEntity images,
  }) = _MainScreenDataEntity;
}
