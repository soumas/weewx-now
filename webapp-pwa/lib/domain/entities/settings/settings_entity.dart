import 'package:weewx_pwa/domain/entities/settings/station_entity.dart';
import 'package:weewx_pwa/domain/entities/settings/texts_entity.dart';
import 'package:weewx_pwa/domain/entities/settings/webapp_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_entity.freezed.dart';

@freezed
class SettingsEntity with _$SettingsEntity {
  factory SettingsEntity({
    required StationEntity station,
    required WebappEntity webapp,
    required TextsEntity texts,
  }) = _SettingsEntity;
}
