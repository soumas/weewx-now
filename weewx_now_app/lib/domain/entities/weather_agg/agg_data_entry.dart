import 'dart:convert';

class AggDataEntry {
  final String at;
  final double value;
  final String units;
  AggDataEntry({
    required this.at,
    required this.value,
    required this.units,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AggDataEntry && other.at == at && other.value == value && other.units == units;
  }

  @override
  int get hashCode => at.hashCode ^ value.hashCode ^ units.hashCode;

  AggDataEntry copyWith({
    String? at,
    double? value,
    String? units,
  }) {
    return AggDataEntry(
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

  factory AggDataEntry.fromMap(Map<String, dynamic> map) {
    return AggDataEntry(
      at: map['at'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AggDataEntry.fromJson(String source) => AggDataEntry.fromMap(json.decode(source));

  @override
  String toString() => 'ValueAggData(at: $at, value: $value, units: $units)';
}
