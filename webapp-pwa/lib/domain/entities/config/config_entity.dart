import 'package:weewx_pwa/domain/entities/config/station_entity.dart';

class ConfigEntity {
  final StationEntity station;

  ConfigEntity({
    required this.station,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConfigEntity && other.station == station;
  }

  @override
  int get hashCode => station.hashCode;
}
