import 'package:dio/dio.dart';
import 'package:weewx_now/data/models/now_image_index_model.dart';
import 'package:weewx_now/data/models/now_image_index_model_ext.dart';
import 'package:weewx_now/data/models/now_station_settings_model.dart';
import 'package:weewx_now/data/models/now_weather_agg_model.dart';
import 'package:weewx_now/data/models/now_weather_agg_model_ext.dart';
import 'package:weewx_now/data/models/now_weather_records_model.dart';
import 'package:weewx_now/data/models/now_weather_records_model_ext.dart';
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
    final aggModel = NowWeatherAggModel.fromJson(await _fetch(endpoint, 'nowWeatherAgg.json'));
    final imgModel = NowImageIndexModel.fromJson(await _fetch(endpoint, 'nowImageIndex.json'));
    final recModel = NowWeatherRecordsModel.fromJson(await _fetch(endpoint, 'nowWeatherRecords.json'));
    return WeatherData(
      aggregations: aggModel.toEntity(),
      images: imgModel.toEntity(),
      records: recModel.toEntity(),
    );
  }

  Future<String> _fetch(Endpoint endpoint, String path) async {
    final response = await http.get<String>('${endpoint.url}/$path');
    return response.data!;
  }
}
