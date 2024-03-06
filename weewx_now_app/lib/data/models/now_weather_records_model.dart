import 'dart:convert';

import 'package:flutter/foundation.dart';

class NowWeatherRecordsModel {
  final int generation;
  final Current current;
  final ShortTerm shortTerm;
  NowWeatherRecordsModel({
    required this.generation,
    required this.current,
    required this.shortTerm,
  });

  NowWeatherRecordsModel copyWith({
    int? generation,
    Current? current,
    ShortTerm? shortTerm,
  }) {
    return NowWeatherRecordsModel(
      generation: generation ?? this.generation,
      current: current ?? this.current,
      shortTerm: shortTerm ?? this.shortTerm,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'generation': generation,
      'current': current.toMap(),
      'shortTerm': shortTerm.toMap(),
    };
  }

  factory NowWeatherRecordsModel.fromMap(Map<String, dynamic> map) {
    return NowWeatherRecordsModel(
      generation: map['generation']?.toInt() ?? 0,
      current: Current.fromMap(map['current']),
      shortTerm: ShortTerm.fromMap(map['shortTerm']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NowWeatherRecordsModel.fromJson(String source) => NowWeatherRecordsModel.fromMap(json.decode(source));

  @override
  String toString() => 'WeatherRecordsBundle(generation: $generation, current: $current, shortTerm: $shortTerm)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NowWeatherRecordsModel && other.generation == generation && other.current == current && other.shortTerm == shortTerm;
  }

  @override
  int get hashCode => generation.hashCode ^ current.hashCode ^ shortTerm.hashCode;
}

class ShortTerm {
  final ShortTermValue windSpeed;
  final ShortTermValue windGust;
  final ShortTermValue windDir;
  final ShortTermValue outTemp;
  final ShortTermValue barometer;
  final ShortTermValue rainRate;
  ShortTerm({
    required this.windSpeed,
    required this.windGust,
    required this.windDir,
    required this.outTemp,
    required this.barometer,
    required this.rainRate,
  });

  ShortTerm copyWith({
    ShortTermValue? windSpeed,
    ShortTermValue? windGust,
    ShortTermValue? windDir,
    ShortTermValue? outTemp,
    ShortTermValue? barometer,
    ShortTermValue? rainRate,
  }) {
    return ShortTerm(
      windSpeed: windSpeed ?? this.windSpeed,
      windGust: windGust ?? this.windGust,
      windDir: windDir ?? this.windDir,
      outTemp: outTemp ?? this.outTemp,
      barometer: barometer ?? this.barometer,
      rainRate: rainRate ?? this.rainRate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'windSpeed': windSpeed.toMap(),
      'windGust': windGust.toMap(),
      'windDir': windDir.toMap(),
      'outTemp': outTemp.toMap(),
      'barometer': barometer.toMap(),
      'rainRate': rainRate.toMap(),
    };
  }

  factory ShortTerm.fromMap(Map<String, dynamic> map) {
    return ShortTerm(
      windSpeed: ShortTermValue.fromMap(map['windSpeed']),
      windGust: ShortTermValue.fromMap(map['windGust']),
      windDir: ShortTermValue.fromMap(map['windDir']),
      outTemp: ShortTermValue.fromMap(map['outTemp']),
      barometer: ShortTermValue.fromMap(map['barometer']),
      rainRate: ShortTermValue.fromMap(map['rainRate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortTerm.fromJson(String source) => ShortTerm.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShortTerm(windSpeed: $windSpeed, windGust: $windGust, windDir: $windDir, outTemp: $outTemp, barometer: $barometer, rainRate: $rainRate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShortTerm &&
        other.windSpeed == windSpeed &&
        other.windGust == windGust &&
        other.windDir == windDir &&
        other.outTemp == outTemp &&
        other.barometer == barometer &&
        other.rainRate == rainRate;
  }

  @override
  int get hashCode {
    return windSpeed.hashCode ^ windGust.hashCode ^ windDir.hashCode ^ outTemp.hashCode ^ barometer.hashCode ^ rainRate.hashCode;
  }
}

class ShortTermValue {
  final String label;
  final String unitlabel;
  final String unitformat;
  final List<dynamic> last2hours;
  final List<dynamic> last4hours;
  final List<dynamic> last8hours;
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
    List<dynamic>? last2hours,
    List<dynamic>? last4hours,
    List<dynamic>? last8hours,
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
      last2hours: List<dynamic>.from(map['last2hours']),
      last4hours: List<dynamic>.from(map['last4hours']),
      last8hours: List<dynamic>.from(map['last8hours']),
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
        listEquals(other.last2hours, last2hours) &&
        listEquals(other.last4hours, last4hours) &&
        listEquals(other.last8hours, last8hours);
  }

  @override
  int get hashCode {
    return label.hashCode ^ unitlabel.hashCode ^ unitformat.hashCode ^ last2hours.hashCode ^ last4hours.hashCode ^ last8hours.hashCode;
  }
}

class Current {
  final int generation;
  final CurrentValue outTemp;
  final CurrentValue dewpoint;
  final CurrentValue outHumidity;
  final CurrentValue heatindex;
  final CurrentValue barometer;
  final CurrentValue windSpeed;
  final CurrentValue windGust;
  final CurrentValue windDir;
  final CurrentValue windchill;
  final CurrentValue rainRate;
  final CurrentValue inTemp;
  final CurrentValue inHumidity;
  Current({
    required this.generation,
    required this.outTemp,
    required this.dewpoint,
    required this.outHumidity,
    required this.heatindex,
    required this.barometer,
    required this.windSpeed,
    required this.windGust,
    required this.windDir,
    required this.windchill,
    required this.rainRate,
    required this.inTemp,
    required this.inHumidity,
  });

  Current copyWith({
    int? generation,
    CurrentValue? outTemp,
    CurrentValue? dewpoint,
    CurrentValue? outHumidity,
    CurrentValue? heatindex,
    CurrentValue? barometer,
    CurrentValue? windSpeed,
    CurrentValue? windGust,
    CurrentValue? windDir,
    CurrentValue? windchill,
    CurrentValue? rainRate,
    CurrentValue? inTemp,
    CurrentValue? inHumidity,
  }) {
    return Current(
      generation: generation ?? this.generation,
      outTemp: outTemp ?? this.outTemp,
      dewpoint: dewpoint ?? this.dewpoint,
      outHumidity: outHumidity ?? this.outHumidity,
      heatindex: heatindex ?? this.heatindex,
      barometer: barometer ?? this.barometer,
      windSpeed: windSpeed ?? this.windSpeed,
      windGust: windGust ?? this.windGust,
      windDir: windDir ?? this.windDir,
      windchill: windchill ?? this.windchill,
      rainRate: rainRate ?? this.rainRate,
      inTemp: inTemp ?? this.inTemp,
      inHumidity: inHumidity ?? this.inHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'generation': generation,
      'outTemp': outTemp.toMap(),
      'dewpoint': dewpoint.toMap(),
      'outHumidity': outHumidity.toMap(),
      'heatindex': heatindex.toMap(),
      'barometer': barometer.toMap(),
      'windSpeed': windSpeed.toMap(),
      'windGust': windGust.toMap(),
      'windDir': windDir.toMap(),
      'windchill': windchill.toMap(),
      'rainRate': rainRate.toMap(),
      'inTemp': inTemp.toMap(),
      'inHumidity': inHumidity.toMap(),
    };
  }

  factory Current.fromMap(Map<String, dynamic> map) {
    return Current(
      generation: map['generation']?.toInt() ?? 0,
      outTemp: CurrentValue.fromMap(map['outTemp']),
      dewpoint: CurrentValue.fromMap(map['dewpoint']),
      outHumidity: CurrentValue.fromMap(map['outHumidity']),
      heatindex: CurrentValue.fromMap(map['heatindex']),
      barometer: CurrentValue.fromMap(map['barometer']),
      windSpeed: CurrentValue.fromMap(map['windSpeed']),
      windGust: CurrentValue.fromMap(map['windGust']),
      windDir: CurrentValue.fromMap(map['windDir']),
      windchill: CurrentValue.fromMap(map['windchill']),
      rainRate: CurrentValue.fromMap(map['rainRate']),
      inTemp: CurrentValue.fromMap(map['inTemp']),
      inHumidity: CurrentValue.fromMap(map['inHumidity']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Current.fromJson(String source) => Current.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Current(generation: $generation, outTemp: $outTemp, dewpoint: $dewpoint, outHumidity: $outHumidity, heatindex: $heatindex, barometer: $barometer, windSpeed: $windSpeed, windGust: $windGust, windDir: $windDir, windchill: $windchill, rainRate: $rainRate, inTemp: $inTemp, inHumidity: $inHumidity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Current &&
        other.generation == generation &&
        other.outTemp == outTemp &&
        other.dewpoint == dewpoint &&
        other.outHumidity == outHumidity &&
        other.heatindex == heatindex &&
        other.barometer == barometer &&
        other.windSpeed == windSpeed &&
        other.windGust == windGust &&
        other.windDir == windDir &&
        other.windchill == windchill &&
        other.rainRate == rainRate &&
        other.inTemp == inTemp &&
        other.inHumidity == inHumidity;
  }

  @override
  int get hashCode {
    return generation.hashCode ^
        outTemp.hashCode ^
        dewpoint.hashCode ^
        outHumidity.hashCode ^
        heatindex.hashCode ^
        barometer.hashCode ^
        windSpeed.hashCode ^
        windGust.hashCode ^
        windDir.hashCode ^
        windchill.hashCode ^
        rainRate.hashCode ^
        inTemp.hashCode ^
        inHumidity.hashCode;
  }
}

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
