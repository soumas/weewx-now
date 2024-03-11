import 'package:weewx_now/domain/entities/weather_data/aggregations/aggregations.dart';
import 'package:weewx_now/domain/entities/weather_data/images/images_set.dart';
import 'package:weewx_now/domain/entities/weather_data/records/records_set.dart';

class WeatherData {
  Aggregations aggregations;
  RecordsSet records;
  ImagesSet images;
  WeatherData({
    required this.aggregations,
    required this.records,
    required this.images,
  });
}
