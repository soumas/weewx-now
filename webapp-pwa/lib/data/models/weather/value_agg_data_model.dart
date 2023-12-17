import 'dart:convert';

import 'package:weewx_pwa/domain/entities/weather/value_agg_data_entity.dart';

class ValueAggDataModel {
  final String at;
  final double value;
  final String units;

  ValueAggDataModel({
    required this.at,
    required this.value,
    required this.units,
  });

  ValueAggDataEntity toEntity() {
    return ValueAggDataEntity(
      at: at,
      value: value,
      units: units,
    );
  }

  ValueAggDataModel copyWith({
    String? at,
    double? value,
    String? units,
  }) {
    return ValueAggDataModel(
      at: at ?? this.at,
      value: value ?? this.value,
      units: units ?? this.units,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'at': at,
      'value': value,
      'units': units,
    };
  }

  factory ValueAggDataModel.fromMap(Map<String, dynamic> map) {
    return ValueAggDataModel(
      at: map['at'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ValueAggDataModel.fromJson(String source) =>
      ValueAggDataModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ValueAggDataModel(at: $at, value: $value, units: $units)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueAggDataModel &&
        other.at == at &&
        other.value == value &&
        other.units == units;
  }

  @override
  int get hashCode => at.hashCode ^ value.hashCode ^ units.hashCode;
}
