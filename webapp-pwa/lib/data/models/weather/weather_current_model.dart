import 'dart:convert';

import 'package:weewx_pwa/data/models/weather/value_data_model.dart';
import 'package:weewx_pwa/domain/entities/weather/weather_current_entity.dart';

class WeatherCurrentModel {
  final DateTime generation;
  final ValueDataModel temperature;
  final ValueDataModel dewpoint;
  final ValueDataModel humidity;
  final ValueDataModel heatIndex;
  final ValueDataModel barometer;
  final ValueDataModel windSpeed;
  final ValueDataModel windGust;
  final ValueDataModel windDirection;
  final ValueDataModel windChill;
  final ValueDataModel rainRate;
  final ValueDataModel insideTemperature;
  final ValueDataModel insideHumidity;

  WeatherCurrentModel({
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

  WeatherCurrentEntity toEntity() {
    return WeatherCurrentEntity(
      generation: generation,
      temperature: temperature.toEntity(),
      dewpoint: dewpoint.toEntity(),
      humidity: humidity.toEntity(),
      heatIndex: heatIndex.toEntity(),
      barometer: barometer.toEntity(),
      windSpeed: windSpeed.toEntity(),
      windGust: windGust.toEntity(),
      windDirection: windDirection.toEntity(),
      windChill: windChill.toEntity(),
      rainRate: rainRate.toEntity(),
      insideTemperature: insideTemperature.toEntity(),
      insideHumidity: insideHumidity.toEntity(),
    );
  }

  WeatherCurrentModel copyWith({
    DateTime? generation,
    ValueDataModel? temperature,
    ValueDataModel? dewpoint,
    ValueDataModel? humidity,
    ValueDataModel? heatIndex,
    ValueDataModel? barometer,
    ValueDataModel? windSpeed,
    ValueDataModel? windGust,
    ValueDataModel? windDirection,
    ValueDataModel? windChill,
    ValueDataModel? rainRate,
    ValueDataModel? insideTemperature,
    ValueDataModel? insideHumidity,
  }) {
    return WeatherCurrentModel(
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

  factory WeatherCurrentModel.fromMap(Map<String, dynamic> map) {
    return WeatherCurrentModel(
      generation: DateTime.fromMillisecondsSinceEpoch(map['generation']),
      temperature: ValueDataModel.fromMap(map['temperature']),
      dewpoint: ValueDataModel.fromMap(map['dewpoint']),
      humidity: ValueDataModel.fromMap(map['humidity']),
      heatIndex: ValueDataModel.fromMap(map['heatIndex']),
      barometer: ValueDataModel.fromMap(map['barometer']),
      windSpeed: ValueDataModel.fromMap(map['windSpeed']),
      windGust: ValueDataModel.fromMap(map['windGust']),
      windDirection: ValueDataModel.fromMap(map['windDirection']),
      windChill: ValueDataModel.fromMap(map['windChill']),
      rainRate: ValueDataModel.fromMap(map['rainRate']),
      insideTemperature: ValueDataModel.fromMap(map['insideTemperature']),
      insideHumidity: ValueDataModel.fromMap(map['insideHumidity']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherCurrentModel.fromJson(String source) =>
      WeatherCurrentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeatherCurrentModel(generation: $generation, temperature: $temperature, dewpoint: $dewpoint, humidity: $humidity, heatIndex: $heatIndex, barometer: $barometer, windSpeed: $windSpeed, windGust: $windGust, windDirection: $windDirection, windChill: $windChill, rainRate: $rainRate, insideTemperature: $insideTemperature, insideHumidity: $insideHumidity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherCurrentModel &&
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
