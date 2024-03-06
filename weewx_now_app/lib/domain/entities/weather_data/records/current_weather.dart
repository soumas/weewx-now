import 'package:weewx_now/domain/entities/weather_data/records/current_weather_value.dart';

class CurrentWeather {
  DateTime dateTime;
  List<CurrentWeatherValue> values;
  CurrentWeather({
    required this.dateTime,
    required this.values,
  });
}
