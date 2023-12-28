import 'package:dio/dio.dart';
import 'package:weewx_pwa/data/models/image/images_model.dart';
import 'package:weewx_pwa/data/models/settings/settings_model.dart';
import 'package:weewx_pwa/data/models/weather/weather_model.dart';

abstract class WeewxStationDataSource {
  Future<SettingsModel> loadSettings(String endpoint);
  Future<WeatherModel> loadWeather(String endpoint);
  Future<ImagesModel> loadImages(String endpoint);
}

class WeewxStationDataSourceImpl implements WeewxStationDataSource {
  final Dio http;

  WeewxStationDataSourceImpl({required this.http});

  @override
  Future<SettingsModel> loadSettings(String endpoint) async {
    final response = await http.get<String>('$endpoint/settings.json');
    return SettingsModel.fromJson(response.data!);
  }

  @override
  Future<WeatherModel> loadWeather(String endpoint) async {
    final response = await http.get<String>('$endpoint/weather.json');
    return WeatherModel.fromJson(response.data!);
  }

  @override
  Future<ImagesModel> loadImages(String endpoint) async {
    final response = await http.get<String>('$endpoint/images.json');
    return ImagesModel.fromJson(response.data!);
  }
}
