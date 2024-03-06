import 'package:weewx_now/domain/entities/weather_data/aggregations/aggregation_value.dart';
import 'package:weewx_now/domain/entities/weather_data/aggregations/aggregation_period.dart';

class Aggregations {
  DateTime generation;
  Map<AggregationPeriod, List<AggregationValue>> values;
  Aggregations({
    required this.generation,
    required this.values,
  });
}
