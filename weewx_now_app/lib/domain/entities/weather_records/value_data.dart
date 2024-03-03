import 'dart:convert';

class ValueData {
  final double value;
  final String units;
  ValueData({
    required this.value,
    required this.units,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueData && other.value == value && other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;

  ValueData copyWith({
    double? value,
    String? units,
  }) {
    return ValueData(
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

  factory ValueData.fromMap(Map<String, dynamic> map) {
    return ValueData(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ValueData.fromJson(String source) => ValueData.fromMap(json.decode(source));

  @override
  String toString() => 'ValueData(value: $value, units: $units)';
}
