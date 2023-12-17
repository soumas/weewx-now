import 'package:weewx_pwa/data/datasources/weather_remote_data_source.dart';
import 'package:weewx_pwa/domain/entities/weather/weather_entity.dart';
import 'package:weewx_pwa/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource dataSource;

  WeatherRepositoryImpl({required this.dataSource});

  @override
  Future<WeatherEntity> loadWeather() async {
    return (await dataSource.getWeather()).toEntity();
  }
}
