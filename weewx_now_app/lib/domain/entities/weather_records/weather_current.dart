import 'dart:convert';

import 'package:weewx_now/domain/entities/weather_records/value_data.dart';

class WeatherCurrent {
  final DateTime generation;
  final ValueData temperature;
  final ValueData dewpoint;
  final ValueData humidity;
  final ValueData heatIndex;
  final ValueData barometer;
  final ValueData windSpeed;
  final ValueData windGust;
  final ValueData windDirection;
  final ValueData windChill;
  final ValueData rainRate;
  final ValueData insideTemperature;
  final ValueData insideHumidity;
  WeatherCurrent({
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherCurrent &&
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

  WeatherCurrent copyWith({
    DateTime? generation,
    ValueData? temperature,
    ValueData? dewpoint,
    ValueData? humidity,
    ValueData? heatIndex,
    ValueData? barometer,
    ValueData? windSpeed,
    ValueData? windGust,
    ValueData? windDirection,
    ValueData? windChill,
    ValueData? rainRate,
    ValueData? insideTemperature,
    ValueData? insideHumidity,
  }) {
    return WeatherCurrent(
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
      'generation': generation.millisecondsSinceEpoch,
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

  factory WeatherCurrent.fromMap(Map<String, dynamic> map) {
    return WeatherCurrent(
      generation: DateTime.fromMillisecondsSinceEpoch(map['generation']),
      temperature: ValueData.fromMap(map['temperature']),
      dewpoint: ValueData.fromMap(map['dewpoint']),
      humidity: ValueData.fromMap(map['humidity']),
      heatIndex: ValueData.fromMap(map['heatIndex']),
      barometer: ValueData.fromMap(map['barometer']),
      windSpeed: ValueData.fromMap(map['windSpeed']),
      windGust: ValueData.fromMap(map['windGust']),
      windDirection: ValueData.fromMap(map['windDirection']),
      windChill: ValueData.fromMap(map['windChill']),
      rainRate: ValueData.fromMap(map['rainRate']),
      insideTemperature: ValueData.fromMap(map['insideTemperature']),
      insideHumidity: ValueData.fromMap(map['insideHumidity']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherCurrent.fromJson(String source) => WeatherCurrent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeatherCurrent(generation: $generation, temperature: $temperature, dewpoint: $dewpoint, humidity: $humidity, heatIndex: $heatIndex, barometer: $barometer, windSpeed: $windSpeed, windGust: $windGust, windDirection: $windDirection, windChill: $windChill, rainRate: $rainRate, insideTemperature: $insideTemperature, insideHumidity: $insideHumidity)';
  }
}
