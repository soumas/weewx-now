import 'package:weewx_pwa/domain/entities/value_data.dart';

class ValueAggData extends ValueData {
  final String at;

  ValueAggData({
    required super.value,
    required super.units,
    required this.at,
  });
}
