import 'package:weewx_pwa/domain/entities/settings/station_entity.dart';
import 'package:weewx_pwa/domain/entities/settings/texts_entity.dart';
import 'package:weewx_pwa/domain/entities/settings/webapp_entity.dart';

class SettingsEntity {
  final StationEntity station;
  final WebappEntity webapp;
  final TextsEntity texts;

  SettingsEntity({
    required this.station,
    required this.webapp,
    required this.texts,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SettingsEntity &&
        other.station == station &&
        other.webapp == webapp &&
        other.texts == texts;
  }

  @override
  int get hashCode => station.hashCode ^ webapp.hashCode ^ texts.hashCode;
}
