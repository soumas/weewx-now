import 'package:dio/dio.dart';
import 'package:weewx_pwa/data/models/weather/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather();
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio http;

  WeatherRemoteDataSourceImpl({required this.http});

  @override
  Future<WeatherModel> getWeather() async {
    final response =
        await http.get<String>('http://localhost/weewx/webapp/weather.json');
    return WeatherModel.fromJson(response.data!);
  }
}
