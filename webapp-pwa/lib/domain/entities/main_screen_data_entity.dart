import 'package:weewx_pwa/domain/entities/image/images_entity.dart';
import 'package:weewx_pwa/domain/entities/settings/settings_entity.dart';
import 'package:weewx_pwa/domain/entities/weather/weather_data_entity.dart';

class MainScreenDataEntity {
  final SettingsEntity settings;
  final WeatherDataEntity weather;
  final ImagesEntity images;

  MainScreenDataEntity({
    required this.settings,
    required this.weather,
    required this.images,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MainScreenDataEntity &&
        other.weather == weather &&
        other.images == images;
  }

  @override
  int get hashCode => weather.hashCode ^ images.hashCode;
}
