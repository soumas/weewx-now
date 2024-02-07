import 'package:weewx_now/data/models/settings_model.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/wee_wx_config.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/station_config.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/now_config.dart';

extension SettingsModelExt on SettingsModel {
  WeeWxConfig toEntity() {
    return WeeWxConfig(
      station: StationConfig(
        location: station.location,
        latitude: station.latitude,
        longitude: station.longitude,
        altitudeMeters: station.altitudeMeters,
        url: station.url,
        hardware: station.hardware,
        uptimeOS: station.uptimeOS,
        uptimeWeeWX: station.uptimeWeeWX,
        versionWeeWX: station.versionWeeWX,
      ),
      now: WeeWXNowConfig(
        responsibleEntityName: weewxnow.responsibleEntityName,
        responsibleEntityUrl: weewxnow.responsibleEntityUrl,
        password: weewxnow.password,
        hideImageViewer: weewxnow.hideImageViewer,
      ),
    );
  }
}
