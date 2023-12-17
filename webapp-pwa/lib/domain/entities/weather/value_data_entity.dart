class ValueDataEntity {
  final double value;
  final String units;

  ValueDataEntity({
    required this.value,
    required this.units,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueDataEntity &&
        other.value == value &&
        other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;
}
