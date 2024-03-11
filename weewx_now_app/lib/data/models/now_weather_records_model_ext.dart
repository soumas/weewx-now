import 'package:weewx_now/data/models/now_weather_records_model.dart';
import 'package:weewx_now/domain/entities/weather_data/records/current_weather.dart';
import 'package:weewx_now/domain/entities/weather_data/records/records_set.dart';
import 'package:weewx_now/domain/entities/weather_data/records/short_term_weather.dart';

extension NowWeatherRecordsModelExt on NowWeatherRecordsModel {
  RecordsSet toEntity() {
    CurrentWeather cw = _buildCurrentWeather();
    List<ShortTermWeather> st = _buildShortTerm();
    return RecordsSet(generation: DateTime.now(), current: cw, shortTerm: st);
  }

  CurrentWeather _buildCurrentWeather() {
    return CurrentWeather(dateTime: DateTime.fromMillisecondsSinceEpoch(current.generation), values: []);
  }

  List<ShortTermWeather> _buildShortTerm() {
    return [];
    //   return ShortTerm(
    //     windSpeed: ShortTermValue(
    //         label: shortTerm.windSpeed.label,
    //         unitlabel: shortTerm.windSpeed.unitlabel,
    //         unitformat: shortTerm.windSpeed.unitformat,
    //         last2hours: [],
    //         last4hours: [],
    //         last8hours: []),
    //     windGust: ShortTermValue(
    //         label: shortTerm.windGust.label,
    //         unitlabel: shortTerm.windGust.unitlabel,
    //         unitformat: shortTerm.windGust.unitformat,
    //         last2hours: [],
    //         last4hours: [],
    //         last8hours: []),
    //     windDir: ShortTermValue(
    //         label: shortTerm.windDir.label,
    //         unitlabel: shortTerm.windDir.unitlabel,
    //         unitformat: shortTerm.windDir.unitformat,
    //         last2hours: [],
    //         last4hours: [],
    //         last8hours: []),
    //     outTemp: ShortTermValue(
    //         label: shortTerm.outTemp.label,
    //         unitlabel: shortTerm.outTemp.unitlabel,
    //         unitformat: shortTerm.outTemp.unitformat,
    //         last2hours: [],
    //         last4hours: [],
    //         last8hours: []),
    //     barometer: ShortTermValue(
    //         label: shortTerm.barometer.label,
    //         unitlabel: shortTerm.barometer.unitlabel,
    //         unitformat: shortTerm.barometer.unitformat,
    //         last2hours: [],
    //         last4hours: [],
    //         last8hours: []),
    //     rainRate: ShortTermValue(
    //         label: shortTerm.rainRate.label,
    //         unitlabel: shortTerm.rainRate.unitlabel,
    //         unitformat: shortTerm.rainRate.unitformat,
    //         last2hours: [],
    //         last4hours: [],
    //         last8hours: []),
    //   );
  }
}
