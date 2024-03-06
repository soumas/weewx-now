import 'package:weewx_now/data/models/now_station_settings_model.dart';
import 'package:weewx_now/domain/entities/endpoint/endpoint.dart';
import 'package:weewx_now/domain/entities/weather_data/weather_data.dart';

abstract class WeewxStationRepository {
  Future<NowStationSettingsModel> loadSettings(Endpoint endpoint);
  Future<WeatherData> loadWeatherData(Endpoint endpoint);
}
