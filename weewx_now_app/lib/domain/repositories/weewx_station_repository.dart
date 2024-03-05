import 'package:weewx_now/domain/entities/endpoint/endpoint.dart';
import 'package:weewx_now/domain/entities/image/image_bundle.dart';
import 'package:weewx_now/domain/entities/weather_records/weather_records_bundle.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/wee_wx_config.dart';
import 'package:weewx_now/domain/entities/weather_agg/weather_agg_bundle.dart';

abstract class WeewxStationRepository {
  Future<WeeWxConfig> loadSettings(Endpoint endpoint);
  Future<ImageBundle> loadImages(Endpoint endpoint);
  Future<WeatherRecordsBundle> loadWeatherRecords(Endpoint endpoint);
  Future<WeatherAggBundle> loadWeatherAgg(Endpoint endpoint);
}
