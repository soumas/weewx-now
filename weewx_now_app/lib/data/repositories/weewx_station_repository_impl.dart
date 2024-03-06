import 'package:dio/dio.dart';
import 'package:weewx_now/data/models/now_image_index_model.dart';
import 'package:weewx_now/data/models/now_station_settings_model.dart';
import 'package:weewx_now/data/models/now_weather_agg_model.dart';
import 'package:weewx_now/data/models/now_weather_records_model.dart';
import 'package:weewx_now/domain/entities/endpoint/endpoint.dart';
import 'package:weewx_now/domain/entities/weather_data/weather_data.dart';
import 'package:weewx_now/domain/repositories/weewx_station_repository.dart';

class WeewxStationRepositoryImpl extends WeewxStationRepository {
  WeewxStationRepositoryImpl({required this.http});

  final Dio http;

  @override
  Future<NowStationSettingsModel> loadSettings(Endpoint endpoint) async {
    final response = await http.get<String>('${endpoint.url}/nowStationSettings.json');
    return NowStationSettingsModel.fromJson(response.data!);
  }

  @override
  Future<WeatherData> loadWeatherData(Endpoint endpoint) async {
    final images = await http.get<String>('${endpoint.url}/nowImageIndex.json');
    final records = await http.get<String>('${endpoint.url}/nowWeatherRecords.json');
    final aggrecations = await http.get<String>('${endpoint.url}/nowWeatherAgg.json');
    return WeatherData();
  }
}
