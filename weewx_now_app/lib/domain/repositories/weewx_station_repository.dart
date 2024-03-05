import 'package:weewx_now/domain/entities/endpoint/endpoint.dart';
import 'package:weewx_now/domain/entities/image/image_bundle.dart';
import 'package:weewx_now/domain/entities/station_settings/station_settings.dart';
import 'package:weewx_now/domain/entities/weather_records/weather_records.dart';
import 'package:weewx_now/domain/entities/weather_agg/weather_agg_bundle.dart';

abstract class WeewxStationRepository {
  Future<StationSettings> loadSettings(Endpoint endpoint);
  Future<ImageBundle> loadImages(Endpoint endpoint);
  Future<WeatherRecords> loadWeatherRecords(Endpoint endpoint);
  Future<WeatherAggBundle> loadWeatherAgg(Endpoint endpoint);
}
