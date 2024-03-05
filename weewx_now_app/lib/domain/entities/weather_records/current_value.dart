import 'dart:convert';

class CurrentValue {
  final String label;
  final double value;
  final String unitformat;
  final String unitlabel;
  CurrentValue({
    required this.label,
    required this.value,
    required this.unitformat,
    required this.unitlabel,
  });

  CurrentValue copyWith({
    String? label,
    double? value,
    String? unitformat,
    String? unitlabel,
  }) {
    return CurrentValue(
      label: label ?? this.label,
      value: value ?? this.value,
      unitformat: unitformat ?? this.unitformat,
      unitlabel: unitlabel ?? this.unitlabel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
      'unitformat': unitformat,
      'unitlabel': unitlabel,
    };
  }

  factory CurrentValue.fromMap(Map<String, dynamic> map) {
    return CurrentValue(
      label: map['label'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      unitformat: map['unitformat'] ?? '',
      unitlabel: map['unitlabel'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentValue.fromJson(String source) => CurrentValue.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Dewpoint(label: $label, value: $value, unitformat: $unitformat, unitlabel: $unitlabel)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrentValue && other.label == label && other.value == value && other.unitformat == unitformat && other.unitlabel == unitlabel;
  }

  @override
  int get hashCode {
    return label.hashCode ^ value.hashCode ^ unitformat.hashCode ^ unitlabel.hashCode;
  }
}
