import 'package:dio/dio.dart';
import 'package:weewx_now_app/data/models/images_model.dart';
import 'package:weewx_now_app/data/models/settings_model.dart';
import 'package:weewx_now_app/data/models/weather_model.dart';
import 'package:weewx_now_app/domain/entities/endpoint/weewx_endpoint_entity.dart';

abstract class WeewxStationDataSource {
  Future<SettingsModel> loadSettings(WeewxEndpointEntity endpoint);
  Future<WeatherModel> loadWeather(WeewxEndpointEntity endpoint);
  Future<ImagesModel> loadImages(WeewxEndpointEntity endpoint);
}

class WeewxStationDataSourceImpl implements WeewxStationDataSource {
  final Dio http;

  WeewxStationDataSourceImpl({required this.http});

  @override
  Future<SettingsModel> loadSettings(WeewxEndpointEntity endpoint) async {
    final response = await http.get<String>('${endpoint.url}/settings.json');
    return SettingsModel.fromJson(response.data!);
  }

  @override
  Future<WeatherModel> loadWeather(WeewxEndpointEntity endpoint) async {
    final response = await http.get<String>('${endpoint.url}/weather.json');
    return WeatherModel.fromJson(response.data!);
  }

  @override
  Future<ImagesModel> loadImages(WeewxEndpointEntity endpoint) async {
    final response = await http.get<String>('${endpoint.url}/images.json');
    return ImagesModel.fromJson(response.data!);
  }
}
