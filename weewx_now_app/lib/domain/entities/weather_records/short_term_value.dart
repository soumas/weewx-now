import 'dart:convert';

import 'package:flutter/foundation.dart';

class ShortTermValue {
  final String label;
  final String unitlabel;
  final String unitformat;
  final Map<int, double> last2hours;
  final Map<int, double> last4hours;
  final Map<int, double> last8hours;
  ShortTermValue({
    required this.label,
    required this.unitlabel,
    required this.unitformat,
    required this.last2hours,
    required this.last4hours,
    required this.last8hours,
  });

  ShortTermValue copyWith({
    String? label,
    String? unitlabel,
    String? unitformat,
    Map<int, double>? last2hours,
    Map<int, double>? last4hours,
    Map<int, double>? last8hours,
  }) {
    return ShortTermValue(
      label: label ?? this.label,
      unitlabel: unitlabel ?? this.unitlabel,
      unitformat: unitformat ?? this.unitformat,
      last2hours: last2hours ?? this.last2hours,
      last4hours: last4hours ?? this.last4hours,
      last8hours: last8hours ?? this.last8hours,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'unitlabel': unitlabel,
      'unitformat': unitformat,
      'last2hours': last2hours,
      'last4hours': last4hours,
      'last8hours': last8hours,
    };
  }

  factory ShortTermValue.fromMap(Map<String, dynamic> map) {
    return ShortTermValue(
      label: map['label'] ?? '',
      unitlabel: map['unitlabel'] ?? '',
      unitformat: map['unitformat'] ?? '',
      last2hours: Map<int, double>.from(map['last2hours']),
      last4hours: Map<int, double>.from(map['last4hours']),
      last8hours: Map<int, double>.from(map['last8hours']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortTermValue.fromJson(String source) => ShortTermValue.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShortTermValue(label: $label, unitlabel: $unitlabel, unitformat: $unitformat, last2hours: $last2hours, last4hours: $last4hours, last8hours: $last8hours)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShortTermValue &&
        other.label == label &&
        other.unitlabel == unitlabel &&
        other.unitformat == unitformat &&
        mapEquals(other.last2hours, last2hours) &&
        mapEquals(other.last4hours, last4hours) &&
        mapEquals(other.last8hours, last8hours);
  }

  @override
  int get hashCode {
    return label.hashCode ^ unitlabel.hashCode ^ unitformat.hashCode ^ last2hours.hashCode ^ last4hours.hashCode ^ last8hours.hashCode;
  }
}
