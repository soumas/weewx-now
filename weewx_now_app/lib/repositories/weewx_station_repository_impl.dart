import 'package:dio/dio.dart';
import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now/domain/entities/image/image_bundle.dart';
import 'package:weewx_now/domain/entities/weather_records/weather_records_bundle.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/wee_wx_config.dart';
import 'package:weewx_now/domain/entities/weather_agg/weather_agg_bundle.dart';
import 'package:weewx_now/domain/repositories/weewx_station_repository.dart';

class WeewxStationRepositoryImpl extends WeewxStationRepository {
  WeewxStationRepositoryImpl({required this.http});

  final Dio http;

  @override
  Future<WeeWxConfig> loadSettings(WeewxEndpoint endpoint) async {
    final response = await http.get<String>('${endpoint.url}/nowStationSettings.json');
    return WeeWxConfig.fromJson(response.data!);
  }

  @override
  Future<ImageBundle> loadImages(WeewxEndpoint endpoint) async {
    final response = await http.get<String>('${endpoint.url}/nowImageIndex.json');
    return ImageBundle.fromJson(response.data!);
  }

  @override
  Future<WeatherRecordsBundle> loadWeatherRecords(WeewxEndpoint endpoint) async {
    final response = await http.get<String>('${endpoint.url}/nowWeatherRecords.json');
    return WeatherRecordsBundle.fromJson(response.data!);
  }

  @override
  Future<WeatherAggBundle> loadWeatherAgg(WeewxEndpoint endpoint) async {
    final response = await http.get<String>('${endpoint.url}/nowWeatherAgg.json');
    return WeatherAggBundle.fromJson(response.data!);
  }
}
