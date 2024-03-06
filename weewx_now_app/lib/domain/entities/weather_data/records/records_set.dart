import 'package:weewx_now/domain/entities/weather_data/records/current_weather.dart';
import 'package:weewx_now/domain/entities/weather_data/records/short_term_weather.dart';

class RecordsSet {
  DateTime generation;
  CurrentWeather current;
  List<ShortTermWeather> shortTerm;
  RecordsSet({
    required this.generation,
    required this.current,
    required this.shortTerm,
  });
}
