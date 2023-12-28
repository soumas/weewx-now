import 'package:weewx_pwa/domain/entities/settings/station_entity.dart';

class SettingsEntity {
  final StationEntity station;

  SettingsEntity({
    required this.station,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SettingsEntity && other.station == station;
  }

  @override
  int get hashCode => station.hashCode;
}
