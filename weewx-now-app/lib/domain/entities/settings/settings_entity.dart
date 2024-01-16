import 'package:weewx_now/domain/entities/settings/station_entity.dart';
import 'package:weewx_now/domain/entities/settings/texts_entity.dart';
import 'package:weewx_now/domain/entities/settings/webapp_entity.dart';

class SettingsEntity {
  final StationEntity station;
  final WebappEntity webapp;
  final TextsEntity texts;
  SettingsEntity({
    required this.station,
    required this.webapp,
    required this.texts,
  });
}
