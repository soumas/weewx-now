import 'dart:convert';

import 'package:weewx_pwa/domain/entities/weather/value_data_entity.dart';

class ValueDataModel {
  final double value;
  final String units;

  ValueDataModel({
    required this.value,
    required this.units,
  });

  ValueDataEntity toEntity() {
    return ValueDataEntity(
      value: value,
      units: units,
    );
  }

  ValueDataModel copyWith({
    double? value,
    String? units,
  }) {
    return ValueDataModel(
      value: value ?? this.value,
      units: units ?? this.units,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
    };
  }

  factory ValueDataModel.fromMap(Map<String, dynamic> map) {
    return ValueDataModel(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ValueDataModel.fromJson(String source) =>
      ValueDataModel.fromMap(json.decode(source));

  @override
  String toString() => 'ValueDataModel(value: $value, units: $units)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueDataModel &&
        other.value == value &&
        other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;
}
