import 'package:weewx_now_app/domain/entities/settings/station_entity.dart';
import 'package:weewx_now_app/domain/entities/settings/texts_entity.dart';
import 'package:weewx_now_app/domain/entities/settings/extras_entity.dart';

class SettingsEntity {
  final StationEntity station;
  final ExtrasEntity extras;
  final TextsEntity texts;
  SettingsEntity({
    required this.station,
    required this.extras,
    required this.texts,
  });
}
