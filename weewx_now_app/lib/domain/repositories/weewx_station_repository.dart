import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now/domain/entities/image/image_bundle.dart';
import 'package:weewx_now/domain/entities/weather_records/weather_records_bundle.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/wee_wx_config.dart';
import 'package:weewx_now/domain/entities/weather_agg/weather_agg_bundle.dart';

abstract class WeewxStationRepository {
  Future<WeeWxConfig> loadSettings(WeewxEndpoint endpoint);
  Future<ImageBundle> loadImages(WeewxEndpoint endpoint);
  Future<WeatherRecordsBundle> loadWeatherRecords(WeewxEndpoint endpoint);
  Future<WeatherAggBundle> loadWeatherAgg(WeewxEndpoint endpoint);
}
