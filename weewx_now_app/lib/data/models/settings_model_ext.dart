import 'package:weewx_now/data/models/settings_model.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/wee_wx_config.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/station_config.dart';
import 'package:weewx_now/domain/entities/wee_wx_config/labels.dart';
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
        now: NowConfig(
          endpoint: extras.url,
          hideImageViewer: extras.hideImageViewer,
          password: extras.password,
        ),
        texts: Labels(
          outTemp: texts.outTemp,
          dewpoint: texts.dewpoint,
          outHumidity: texts.outHumidity,
          heatindex: texts.heatindex,
          barometer: texts.barometer,
          windSpeed: texts.windSpeed,
          windGust: texts.windGust,
          windDir: texts.windDir,
          windchill: texts.windchill,
          rainRate: texts.rainRate,
          inTemp: texts.inTemp,
          inHumidity: texts.inHumidity,
          outTempMax: texts.outTempMax,
          outTempMin: texts.outTempMin,
          dewpointMax: texts.dewpointMax,
          dewpointMin: texts.dewpointMin,
          outHumidityMax: texts.outHumidityMax,
          outHumidityMin: texts.outHumidityMin,
          barometerMax: texts.barometerMax,
          barometerMin: texts.barometerMin,
          windSpeedMax: texts.windSpeedMax,
          windGustMax: texts.windGustMax,
          rainRateMax: texts.rainRateMax,
          rainTotal: texts.rainTotal,
          inTempMax: texts.inTempMax,
          inTempMin: texts.inTempMin,
          inHumidityMax: texts.inHumidityMax,
          inHumidityMin: texts.inHumidityMin,
          currentConditions: texts.currentConditions,
          at: texts.at,
        ));
  }
}
