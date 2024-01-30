import 'package:dio/dio.dart';
import 'package:weewx_now/data/models/images_model.dart';
import 'package:weewx_now/data/models/settings_model.dart';
import 'package:weewx_now/data/models/weather_model.dart';
import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint.dart';

abstract class WeewxStationDataSource {
  Future<SettingsModel> loadSettings(WeewxEndpoint endpoint);
  Future<WeatherModel> loadWeather(WeewxEndpoint endpoint);
  Future<ImagesModel> loadImages(WeewxEndpoint endpoint);
}

class WeewxStationDataSourceImpl implements WeewxStationDataSource {
  final Dio http;

  WeewxStationDataSourceImpl({required this.http});

  @override
  Future<SettingsModel> loadSettings(WeewxEndpoint endpoint) async {
    final response = await http.get<String>('${endpoint.url}/settings.json');
    return SettingsModel.fromJson(response.data!);
  }

  @override
  Future<WeatherModel> loadWeather(WeewxEndpoint endpoint) async {
    final response = await http.get<String>('${endpoint.url}/weather.json');
    return WeatherModel.fromJson(response.data!);
  }

  @override
  Future<ImagesModel> loadImages(WeewxEndpoint endpoint) async {
    final response = await http.get<String>('${endpoint.url}/images.json');
    return ImagesModel.fromJson(response.data!);
  }
}
