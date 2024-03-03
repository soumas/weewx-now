import 'dart:convert';

import 'package:weewx_now/domain/entities/wee_wx_config/now_config.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/station_config.dart';

class WeeWxConfig {
  final StationConfig station;
  final WeeWXNowConfig now;
  WeeWxConfig({
    required this.station,
    required this.now,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeeWxConfig && other.station == station && other.now == now;
  }

  @override
  int get hashCode => station.hashCode ^ now.hashCode;

  WeeWxConfig copyWith({
    StationConfig? station,
    WeeWXNowConfig? now,
  }) {
    return WeeWxConfig(
      station: station ?? this.station,
      now: now ?? this.now,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'station': station.toMap(),
      'now': now.toMap(),
    };
  }

  factory WeeWxConfig.fromMap(Map<String, dynamic> map) {
    return WeeWxConfig(
      station: StationConfig.fromMap(map['station']),
      now: WeeWXNowConfig.fromMap(map['now']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeeWxConfig.fromJson(String source) => WeeWxConfig.fromMap(json.decode(source));

  @override
  String toString() => 'WeeWxConfig(station: $station, now: $now)';
}
