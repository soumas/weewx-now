import 'package:weewx_pwa/data/models/settings_model.dart';
import 'package:weewx_pwa/domain/entities/settings/settings_entity.dart';
import 'package:weewx_pwa/domain/entities/settings/station_entity.dart';
import 'package:weewx_pwa/domain/entities/settings/texts_entity.dart';
import 'package:weewx_pwa/domain/entities/settings/webapp_entity.dart';

extension SettingsModelExt on SettingsModel {
  SettingsEntity toEntity() {
    return SettingsEntity(
        station: StationEntity(
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
        webapp: WebappEntity(),
        texts: TextsEntity(
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
