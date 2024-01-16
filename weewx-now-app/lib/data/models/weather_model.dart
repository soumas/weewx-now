import 'dart:convert';

class WeatherModel {
  final String generation;
  final Current current;
  final Day day;
  final Week week;
  final Month month;
  final Year year;
  WeatherModel({
    required this.generation,
    required this.current,
    required this.day,
    required this.week,
    required this.month,
    required this.year,
  });

  WeatherModel copyWith({
    String? generation,
    Current? current,
    Day? day,
    Week? week,
    Month? month,
    Year? year,
  }) {
    return WeatherModel(
      generation: generation ?? this.generation,
      current: current ?? this.current,
      day: day ?? this.day,
      week: week ?? this.week,
      month: month ?? this.month,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'generation': generation,
      'current': current.toMap(),
      'day': day.toMap(),
      'week': week.toMap(),
      'month': month.toMap(),
      'year': year.toMap(),
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      generation: map['generation'] ?? '',
      current: Current.fromMap(map['current']),
      day: Day.fromMap(map['day']),
      week: Week.fromMap(map['week']),
      month: Month.fromMap(map['month']),
      year: Year.fromMap(map['year']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeatherModel(generation: $generation, current: $current, day: $day, week: $week, month: $month, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherModel &&
        other.generation == generation &&
        other.current == current &&
        other.day == day &&
        other.week == week &&
        other.month == month &&
        other.year == year;
  }

  @override
  int get hashCode {
    return generation.hashCode ^
        current.hashCode ^
        day.hashCode ^
        week.hashCode ^
        month.hashCode ^
        year.hashCode;
  }
}

class Current {
  final String generation;
  final Temperature temperature;
  final Dewpoint dewpoint;
  final Humidity humidity;
  final HeatIndex heatIndex;
  final Barometer barometer;
  final WindSpeed windSpeed;
  final WindGust windGust;
  final WindDirection windDirection;
  final WindChill windChill;
  final RainRate rainRate;
  final InsideTemperature insideTemperature;
  final InsideHumidity insideHumidity;
  Current({
    required this.generation,
    required this.temperature,
    required this.dewpoint,
    required this.humidity,
    required this.heatIndex,
    required this.barometer,
    required this.windSpeed,
    required this.windGust,
    required this.windDirection,
    required this.windChill,
    required this.rainRate,
    required this.insideTemperature,
    required this.insideHumidity,
  });

  Current copyWith({
    String? generation,
    Temperature? temperature,
    Dewpoint? dewpoint,
    Humidity? humidity,
    HeatIndex? heatIndex,
    Barometer? barometer,
    WindSpeed? windSpeed,
    WindGust? windGust,
    WindDirection? windDirection,
    WindChill? windChill,
    RainRate? rainRate,
    InsideTemperature? insideTemperature,
    InsideHumidity? insideHumidity,
  }) {
    return Current(
      generation: generation ?? this.generation,
      temperature: temperature ?? this.temperature,
      dewpoint: dewpoint ?? this.dewpoint,
      humidity: humidity ?? this.humidity,
      heatIndex: heatIndex ?? this.heatIndex,
      barometer: barometer ?? this.barometer,
      windSpeed: windSpeed ?? this.windSpeed,
      windGust: windGust ?? this.windGust,
      windDirection: windDirection ?? this.windDirection,
      windChill: windChill ?? this.windChill,
      rainRate: rainRate ?? this.rainRate,
      insideTemperature: insideTemperature ?? this.insideTemperature,
      insideHumidity: insideHumidity ?? this.insideHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'generation': generation,
      'temperature': temperature.toMap(),
      'dewpoint': dewpoint.toMap(),
      'humidity': humidity.toMap(),
      'heatIndex': heatIndex.toMap(),
      'barometer': barometer.toMap(),
      'windSpeed': windSpeed.toMap(),
      'windGust': windGust.toMap(),
      'windDirection': windDirection.toMap(),
      'windChill': windChill.toMap(),
      'rainRate': rainRate.toMap(),
      'insideTemperature': insideTemperature.toMap(),
      'insideHumidity': insideHumidity.toMap(),
    };
  }

  factory Current.fromMap(Map<String, dynamic> map) {
    return Current(
      generation: map['generation'] ?? '',
      temperature: Temperature.fromMap(map['temperature']),
      dewpoint: Dewpoint.fromMap(map['dewpoint']),
      humidity: Humidity.fromMap(map['humidity']),
      heatIndex: HeatIndex.fromMap(map['heatIndex']),
      barometer: Barometer.fromMap(map['barometer']),
      windSpeed: WindSpeed.fromMap(map['windSpeed']),
      windGust: WindGust.fromMap(map['windGust']),
      windDirection: WindDirection.fromMap(map['windDirection']),
      windChill: WindChill.fromMap(map['windChill']),
      rainRate: RainRate.fromMap(map['rainRate']),
      insideTemperature: InsideTemperature.fromMap(map['insideTemperature']),
      insideHumidity: InsideHumidity.fromMap(map['insideHumidity']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Current.fromJson(String source) =>
      Current.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Current(generation: $generation, temperature: $temperature, dewpoint: $dewpoint, humidity: $humidity, heatIndex: $heatIndex, barometer: $barometer, windSpeed: $windSpeed, windGust: $windGust, windDirection: $windDirection, windChill: $windChill, rainRate: $rainRate, insideTemperature: $insideTemperature, insideHumidity: $insideHumidity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Current &&
        other.generation == generation &&
        other.temperature == temperature &&
        other.dewpoint == dewpoint &&
        other.humidity == humidity &&
        other.heatIndex == heatIndex &&
        other.barometer == barometer &&
        other.windSpeed == windSpeed &&
        other.windGust == windGust &&
        other.windDirection == windDirection &&
        other.windChill == windChill &&
        other.rainRate == rainRate &&
        other.insideTemperature == insideTemperature &&
        other.insideHumidity == insideHumidity;
  }

  @override
  int get hashCode {
    return generation.hashCode ^
        temperature.hashCode ^
        dewpoint.hashCode ^
        humidity.hashCode ^
        heatIndex.hashCode ^
        barometer.hashCode ^
        windSpeed.hashCode ^
        windGust.hashCode ^
        windDirection.hashCode ^
        windChill.hashCode ^
        rainRate.hashCode ^
        insideTemperature.hashCode ^
        insideHumidity.hashCode;
  }
}

class Temperature {
  final double value;
  final String units;
  Temperature({
    required this.value,
    required this.units,
  });

  Temperature copyWith({
    double? value,
    String? units,
  }) {
    return Temperature(
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

  factory Temperature.fromMap(Map<String, dynamic> map) {
    return Temperature(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Temperature.fromJson(String source) =>
      Temperature.fromMap(json.decode(source));

  @override
  String toString() => 'Temperature(value: $value, units: $units)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Temperature && other.value == value && other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;
}

class Dewpoint {
  final double value;
  final String units;
  Dewpoint({
    required this.value,
    required this.units,
  });

  Dewpoint copyWith({
    double? value,
    String? units,
  }) {
    return Dewpoint(
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

  factory Dewpoint.fromMap(Map<String, dynamic> map) {
    return Dewpoint(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Dewpoint.fromJson(String source) =>
      Dewpoint.fromMap(json.decode(source));

  @override
  String toString() => 'Dewpoint(value: $value, units: $units)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Dewpoint && other.value == value && other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;
}

class Humidity {
  final double value;
  final String units;
  Humidity({
    required this.value,
    required this.units,
  });

  Humidity copyWith({
    double? value,
    String? units,
  }) {
    return Humidity(
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

  factory Humidity.fromMap(Map<String, dynamic> map) {
    return Humidity(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Humidity.fromJson(String source) =>
      Humidity.fromMap(json.decode(source));

  @override
  String toString() => 'Humidity(value: $value, units: $units)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Humidity && other.value == value && other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;
}

class HeatIndex {
  final double value;
  final String units;
  HeatIndex({
    required this.value,
    required this.units,
  });

  HeatIndex copyWith({
    double? value,
    String? units,
  }) {
    return HeatIndex(
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

  factory HeatIndex.fromMap(Map<String, dynamic> map) {
    return HeatIndex(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HeatIndex.fromJson(String source) =>
      HeatIndex.fromMap(json.decode(source));

  @override
  String toString() => 'HeatIndex(value: $value, units: $units)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HeatIndex && other.value == value && other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;
}

class Barometer {
  final double value;
  final String units;
  Barometer({
    required this.value,
    required this.units,
  });

  Barometer copyWith({
    double? value,
    String? units,
  }) {
    return Barometer(
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

  factory Barometer.fromMap(Map<String, dynamic> map) {
    return Barometer(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Barometer.fromJson(String source) =>
      Barometer.fromMap(json.decode(source));

  @override
  String toString() => 'Barometer(value: $value, units: $units)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Barometer && other.value == value && other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;
}

class WindSpeed {
  final double value;
  final String units;
  WindSpeed({
    required this.value,
    required this.units,
  });

  WindSpeed copyWith({
    double? value,
    String? units,
  }) {
    return WindSpeed(
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

  factory WindSpeed.fromMap(Map<String, dynamic> map) {
    return WindSpeed(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WindSpeed.fromJson(String source) =>
      WindSpeed.fromMap(json.decode(source));

  @override
  String toString() => 'WindSpeed(value: $value, units: $units)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WindSpeed && other.value == value && other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;
}

class WindGust {
  final double value;
  final String units;
  WindGust({
    required this.value,
    required this.units,
  });

  WindGust copyWith({
    double? value,
    String? units,
  }) {
    return WindGust(
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

  factory WindGust.fromMap(Map<String, dynamic> map) {
    return WindGust(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WindGust.fromJson(String source) =>
      WindGust.fromMap(json.decode(source));

  @override
  String toString() => 'WindGust(value: $value, units: $units)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WindGust && other.value == value && other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;
}

class WindDirection {
  final double value;
  final String units;
  WindDirection({
    required this.value,
    required this.units,
  });

  WindDirection copyWith({
    double? value,
    String? units,
  }) {
    return WindDirection(
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

  factory WindDirection.fromMap(Map<String, dynamic> map) {
    return WindDirection(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WindDirection.fromJson(String source) =>
      WindDirection.fromMap(json.decode(source));

  @override
  String toString() => 'WindDirection(value: $value, units: $units)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WindDirection &&
        other.value == value &&
        other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;
}

class WindChill {
  final double value;
  final String units;
  WindChill({
    required this.value,
    required this.units,
  });

  WindChill copyWith({
    double? value,
    String? units,
  }) {
    return WindChill(
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

  factory WindChill.fromMap(Map<String, dynamic> map) {
    return WindChill(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WindChill.fromJson(String source) =>
      WindChill.fromMap(json.decode(source));

  @override
  String toString() => 'WindChill(value: $value, units: $units)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WindChill && other.value == value && other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;
}

class RainRate {
  final double value;
  final String units;
  RainRate({
    required this.value,
    required this.units,
  });

  RainRate copyWith({
    double? value,
    String? units,
  }) {
    return RainRate(
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

  factory RainRate.fromMap(Map<String, dynamic> map) {
    return RainRate(
      value: map['value']?.toInt() ?? 0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RainRate.fromJson(String source) =>
      RainRate.fromMap(json.decode(source));

  @override
  String toString() => 'RainRate(value: $value, units: $units)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RainRate && other.value == value && other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;
}

class InsideTemperature {
  final double value;
  final String units;
  InsideTemperature({
    required this.value,
    required this.units,
  });

  InsideTemperature copyWith({
    double? value,
    String? units,
  }) {
    return InsideTemperature(
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

  factory InsideTemperature.fromMap(Map<String, dynamic> map) {
    return InsideTemperature(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InsideTemperature.fromJson(String source) =>
      InsideTemperature.fromMap(json.decode(source));

  @override
  String toString() => 'InsideTemperature(value: $value, units: $units)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InsideTemperature &&
        other.value == value &&
        other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;
}

class InsideHumidity {
  final double value;
  final String units;
  InsideHumidity({
    required this.value,
    required this.units,
  });

  InsideHumidity copyWith({
    double? value,
    String? units,
  }) {
    return InsideHumidity(
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

  factory InsideHumidity.fromMap(Map<String, dynamic> map) {
    return InsideHumidity(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InsideHumidity.fromJson(String source) =>
      InsideHumidity.fromMap(json.decode(source));

  @override
  String toString() => 'InsideHumidity(value: $value, units: $units)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InsideHumidity &&
        other.value == value &&
        other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;
}

class Day {
  final MaxTemperature maxTemperature;
  final MinTemperature minTemperature;
  final MaxDewpoint maxDewpoint;
  final MinDewpoint minDewpoint;
  final MaxHumidity maxHumidity;
  final MinHumidity minHumidity;
  final MaxBarometer maxBarometer;
  final MinBarometer minBarometer;
  final MaxWindSpeed maxWindSpeed;
  final MaxWindGust maxWindGust;
  final MaxRainRate maxRainRate;
  final RainTotal rainTotal;
  final MaxInsideTemperature maxInsideTemperature;
  final MinInsideTemperature minInsideTemperature;
  final MaxInsideHumidity maxInsideHumidity;
  final MinInsideHumidity minInsideHumidity;
  Day({
    required this.maxTemperature,
    required this.minTemperature,
    required this.maxDewpoint,
    required this.minDewpoint,
    required this.maxHumidity,
    required this.minHumidity,
    required this.maxBarometer,
    required this.minBarometer,
    required this.maxWindSpeed,
    required this.maxWindGust,
    required this.maxRainRate,
    required this.rainTotal,
    required this.maxInsideTemperature,
    required this.minInsideTemperature,
    required this.maxInsideHumidity,
    required this.minInsideHumidity,
  });

  Day copyWith({
    MaxTemperature? maxTemperature,
    MinTemperature? minTemperature,
    MaxDewpoint? maxDewpoint,
    MinDewpoint? minDewpoint,
    MaxHumidity? maxHumidity,
    MinHumidity? minHumidity,
    MaxBarometer? maxBarometer,
    MinBarometer? minBarometer,
    MaxWindSpeed? maxWindSpeed,
    MaxWindGust? maxWindGust,
    MaxRainRate? maxRainRate,
    RainTotal? rainTotal,
    MaxInsideTemperature? maxInsideTemperature,
    MinInsideTemperature? minInsideTemperature,
    MaxInsideHumidity? maxInsideHumidity,
    MinInsideHumidity? minInsideHumidity,
  }) {
    return Day(
      maxTemperature: maxTemperature ?? this.maxTemperature,
      minTemperature: minTemperature ?? this.minTemperature,
      maxDewpoint: maxDewpoint ?? this.maxDewpoint,
      minDewpoint: minDewpoint ?? this.minDewpoint,
      maxHumidity: maxHumidity ?? this.maxHumidity,
      minHumidity: minHumidity ?? this.minHumidity,
      maxBarometer: maxBarometer ?? this.maxBarometer,
      minBarometer: minBarometer ?? this.minBarometer,
      maxWindSpeed: maxWindSpeed ?? this.maxWindSpeed,
      maxWindGust: maxWindGust ?? this.maxWindGust,
      maxRainRate: maxRainRate ?? this.maxRainRate,
      rainTotal: rainTotal ?? this.rainTotal,
      maxInsideTemperature: maxInsideTemperature ?? this.maxInsideTemperature,
      minInsideTemperature: minInsideTemperature ?? this.minInsideTemperature,
      maxInsideHumidity: maxInsideHumidity ?? this.maxInsideHumidity,
      minInsideHumidity: minInsideHumidity ?? this.minInsideHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'maxTemperature': maxTemperature.toMap(),
      'minTemperature': minTemperature.toMap(),
      'maxDewpoint': maxDewpoint.toMap(),
      'minDewpoint': minDewpoint.toMap(),
      'maxHumidity': maxHumidity.toMap(),
      'minHumidity': minHumidity.toMap(),
      'maxBarometer': maxBarometer.toMap(),
      'minBarometer': minBarometer.toMap(),
      'maxWindSpeed': maxWindSpeed.toMap(),
      'maxWindGust': maxWindGust.toMap(),
      'maxRainRate': maxRainRate.toMap(),
      'rainTotal': rainTotal.toMap(),
      'maxInsideTemperature': maxInsideTemperature.toMap(),
      'minInsideTemperature': minInsideTemperature.toMap(),
      'maxInsideHumidity': maxInsideHumidity.toMap(),
      'minInsideHumidity': minInsideHumidity.toMap(),
    };
  }

  factory Day.fromMap(Map<String, dynamic> map) {
    return Day(
      maxTemperature: MaxTemperature.fromMap(map['maxTemperature']),
      minTemperature: MinTemperature.fromMap(map['minTemperature']),
      maxDewpoint: MaxDewpoint.fromMap(map['maxDewpoint']),
      minDewpoint: MinDewpoint.fromMap(map['minDewpoint']),
      maxHumidity: MaxHumidity.fromMap(map['maxHumidity']),
      minHumidity: MinHumidity.fromMap(map['minHumidity']),
      maxBarometer: MaxBarometer.fromMap(map['maxBarometer']),
      minBarometer: MinBarometer.fromMap(map['minBarometer']),
      maxWindSpeed: MaxWindSpeed.fromMap(map['maxWindSpeed']),
      maxWindGust: MaxWindGust.fromMap(map['maxWindGust']),
      maxRainRate: MaxRainRate.fromMap(map['maxRainRate']),
      rainTotal: RainTotal.fromMap(map['rainTotal']),
      maxInsideTemperature:
          MaxInsideTemperature.fromMap(map['maxInsideTemperature']),
      minInsideTemperature:
          MinInsideTemperature.fromMap(map['minInsideTemperature']),
      maxInsideHumidity: MaxInsideHumidity.fromMap(map['maxInsideHumidity']),
      minInsideHumidity: MinInsideHumidity.fromMap(map['minInsideHumidity']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Day.fromJson(String source) => Day.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Day(maxTemperature: $maxTemperature, minTemperature: $minTemperature, maxDewpoint: $maxDewpoint, minDewpoint: $minDewpoint, maxHumidity: $maxHumidity, minHumidity: $minHumidity, maxBarometer: $maxBarometer, minBarometer: $minBarometer, maxWindSpeed: $maxWindSpeed, maxWindGust: $maxWindGust, maxRainRate: $maxRainRate, rainTotal: $rainTotal, maxInsideTemperature: $maxInsideTemperature, minInsideTemperature: $minInsideTemperature, maxInsideHumidity: $maxInsideHumidity, minInsideHumidity: $minInsideHumidity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Day &&
        other.maxTemperature == maxTemperature &&
        other.minTemperature == minTemperature &&
        other.maxDewpoint == maxDewpoint &&
        other.minDewpoint == minDewpoint &&
        other.maxHumidity == maxHumidity &&
        other.minHumidity == minHumidity &&
        other.maxBarometer == maxBarometer &&
        other.minBarometer == minBarometer &&
        other.maxWindSpeed == maxWindSpeed &&
        other.maxWindGust == maxWindGust &&
        other.maxRainRate == maxRainRate &&
        other.rainTotal == rainTotal &&
        other.maxInsideTemperature == maxInsideTemperature &&
        other.minInsideTemperature == minInsideTemperature &&
        other.maxInsideHumidity == maxInsideHumidity &&
        other.minInsideHumidity == minInsideHumidity;
  }

  @override
  int get hashCode {
    return maxTemperature.hashCode ^
        minTemperature.hashCode ^
        maxDewpoint.hashCode ^
        minDewpoint.hashCode ^
        maxHumidity.hashCode ^
        minHumidity.hashCode ^
        maxBarometer.hashCode ^
        minBarometer.hashCode ^
        maxWindSpeed.hashCode ^
        maxWindGust.hashCode ^
        maxRainRate.hashCode ^
        rainTotal.hashCode ^
        maxInsideTemperature.hashCode ^
        minInsideTemperature.hashCode ^
        maxInsideHumidity.hashCode ^
        minInsideHumidity.hashCode;
  }
}

class MaxTemperature {
  final double value;
  final String units;
  final String at;
  MaxTemperature({
    required this.value,
    required this.units,
    required this.at,
  });

  MaxTemperature copyWith({
    double? value,
    String? units,
    String? at,
  }) {
    return MaxTemperature(
      value: value ?? this.value,
      units: units ?? this.units,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
      'at': at,
    };
  }

  factory MaxTemperature.fromMap(Map<String, dynamic> map) {
    return MaxTemperature(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MaxTemperature.fromJson(String source) =>
      MaxTemperature.fromMap(json.decode(source));

  @override
  String toString() => 'MaxTemperature(value: $value, units: $units, at: $at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MaxTemperature &&
        other.value == value &&
        other.units == units &&
        other.at == at;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode ^ at.hashCode;
}

class MinTemperature {
  final double value;
  final String units;
  final String at;
  MinTemperature({
    required this.value,
    required this.units,
    required this.at,
  });

  MinTemperature copyWith({
    double? value,
    String? units,
    String? at,
  }) {
    return MinTemperature(
      value: value ?? this.value,
      units: units ?? this.units,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
      'at': at,
    };
  }

  factory MinTemperature.fromMap(Map<String, dynamic> map) {
    return MinTemperature(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MinTemperature.fromJson(String source) =>
      MinTemperature.fromMap(json.decode(source));

  @override
  String toString() => 'MinTemperature(value: $value, units: $units, at: $at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MinTemperature &&
        other.value == value &&
        other.units == units &&
        other.at == at;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode ^ at.hashCode;
}

class MaxDewpoint {
  final double value;
  final String units;
  final String at;
  MaxDewpoint({
    required this.value,
    required this.units,
    required this.at,
  });

  MaxDewpoint copyWith({
    double? value,
    String? units,
    String? at,
  }) {
    return MaxDewpoint(
      value: value ?? this.value,
      units: units ?? this.units,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
      'at': at,
    };
  }

  factory MaxDewpoint.fromMap(Map<String, dynamic> map) {
    return MaxDewpoint(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MaxDewpoint.fromJson(String source) =>
      MaxDewpoint.fromMap(json.decode(source));

  @override
  String toString() => 'MaxDewpoint(value: $value, units: $units, at: $at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MaxDewpoint &&
        other.value == value &&
        other.units == units &&
        other.at == at;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode ^ at.hashCode;
}

class MinDewpoint {
  final double value;
  final String units;
  final String at;
  MinDewpoint({
    required this.value,
    required this.units,
    required this.at,
  });

  MinDewpoint copyWith({
    double? value,
    String? units,
    String? at,
  }) {
    return MinDewpoint(
      value: value ?? this.value,
      units: units ?? this.units,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
      'at': at,
    };
  }

  factory MinDewpoint.fromMap(Map<String, dynamic> map) {
    return MinDewpoint(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MinDewpoint.fromJson(String source) =>
      MinDewpoint.fromMap(json.decode(source));

  @override
  String toString() => 'MinDewpoint(value: $value, units: $units, at: $at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MinDewpoint &&
        other.value == value &&
        other.units == units &&
        other.at == at;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode ^ at.hashCode;
}

class MaxHumidity {
  final double value;
  final String units;
  final String at;
  MaxHumidity({
    required this.value,
    required this.units,
    required this.at,
  });

  MaxHumidity copyWith({
    double? value,
    String? units,
    String? at,
  }) {
    return MaxHumidity(
      value: value ?? this.value,
      units: units ?? this.units,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
      'at': at,
    };
  }

  factory MaxHumidity.fromMap(Map<String, dynamic> map) {
    return MaxHumidity(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MaxHumidity.fromJson(String source) =>
      MaxHumidity.fromMap(json.decode(source));

  @override
  String toString() => 'MaxHumidity(value: $value, units: $units, at: $at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MaxHumidity &&
        other.value == value &&
        other.units == units &&
        other.at == at;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode ^ at.hashCode;
}

class MinHumidity {
  final double value;
  final String units;
  final String at;
  MinHumidity({
    required this.value,
    required this.units,
    required this.at,
  });

  MinHumidity copyWith({
    double? value,
    String? units,
    String? at,
  }) {
    return MinHumidity(
      value: value ?? this.value,
      units: units ?? this.units,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
      'at': at,
    };
  }

  factory MinHumidity.fromMap(Map<String, dynamic> map) {
    return MinHumidity(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MinHumidity.fromJson(String source) =>
      MinHumidity.fromMap(json.decode(source));

  @override
  String toString() => 'MinHumidity(value: $value, units: $units, at: $at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MinHumidity &&
        other.value == value &&
        other.units == units &&
        other.at == at;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode ^ at.hashCode;
}

class MaxBarometer {
  final double value;
  final String units;
  final String at;
  MaxBarometer({
    required this.value,
    required this.units,
    required this.at,
  });

  MaxBarometer copyWith({
    double? value,
    String? units,
    String? at,
  }) {
    return MaxBarometer(
      value: value ?? this.value,
      units: units ?? this.units,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
      'at': at,
    };
  }

  factory MaxBarometer.fromMap(Map<String, dynamic> map) {
    return MaxBarometer(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MaxBarometer.fromJson(String source) =>
      MaxBarometer.fromMap(json.decode(source));

  @override
  String toString() => 'MaxBarometer(value: $value, units: $units, at: $at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MaxBarometer &&
        other.value == value &&
        other.units == units &&
        other.at == at;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode ^ at.hashCode;
}

class MinBarometer {
  final double value;
  final String units;
  final String at;
  MinBarometer({
    required this.value,
    required this.units,
    required this.at,
  });

  MinBarometer copyWith({
    double? value,
    String? units,
    String? at,
  }) {
    return MinBarometer(
      value: value ?? this.value,
      units: units ?? this.units,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
      'at': at,
    };
  }

  factory MinBarometer.fromMap(Map<String, dynamic> map) {
    return MinBarometer(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MinBarometer.fromJson(String source) =>
      MinBarometer.fromMap(json.decode(source));

  @override
  String toString() => 'MinBarometer(value: $value, units: $units, at: $at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MinBarometer &&
        other.value == value &&
        other.units == units &&
        other.at == at;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode ^ at.hashCode;
}

class MaxWindSpeed {
  final double value;
  final String units;
  final String at;
  MaxWindSpeed({
    required this.value,
    required this.units,
    required this.at,
  });

  MaxWindSpeed copyWith({
    double? value,
    String? units,
    String? at,
  }) {
    return MaxWindSpeed(
      value: value ?? this.value,
      units: units ?? this.units,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
      'at': at,
    };
  }

  factory MaxWindSpeed.fromMap(Map<String, dynamic> map) {
    return MaxWindSpeed(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MaxWindSpeed.fromJson(String source) =>
      MaxWindSpeed.fromMap(json.decode(source));

  @override
  String toString() => 'MaxWindSpeed(value: $value, units: $units, at: $at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MaxWindSpeed &&
        other.value == value &&
        other.units == units &&
        other.at == at;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode ^ at.hashCode;
}

class MaxWindGust {
  final double value;
  final String units;
  final String at;
  MaxWindGust({
    required this.value,
    required this.units,
    required this.at,
  });

  MaxWindGust copyWith({
    double? value,
    String? units,
    String? at,
  }) {
    return MaxWindGust(
      value: value ?? this.value,
      units: units ?? this.units,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
      'at': at,
    };
  }

  factory MaxWindGust.fromMap(Map<String, dynamic> map) {
    return MaxWindGust(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MaxWindGust.fromJson(String source) =>
      MaxWindGust.fromMap(json.decode(source));

  @override
  String toString() => 'MaxWindGust(value: $value, units: $units, at: $at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MaxWindGust &&
        other.value == value &&
        other.units == units &&
        other.at == at;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode ^ at.hashCode;
}

class MaxRainRate {
  final double value;
  final String units;
  final String at;
  MaxRainRate({
    required this.value,
    required this.units,
    required this.at,
  });

  MaxRainRate copyWith({
    double? value,
    String? units,
    String? at,
  }) {
    return MaxRainRate(
      value: value ?? this.value,
      units: units ?? this.units,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
      'at': at,
    };
  }

  factory MaxRainRate.fromMap(Map<String, dynamic> map) {
    return MaxRainRate(
      value: map['value']?.toInt() ?? 0,
      units: map['units'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MaxRainRate.fromJson(String source) =>
      MaxRainRate.fromMap(json.decode(source));

  @override
  String toString() => 'MaxRainRate(value: $value, units: $units, at: $at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MaxRainRate &&
        other.value == value &&
        other.units == units &&
        other.at == at;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode ^ at.hashCode;
}

class RainTotal {
  final double value;
  final String units;
  RainTotal({
    required this.value,
    required this.units,
  });

  RainTotal copyWith({
    double? value,
    String? units,
  }) {
    return RainTotal(
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

  factory RainTotal.fromMap(Map<String, dynamic> map) {
    return RainTotal(
      value: map['value']?.toInt() ?? 0,
      units: map['units'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RainTotal.fromJson(String source) =>
      RainTotal.fromMap(json.decode(source));

  @override
  String toString() => 'RainTotal(value: $value, units: $units)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RainTotal && other.value == value && other.units == units;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode;
}

class MaxInsideTemperature {
  final double value;
  final String units;
  final String at;
  MaxInsideTemperature({
    required this.value,
    required this.units,
    required this.at,
  });

  MaxInsideTemperature copyWith({
    double? value,
    String? units,
    String? at,
  }) {
    return MaxInsideTemperature(
      value: value ?? this.value,
      units: units ?? this.units,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
      'at': at,
    };
  }

  factory MaxInsideTemperature.fromMap(Map<String, dynamic> map) {
    return MaxInsideTemperature(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MaxInsideTemperature.fromJson(String source) =>
      MaxInsideTemperature.fromMap(json.decode(source));

  @override
  String toString() =>
      'MaxInsideTemperature(value: $value, units: $units, at: $at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MaxInsideTemperature &&
        other.value == value &&
        other.units == units &&
        other.at == at;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode ^ at.hashCode;
}

class MinInsideTemperature {
  final double value;
  final String units;
  final String at;
  MinInsideTemperature({
    required this.value,
    required this.units,
    required this.at,
  });

  MinInsideTemperature copyWith({
    double? value,
    String? units,
    String? at,
  }) {
    return MinInsideTemperature(
      value: value ?? this.value,
      units: units ?? this.units,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
      'at': at,
    };
  }

  factory MinInsideTemperature.fromMap(Map<String, dynamic> map) {
    return MinInsideTemperature(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MinInsideTemperature.fromJson(String source) =>
      MinInsideTemperature.fromMap(json.decode(source));

  @override
  String toString() =>
      'MinInsideTemperature(value: $value, units: $units, at: $at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MinInsideTemperature &&
        other.value == value &&
        other.units == units &&
        other.at == at;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode ^ at.hashCode;
}

class MaxInsideHumidity {
  final double value;
  final String units;
  final String at;
  MaxInsideHumidity({
    required this.value,
    required this.units,
    required this.at,
  });

  MaxInsideHumidity copyWith({
    double? value,
    String? units,
    String? at,
  }) {
    return MaxInsideHumidity(
      value: value ?? this.value,
      units: units ?? this.units,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
      'at': at,
    };
  }

  factory MaxInsideHumidity.fromMap(Map<String, dynamic> map) {
    return MaxInsideHumidity(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MaxInsideHumidity.fromJson(String source) =>
      MaxInsideHumidity.fromMap(json.decode(source));

  @override
  String toString() =>
      'MaxInsideHumidity(value: $value, units: $units, at: $at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MaxInsideHumidity &&
        other.value == value &&
        other.units == units &&
        other.at == at;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode ^ at.hashCode;
}

class MinInsideHumidity {
  final double value;
  final String units;
  final String at;
  MinInsideHumidity({
    required this.value,
    required this.units,
    required this.at,
  });

  MinInsideHumidity copyWith({
    double? value,
    String? units,
    String? at,
  }) {
    return MinInsideHumidity(
      value: value ?? this.value,
      units: units ?? this.units,
      at: at ?? this.at,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'units': units,
      'at': at,
    };
  }

  factory MinInsideHumidity.fromMap(Map<String, dynamic> map) {
    return MinInsideHumidity(
      value: map['value']?.toDouble() ?? 0.0,
      units: map['units'] ?? '',
      at: map['at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MinInsideHumidity.fromJson(String source) =>
      MinInsideHumidity.fromMap(json.decode(source));

  @override
  String toString() =>
      'MinInsideHumidity(value: $value, units: $units, at: $at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MinInsideHumidity &&
        other.value == value &&
        other.units == units &&
        other.at == at;
  }

  @override
  int get hashCode => value.hashCode ^ units.hashCode ^ at.hashCode;
}

class Week {
  final MaxTemperature maxTemperature;
  final MinTemperature minTemperature;
  final MaxDewpoint maxDewpoint;
  final MinDewpoint minDewpoint;
  final MaxHumidity maxHumidity;
  final MinHumidity minHumidity;
  final MaxBarometer maxBarometer;
  final MinBarometer minBarometer;
  final MaxWindSpeed maxWindSpeed;
  final MaxWindGust maxWindGust;
  final MaxRainRate maxRainRate;
  final RainTotal rainTotal;
  final MaxInsideTemperature maxInsideTemperature;
  final MinInsideTemperature minInsideTemperature;
  final MaxInsideHumidity maxInsideHumidity;
  final MinInsideHumidity minInsideHumidity;
  Week({
    required this.maxTemperature,
    required this.minTemperature,
    required this.maxDewpoint,
    required this.minDewpoint,
    required this.maxHumidity,
    required this.minHumidity,
    required this.maxBarometer,
    required this.minBarometer,
    required this.maxWindSpeed,
    required this.maxWindGust,
    required this.maxRainRate,
    required this.rainTotal,
    required this.maxInsideTemperature,
    required this.minInsideTemperature,
    required this.maxInsideHumidity,
    required this.minInsideHumidity,
  });

  Week copyWith({
    MaxTemperature? maxTemperature,
    MinTemperature? minTemperature,
    MaxDewpoint? maxDewpoint,
    MinDewpoint? minDewpoint,
    MaxHumidity? maxHumidity,
    MinHumidity? minHumidity,
    MaxBarometer? maxBarometer,
    MinBarometer? minBarometer,
    MaxWindSpeed? maxWindSpeed,
    MaxWindGust? maxWindGust,
    MaxRainRate? maxRainRate,
    RainTotal? rainTotal,
    MaxInsideTemperature? maxInsideTemperature,
    MinInsideTemperature? minInsideTemperature,
    MaxInsideHumidity? maxInsideHumidity,
    MinInsideHumidity? minInsideHumidity,
  }) {
    return Week(
      maxTemperature: maxTemperature ?? this.maxTemperature,
      minTemperature: minTemperature ?? this.minTemperature,
      maxDewpoint: maxDewpoint ?? this.maxDewpoint,
      minDewpoint: minDewpoint ?? this.minDewpoint,
      maxHumidity: maxHumidity ?? this.maxHumidity,
      minHumidity: minHumidity ?? this.minHumidity,
      maxBarometer: maxBarometer ?? this.maxBarometer,
      minBarometer: minBarometer ?? this.minBarometer,
      maxWindSpeed: maxWindSpeed ?? this.maxWindSpeed,
      maxWindGust: maxWindGust ?? this.maxWindGust,
      maxRainRate: maxRainRate ?? this.maxRainRate,
      rainTotal: rainTotal ?? this.rainTotal,
      maxInsideTemperature: maxInsideTemperature ?? this.maxInsideTemperature,
      minInsideTemperature: minInsideTemperature ?? this.minInsideTemperature,
      maxInsideHumidity: maxInsideHumidity ?? this.maxInsideHumidity,
      minInsideHumidity: minInsideHumidity ?? this.minInsideHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'maxTemperature': maxTemperature.toMap(),
      'minTemperature': minTemperature.toMap(),
      'maxDewpoint': maxDewpoint.toMap(),
      'minDewpoint': minDewpoint.toMap(),
      'maxHumidity': maxHumidity.toMap(),
      'minHumidity': minHumidity.toMap(),
      'maxBarometer': maxBarometer.toMap(),
      'minBarometer': minBarometer.toMap(),
      'maxWindSpeed': maxWindSpeed.toMap(),
      'maxWindGust': maxWindGust.toMap(),
      'maxRainRate': maxRainRate.toMap(),
      'rainTotal': rainTotal.toMap(),
      'maxInsideTemperature': maxInsideTemperature.toMap(),
      'minInsideTemperature': minInsideTemperature.toMap(),
      'maxInsideHumidity': maxInsideHumidity.toMap(),
      'minInsideHumidity': minInsideHumidity.toMap(),
    };
  }

  factory Week.fromMap(Map<String, dynamic> map) {
    return Week(
      maxTemperature: MaxTemperature.fromMap(map['maxTemperature']),
      minTemperature: MinTemperature.fromMap(map['minTemperature']),
      maxDewpoint: MaxDewpoint.fromMap(map['maxDewpoint']),
      minDewpoint: MinDewpoint.fromMap(map['minDewpoint']),
      maxHumidity: MaxHumidity.fromMap(map['maxHumidity']),
      minHumidity: MinHumidity.fromMap(map['minHumidity']),
      maxBarometer: MaxBarometer.fromMap(map['maxBarometer']),
      minBarometer: MinBarometer.fromMap(map['minBarometer']),
      maxWindSpeed: MaxWindSpeed.fromMap(map['maxWindSpeed']),
      maxWindGust: MaxWindGust.fromMap(map['maxWindGust']),
      maxRainRate: MaxRainRate.fromMap(map['maxRainRate']),
      rainTotal: RainTotal.fromMap(map['rainTotal']),
      maxInsideTemperature:
          MaxInsideTemperature.fromMap(map['maxInsideTemperature']),
      minInsideTemperature:
          MinInsideTemperature.fromMap(map['minInsideTemperature']),
      maxInsideHumidity: MaxInsideHumidity.fromMap(map['maxInsideHumidity']),
      minInsideHumidity: MinInsideHumidity.fromMap(map['minInsideHumidity']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Week.fromJson(String source) => Week.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Week(maxTemperature: $maxTemperature, minTemperature: $minTemperature, maxDewpoint: $maxDewpoint, minDewpoint: $minDewpoint, maxHumidity: $maxHumidity, minHumidity: $minHumidity, maxBarometer: $maxBarometer, minBarometer: $minBarometer, maxWindSpeed: $maxWindSpeed, maxWindGust: $maxWindGust, maxRainRate: $maxRainRate, rainTotal: $rainTotal, maxInsideTemperature: $maxInsideTemperature, minInsideTemperature: $minInsideTemperature, maxInsideHumidity: $maxInsideHumidity, minInsideHumidity: $minInsideHumidity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Week &&
        other.maxTemperature == maxTemperature &&
        other.minTemperature == minTemperature &&
        other.maxDewpoint == maxDewpoint &&
        other.minDewpoint == minDewpoint &&
        other.maxHumidity == maxHumidity &&
        other.minHumidity == minHumidity &&
        other.maxBarometer == maxBarometer &&
        other.minBarometer == minBarometer &&
        other.maxWindSpeed == maxWindSpeed &&
        other.maxWindGust == maxWindGust &&
        other.maxRainRate == maxRainRate &&
        other.rainTotal == rainTotal &&
        other.maxInsideTemperature == maxInsideTemperature &&
        other.minInsideTemperature == minInsideTemperature &&
        other.maxInsideHumidity == maxInsideHumidity &&
        other.minInsideHumidity == minInsideHumidity;
  }

  @override
  int get hashCode {
    return maxTemperature.hashCode ^
        minTemperature.hashCode ^
        maxDewpoint.hashCode ^
        minDewpoint.hashCode ^
        maxHumidity.hashCode ^
        minHumidity.hashCode ^
        maxBarometer.hashCode ^
        minBarometer.hashCode ^
        maxWindSpeed.hashCode ^
        maxWindGust.hashCode ^
        maxRainRate.hashCode ^
        rainTotal.hashCode ^
        maxInsideTemperature.hashCode ^
        minInsideTemperature.hashCode ^
        maxInsideHumidity.hashCode ^
        minInsideHumidity.hashCode;
  }
}

class Month {
  final MaxTemperature maxTemperature;
  final MinTemperature minTemperature;
  final MaxDewpoint maxDewpoint;
  final MinDewpoint minDewpoint;
  final MaxHumidity maxHumidity;
  final MinHumidity minHumidity;
  final MaxBarometer maxBarometer;
  final MinBarometer minBarometer;
  final MaxWindSpeed maxWindSpeed;
  final MaxWindGust maxWindGust;
  final MaxRainRate maxRainRate;
  final RainTotal rainTotal;
  final MaxInsideTemperature maxInsideTemperature;
  final MinInsideTemperature minInsideTemperature;
  final MaxInsideHumidity maxInsideHumidity;
  final MinInsideHumidity minInsideHumidity;
  Month({
    required this.maxTemperature,
    required this.minTemperature,
    required this.maxDewpoint,
    required this.minDewpoint,
    required this.maxHumidity,
    required this.minHumidity,
    required this.maxBarometer,
    required this.minBarometer,
    required this.maxWindSpeed,
    required this.maxWindGust,
    required this.maxRainRate,
    required this.rainTotal,
    required this.maxInsideTemperature,
    required this.minInsideTemperature,
    required this.maxInsideHumidity,
    required this.minInsideHumidity,
  });

  Month copyWith({
    MaxTemperature? maxTemperature,
    MinTemperature? minTemperature,
    MaxDewpoint? maxDewpoint,
    MinDewpoint? minDewpoint,
    MaxHumidity? maxHumidity,
    MinHumidity? minHumidity,
    MaxBarometer? maxBarometer,
    MinBarometer? minBarometer,
    MaxWindSpeed? maxWindSpeed,
    MaxWindGust? maxWindGust,
    MaxRainRate? maxRainRate,
    RainTotal? rainTotal,
    MaxInsideTemperature? maxInsideTemperature,
    MinInsideTemperature? minInsideTemperature,
    MaxInsideHumidity? maxInsideHumidity,
    MinInsideHumidity? minInsideHumidity,
  }) {
    return Month(
      maxTemperature: maxTemperature ?? this.maxTemperature,
      minTemperature: minTemperature ?? this.minTemperature,
      maxDewpoint: maxDewpoint ?? this.maxDewpoint,
      minDewpoint: minDewpoint ?? this.minDewpoint,
      maxHumidity: maxHumidity ?? this.maxHumidity,
      minHumidity: minHumidity ?? this.minHumidity,
      maxBarometer: maxBarometer ?? this.maxBarometer,
      minBarometer: minBarometer ?? this.minBarometer,
      maxWindSpeed: maxWindSpeed ?? this.maxWindSpeed,
      maxWindGust: maxWindGust ?? this.maxWindGust,
      maxRainRate: maxRainRate ?? this.maxRainRate,
      rainTotal: rainTotal ?? this.rainTotal,
      maxInsideTemperature: maxInsideTemperature ?? this.maxInsideTemperature,
      minInsideTemperature: minInsideTemperature ?? this.minInsideTemperature,
      maxInsideHumidity: maxInsideHumidity ?? this.maxInsideHumidity,
      minInsideHumidity: minInsideHumidity ?? this.minInsideHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'maxTemperature': maxTemperature.toMap(),
      'minTemperature': minTemperature.toMap(),
      'maxDewpoint': maxDewpoint.toMap(),
      'minDewpoint': minDewpoint.toMap(),
      'maxHumidity': maxHumidity.toMap(),
      'minHumidity': minHumidity.toMap(),
      'maxBarometer': maxBarometer.toMap(),
      'minBarometer': minBarometer.toMap(),
      'maxWindSpeed': maxWindSpeed.toMap(),
      'maxWindGust': maxWindGust.toMap(),
      'maxRainRate': maxRainRate.toMap(),
      'rainTotal': rainTotal.toMap(),
      'maxInsideTemperature': maxInsideTemperature.toMap(),
      'minInsideTemperature': minInsideTemperature.toMap(),
      'maxInsideHumidity': maxInsideHumidity.toMap(),
      'minInsideHumidity': minInsideHumidity.toMap(),
    };
  }

  factory Month.fromMap(Map<String, dynamic> map) {
    return Month(
      maxTemperature: MaxTemperature.fromMap(map['maxTemperature']),
      minTemperature: MinTemperature.fromMap(map['minTemperature']),
      maxDewpoint: MaxDewpoint.fromMap(map['maxDewpoint']),
      minDewpoint: MinDewpoint.fromMap(map['minDewpoint']),
      maxHumidity: MaxHumidity.fromMap(map['maxHumidity']),
      minHumidity: MinHumidity.fromMap(map['minHumidity']),
      maxBarometer: MaxBarometer.fromMap(map['maxBarometer']),
      minBarometer: MinBarometer.fromMap(map['minBarometer']),
      maxWindSpeed: MaxWindSpeed.fromMap(map['maxWindSpeed']),
      maxWindGust: MaxWindGust.fromMap(map['maxWindGust']),
      maxRainRate: MaxRainRate.fromMap(map['maxRainRate']),
      rainTotal: RainTotal.fromMap(map['rainTotal']),
      maxInsideTemperature:
          MaxInsideTemperature.fromMap(map['maxInsideTemperature']),
      minInsideTemperature:
          MinInsideTemperature.fromMap(map['minInsideTemperature']),
      maxInsideHumidity: MaxInsideHumidity.fromMap(map['maxInsideHumidity']),
      minInsideHumidity: MinInsideHumidity.fromMap(map['minInsideHumidity']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Month.fromJson(String source) => Month.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Month(maxTemperature: $maxTemperature, minTemperature: $minTemperature, maxDewpoint: $maxDewpoint, minDewpoint: $minDewpoint, maxHumidity: $maxHumidity, minHumidity: $minHumidity, maxBarometer: $maxBarometer, minBarometer: $minBarometer, maxWindSpeed: $maxWindSpeed, maxWindGust: $maxWindGust, maxRainRate: $maxRainRate, rainTotal: $rainTotal, maxInsideTemperature: $maxInsideTemperature, minInsideTemperature: $minInsideTemperature, maxInsideHumidity: $maxInsideHumidity, minInsideHumidity: $minInsideHumidity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Month &&
        other.maxTemperature == maxTemperature &&
        other.minTemperature == minTemperature &&
        other.maxDewpoint == maxDewpoint &&
        other.minDewpoint == minDewpoint &&
        other.maxHumidity == maxHumidity &&
        other.minHumidity == minHumidity &&
        other.maxBarometer == maxBarometer &&
        other.minBarometer == minBarometer &&
        other.maxWindSpeed == maxWindSpeed &&
        other.maxWindGust == maxWindGust &&
        other.maxRainRate == maxRainRate &&
        other.rainTotal == rainTotal &&
        other.maxInsideTemperature == maxInsideTemperature &&
        other.minInsideTemperature == minInsideTemperature &&
        other.maxInsideHumidity == maxInsideHumidity &&
        other.minInsideHumidity == minInsideHumidity;
  }

  @override
  int get hashCode {
    return maxTemperature.hashCode ^
        minTemperature.hashCode ^
        maxDewpoint.hashCode ^
        minDewpoint.hashCode ^
        maxHumidity.hashCode ^
        minHumidity.hashCode ^
        maxBarometer.hashCode ^
        minBarometer.hashCode ^
        maxWindSpeed.hashCode ^
        maxWindGust.hashCode ^
        maxRainRate.hashCode ^
        rainTotal.hashCode ^
        maxInsideTemperature.hashCode ^
        minInsideTemperature.hashCode ^
        maxInsideHumidity.hashCode ^
        minInsideHumidity.hashCode;
  }
}

class Year {
  final MaxTemperature maxTemperature;
  final MinTemperature minTemperature;
  final MaxDewpoint maxDewpoint;
  final MinDewpoint minDewpoint;
  final MaxHumidity maxHumidity;
  final MinHumidity minHumidity;
  final MaxBarometer maxBarometer;
  final MinBarometer minBarometer;
  final MaxWindSpeed maxWindSpeed;
  final MaxWindGust maxWindGust;
  final MaxRainRate maxRainRate;
  final RainTotal rainTotal;
  final MaxInsideTemperature maxInsideTemperature;
  final MinInsideTemperature minInsideTemperature;
  final MaxInsideHumidity maxInsideHumidity;
  final MinInsideHumidity minInsideHumidity;
  Year({
    required this.maxTemperature,
    required this.minTemperature,
    required this.maxDewpoint,
    required this.minDewpoint,
    required this.maxHumidity,
    required this.minHumidity,
    required this.maxBarometer,
    required this.minBarometer,
    required this.maxWindSpeed,
    required this.maxWindGust,
    required this.maxRainRate,
    required this.rainTotal,
    required this.maxInsideTemperature,
    required this.minInsideTemperature,
    required this.maxInsideHumidity,
    required this.minInsideHumidity,
  });

  Year copyWith({
    MaxTemperature? maxTemperature,
    MinTemperature? minTemperature,
    MaxDewpoint? maxDewpoint,
    MinDewpoint? minDewpoint,
    MaxHumidity? maxHumidity,
    MinHumidity? minHumidity,
    MaxBarometer? maxBarometer,
    MinBarometer? minBarometer,
    MaxWindSpeed? maxWindSpeed,
    MaxWindGust? maxWindGust,
    MaxRainRate? maxRainRate,
    RainTotal? rainTotal,
    MaxInsideTemperature? maxInsideTemperature,
    MinInsideTemperature? minInsideTemperature,
    MaxInsideHumidity? maxInsideHumidity,
    MinInsideHumidity? minInsideHumidity,
  }) {
    return Year(
      maxTemperature: maxTemperature ?? this.maxTemperature,
      minTemperature: minTemperature ?? this.minTemperature,
      maxDewpoint: maxDewpoint ?? this.maxDewpoint,
      minDewpoint: minDewpoint ?? this.minDewpoint,
      maxHumidity: maxHumidity ?? this.maxHumidity,
      minHumidity: minHumidity ?? this.minHumidity,
      maxBarometer: maxBarometer ?? this.maxBarometer,
      minBarometer: minBarometer ?? this.minBarometer,
      maxWindSpeed: maxWindSpeed ?? this.maxWindSpeed,
      maxWindGust: maxWindGust ?? this.maxWindGust,
      maxRainRate: maxRainRate ?? this.maxRainRate,
      rainTotal: rainTotal ?? this.rainTotal,
      maxInsideTemperature: maxInsideTemperature ?? this.maxInsideTemperature,
      minInsideTemperature: minInsideTemperature ?? this.minInsideTemperature,
      maxInsideHumidity: maxInsideHumidity ?? this.maxInsideHumidity,
      minInsideHumidity: minInsideHumidity ?? this.minInsideHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'maxTemperature': maxTemperature.toMap(),
      'minTemperature': minTemperature.toMap(),
      'maxDewpoint': maxDewpoint.toMap(),
      'minDewpoint': minDewpoint.toMap(),
      'maxHumidity': maxHumidity.toMap(),
      'minHumidity': minHumidity.toMap(),
      'maxBarometer': maxBarometer.toMap(),
      'minBarometer': minBarometer.toMap(),
      'maxWindSpeed': maxWindSpeed.toMap(),
      'maxWindGust': maxWindGust.toMap(),
      'maxRainRate': maxRainRate.toMap(),
      'rainTotal': rainTotal.toMap(),
      'maxInsideTemperature': maxInsideTemperature.toMap(),
      'minInsideTemperature': minInsideTemperature.toMap(),
      'maxInsideHumidity': maxInsideHumidity.toMap(),
      'minInsideHumidity': minInsideHumidity.toMap(),
    };
  }

  factory Year.fromMap(Map<String, dynamic> map) {
    return Year(
      maxTemperature: MaxTemperature.fromMap(map['maxTemperature']),
      minTemperature: MinTemperature.fromMap(map['minTemperature']),
      maxDewpoint: MaxDewpoint.fromMap(map['maxDewpoint']),
      minDewpoint: MinDewpoint.fromMap(map['minDewpoint']),
      maxHumidity: MaxHumidity.fromMap(map['maxHumidity']),
      minHumidity: MinHumidity.fromMap(map['minHumidity']),
      maxBarometer: MaxBarometer.fromMap(map['maxBarometer']),
      minBarometer: MinBarometer.fromMap(map['minBarometer']),
      maxWindSpeed: MaxWindSpeed.fromMap(map['maxWindSpeed']),
      maxWindGust: MaxWindGust.fromMap(map['maxWindGust']),
      maxRainRate: MaxRainRate.fromMap(map['maxRainRate']),
      rainTotal: RainTotal.fromMap(map['rainTotal']),
      maxInsideTemperature:
          MaxInsideTemperature.fromMap(map['maxInsideTemperature']),
      minInsideTemperature:
          MinInsideTemperature.fromMap(map['minInsideTemperature']),
      maxInsideHumidity: MaxInsideHumidity.fromMap(map['maxInsideHumidity']),
      minInsideHumidity: MinInsideHumidity.fromMap(map['minInsideHumidity']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Year.fromJson(String source) => Year.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Year(maxTemperature: $maxTemperature, minTemperature: $minTemperature, maxDewpoint: $maxDewpoint, minDewpoint: $minDewpoint, maxHumidity: $maxHumidity, minHumidity: $minHumidity, maxBarometer: $maxBarometer, minBarometer: $minBarometer, maxWindSpeed: $maxWindSpeed, maxWindGust: $maxWindGust, maxRainRate: $maxRainRate, rainTotal: $rainTotal, maxInsideTemperature: $maxInsideTemperature, minInsideTemperature: $minInsideTemperature, maxInsideHumidity: $maxInsideHumidity, minInsideHumidity: $minInsideHumidity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Year &&
        other.maxTemperature == maxTemperature &&
        other.minTemperature == minTemperature &&
        other.maxDewpoint == maxDewpoint &&
        other.minDewpoint == minDewpoint &&
        other.maxHumidity == maxHumidity &&
        other.minHumidity == minHumidity &&
        other.maxBarometer == maxBarometer &&
        other.minBarometer == minBarometer &&
        other.maxWindSpeed == maxWindSpeed &&
        other.maxWindGust == maxWindGust &&
        other.maxRainRate == maxRainRate &&
        other.rainTotal == rainTotal &&
        other.maxInsideTemperature == maxInsideTemperature &&
        other.minInsideTemperature == minInsideTemperature &&
        other.maxInsideHumidity == maxInsideHumidity &&
        other.minInsideHumidity == minInsideHumidity;
  }

  @override
  int get hashCode {
    return maxTemperature.hashCode ^
        minTemperature.hashCode ^
        maxDewpoint.hashCode ^
        minDewpoint.hashCode ^
        maxHumidity.hashCode ^
        minHumidity.hashCode ^
        maxBarometer.hashCode ^
        minBarometer.hashCode ^
        maxWindSpeed.hashCode ^
        maxWindGust.hashCode ^
        maxRainRate.hashCode ^
        rainTotal.hashCode ^
        maxInsideTemperature.hashCode ^
        minInsideTemperature.hashCode ^
        maxInsideHumidity.hashCode ^
        minInsideHumidity.hashCode;
  }
}
