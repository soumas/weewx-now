import 'package:weewx_now_app/data/models/weather_model.dart';
import 'package:weewx_now_app/domain/entities/weather/value_agg_data_entity.dart';
import 'package:weewx_now_app/domain/entities/weather/value_data_entity.dart';
import 'package:weewx_now_app/domain/entities/weather/weather_aggregation_entity.dart';
import 'package:weewx_now_app/domain/entities/weather/weather_current_entity.dart';
import 'package:weewx_now_app/domain/entities/weather/weather_data_entity.dart';

extension WeatherModelModelExt on WeatherModel {
  WeatherDataEntity toEntity() {
    return WeatherDataEntity(
      current: WeatherCurrentEntity(
        generation: DateTime.parse(current.generation),
        temperature: ValueDataEntity(
          value: current.temperature.value,
          units: current.temperature.units,
        ),
        dewpoint: ValueDataEntity(
          value: current.dewpoint.value,
          units: current.dewpoint.units,
        ),
        humidity: ValueDataEntity(
          value: current.humidity.value,
          units: current.humidity.units,
        ),
        heatIndex: ValueDataEntity(
          value: current.heatIndex.value,
          units: current.heatIndex.units,
        ),
        barometer: ValueDataEntity(
          value: current.barometer.value,
          units: current.barometer.units,
        ),
        windSpeed: ValueDataEntity(
          value: current.windSpeed.value,
          units: current.windSpeed.units,
        ),
        windGust: ValueDataEntity(
          value: current.windGust.value,
          units: current.windGust.units,
        ),
        windDirection: ValueDataEntity(
          value: current.windDirection.value,
          units: current.windDirection.units,
        ),
        windChill: ValueDataEntity(
          value: current.windChill.value,
          units: current.windChill.units,
        ),
        rainRate: ValueDataEntity(
          value: current.rainRate.value,
          units: current.rainRate.units,
        ),
        insideTemperature: ValueDataEntity(
          value: current.insideTemperature.value,
          units: current.insideTemperature.units,
        ),
        insideHumidity: ValueDataEntity(
          value: current.insideHumidity.value,
          units: current.insideHumidity.units,
        ),
      ),
      day: WeatherAggregationEntity(
        maxTemperature: ValueAggDataEntity(
          at: day.maxTemperature.at,
          value: day.maxTemperature.value,
          units: day.maxTemperature.units,
        ),
        minTemperature: ValueAggDataEntity(
          at: day.minTemperature.at,
          value: day.minTemperature.value,
          units: day.minTemperature.units,
        ),
        maxDewpoint: ValueAggDataEntity(
          at: day.maxDewpoint.at,
          value: day.maxDewpoint.value,
          units: day.maxDewpoint.units,
        ),
        minDewpoint: ValueAggDataEntity(
          at: day.minDewpoint.at,
          value: day.minDewpoint.value,
          units: day.minDewpoint.units,
        ),
        maxHumidity: ValueAggDataEntity(
          at: day.maxHumidity.at,
          value: day.maxHumidity.value,
          units: day.maxHumidity.units,
        ),
        minHumidity: ValueAggDataEntity(
          at: day.minHumidity.at,
          value: day.minHumidity.value,
          units: day.minHumidity.units,
        ),
        maxBarometer: ValueAggDataEntity(
          at: day.maxBarometer.at,
          value: day.maxBarometer.value,
          units: day.maxBarometer.units,
        ),
        minBarometer: ValueAggDataEntity(
          at: day.minBarometer.at,
          value: day.minBarometer.value,
          units: day.minBarometer.units,
        ),
        maxWindSpeed: ValueAggDataEntity(
          at: day.maxWindSpeed.at,
          value: day.maxWindSpeed.value,
          units: day.maxWindSpeed.units,
        ),
        maxWindGust: ValueAggDataEntity(
          at: day.maxWindGust.at,
          value: day.maxWindGust.value,
          units: day.maxWindGust.units,
        ),
        maxRainRate: ValueAggDataEntity(
          at: day.maxRainRate.at,
          value: day.maxRainRate.value,
          units: day.maxRainRate.units,
        ),
        rainTotal: ValueAggDataEntity(
          at: '',
          value: day.rainTotal.value,
          units: day.rainTotal.units,
        ),
        maxInsideTemperature: ValueAggDataEntity(
          at: day.maxInsideTemperature.at,
          value: day.maxInsideTemperature.value,
          units: day.maxInsideTemperature.units,
        ),
        minInsideTemperature: ValueAggDataEntity(
          at: day.minInsideTemperature.at,
          value: day.minInsideTemperature.value,
          units: day.minInsideTemperature.units,
        ),
        maxInsideHumidity: ValueAggDataEntity(
          at: day.maxInsideHumidity.at,
          value: day.maxInsideHumidity.value,
          units: day.maxInsideHumidity.units,
        ),
        minInsideHumidity: ValueAggDataEntity(
          at: day.minInsideHumidity.at,
          value: day.minInsideHumidity.value,
          units: day.minInsideHumidity.units,
        ),
      ),
      week: WeatherAggregationEntity(
        maxTemperature: ValueAggDataEntity(
          at: week.maxTemperature.at,
          value: week.maxTemperature.value,
          units: week.maxTemperature.units,
        ),
        minTemperature: ValueAggDataEntity(
          at: week.minTemperature.at,
          value: week.minTemperature.value,
          units: week.minTemperature.units,
        ),
        maxDewpoint: ValueAggDataEntity(
          at: week.maxDewpoint.at,
          value: week.maxDewpoint.value,
          units: week.maxDewpoint.units,
        ),
        minDewpoint: ValueAggDataEntity(
          at: week.minDewpoint.at,
          value: week.minDewpoint.value,
          units: week.minDewpoint.units,
        ),
        maxHumidity: ValueAggDataEntity(
          at: week.maxHumidity.at,
          value: week.maxHumidity.value,
          units: week.maxHumidity.units,
        ),
        minHumidity: ValueAggDataEntity(
          at: week.minHumidity.at,
          value: week.minHumidity.value,
          units: week.minHumidity.units,
        ),
        maxBarometer: ValueAggDataEntity(
          at: week.maxBarometer.at,
          value: week.maxBarometer.value,
          units: week.maxBarometer.units,
        ),
        minBarometer: ValueAggDataEntity(
          at: week.minBarometer.at,
          value: week.minBarometer.value,
          units: week.minBarometer.units,
        ),
        maxWindSpeed: ValueAggDataEntity(
          at: week.maxWindSpeed.at,
          value: week.maxWindSpeed.value,
          units: week.maxWindSpeed.units,
        ),
        maxWindGust: ValueAggDataEntity(
          at: week.maxWindGust.at,
          value: week.maxWindGust.value,
          units: week.maxWindGust.units,
        ),
        maxRainRate: ValueAggDataEntity(
          at: week.maxRainRate.at,
          value: week.maxRainRate.value,
          units: week.maxRainRate.units,
        ),
        rainTotal: ValueAggDataEntity(
          at: '',
          value: week.rainTotal.value,
          units: week.rainTotal.units,
        ),
        maxInsideTemperature: ValueAggDataEntity(
          at: week.maxInsideTemperature.at,
          value: week.maxInsideTemperature.value,
          units: week.maxInsideTemperature.units,
        ),
        minInsideTemperature: ValueAggDataEntity(
          at: week.minInsideTemperature.at,
          value: week.minInsideTemperature.value,
          units: week.minInsideTemperature.units,
        ),
        maxInsideHumidity: ValueAggDataEntity(
          at: week.maxInsideHumidity.at,
          value: week.maxInsideHumidity.value,
          units: week.maxInsideHumidity.units,
        ),
        minInsideHumidity: ValueAggDataEntity(
          at: week.minInsideHumidity.at,
          value: week.minInsideHumidity.value,
          units: week.minInsideHumidity.units,
        ),
      ),
      month: WeatherAggregationEntity(
        maxTemperature: ValueAggDataEntity(
          at: month.maxTemperature.at,
          value: month.maxTemperature.value,
          units: month.maxTemperature.units,
        ),
        minTemperature: ValueAggDataEntity(
          at: month.minTemperature.at,
          value: month.minTemperature.value,
          units: month.minTemperature.units,
        ),
        maxDewpoint: ValueAggDataEntity(
          at: month.maxDewpoint.at,
          value: month.maxDewpoint.value,
          units: month.maxDewpoint.units,
        ),
        minDewpoint: ValueAggDataEntity(
          at: month.minDewpoint.at,
          value: month.minDewpoint.value,
          units: month.minDewpoint.units,
        ),
        maxHumidity: ValueAggDataEntity(
          at: month.maxHumidity.at,
          value: month.maxHumidity.value,
          units: month.maxHumidity.units,
        ),
        minHumidity: ValueAggDataEntity(
          at: month.minHumidity.at,
          value: month.minHumidity.value,
          units: month.minHumidity.units,
        ),
        maxBarometer: ValueAggDataEntity(
          at: month.maxBarometer.at,
          value: month.maxBarometer.value,
          units: month.maxBarometer.units,
        ),
        minBarometer: ValueAggDataEntity(
          at: month.minBarometer.at,
          value: month.minBarometer.value,
          units: month.minBarometer.units,
        ),
        maxWindSpeed: ValueAggDataEntity(
          at: month.maxWindSpeed.at,
          value: month.maxWindSpeed.value,
          units: month.maxWindSpeed.units,
        ),
        maxWindGust: ValueAggDataEntity(
          at: month.maxWindGust.at,
          value: month.maxWindGust.value,
          units: month.maxWindGust.units,
        ),
        maxRainRate: ValueAggDataEntity(
          at: month.maxRainRate.at,
          value: month.maxRainRate.value,
          units: month.maxRainRate.units,
        ),
        rainTotal: ValueAggDataEntity(
          at: '',
          value: month.rainTotal.value,
          units: month.rainTotal.units,
        ),
        maxInsideTemperature: ValueAggDataEntity(
          at: month.maxInsideTemperature.at,
          value: month.maxInsideTemperature.value,
          units: month.maxInsideTemperature.units,
        ),
        minInsideTemperature: ValueAggDataEntity(
          at: month.minInsideTemperature.at,
          value: month.minInsideTemperature.value,
          units: month.minInsideTemperature.units,
        ),
        maxInsideHumidity: ValueAggDataEntity(
          at: month.maxInsideHumidity.at,
          value: month.maxInsideHumidity.value,
          units: month.maxInsideHumidity.units,
        ),
        minInsideHumidity: ValueAggDataEntity(
          at: month.minInsideHumidity.at,
          value: month.minInsideHumidity.value,
          units: month.minInsideHumidity.units,
        ),
      ),
      year: WeatherAggregationEntity(
        maxTemperature: ValueAggDataEntity(
          at: year.maxTemperature.at,
          value: year.maxTemperature.value,
          units: year.maxTemperature.units,
        ),
        minTemperature: ValueAggDataEntity(
          at: year.minTemperature.at,
          value: year.minTemperature.value,
          units: year.minTemperature.units,
        ),
        maxDewpoint: ValueAggDataEntity(
          at: year.maxDewpoint.at,
          value: year.maxDewpoint.value,
          units: year.maxDewpoint.units,
        ),
        minDewpoint: ValueAggDataEntity(
          at: year.minDewpoint.at,
          value: year.minDewpoint.value,
          units: year.minDewpoint.units,
        ),
        maxHumidity: ValueAggDataEntity(
          at: year.maxHumidity.at,
          value: year.maxHumidity.value,
          units: year.maxHumidity.units,
        ),
        minHumidity: ValueAggDataEntity(
          at: year.minHumidity.at,
          value: year.minHumidity.value,
          units: year.minHumidity.units,
        ),
        maxBarometer: ValueAggDataEntity(
          at: year.maxBarometer.at,
          value: year.maxBarometer.value,
          units: year.maxBarometer.units,
        ),
        minBarometer: ValueAggDataEntity(
          at: year.minBarometer.at,
          value: year.minBarometer.value,
          units: year.minBarometer.units,
        ),
        maxWindSpeed: ValueAggDataEntity(
          at: year.maxWindSpeed.at,
          value: year.maxWindSpeed.value,
          units: year.maxWindSpeed.units,
        ),
        maxWindGust: ValueAggDataEntity(
          at: year.maxWindGust.at,
          value: year.maxWindGust.value,
          units: year.maxWindGust.units,
        ),
        maxRainRate: ValueAggDataEntity(
          at: year.maxRainRate.at,
          value: year.maxRainRate.value,
          units: year.maxRainRate.units,
        ),
        rainTotal: ValueAggDataEntity(
          at: '',
          value: year.rainTotal.value,
          units: year.rainTotal.units,
        ),
        maxInsideTemperature: ValueAggDataEntity(
          at: year.maxInsideTemperature.at,
          value: year.maxInsideTemperature.value,
          units: year.maxInsideTemperature.units,
        ),
        minInsideTemperature: ValueAggDataEntity(
          at: year.minInsideTemperature.at,
          value: year.minInsideTemperature.value,
          units: year.minInsideTemperature.units,
        ),
        maxInsideHumidity: ValueAggDataEntity(
          at: year.maxInsideHumidity.at,
          value: year.maxInsideHumidity.value,
          units: year.maxInsideHumidity.units,
        ),
        minInsideHumidity: ValueAggDataEntity(
          at: year.minInsideHumidity.at,
          value: year.minInsideHumidity.value,
          units: year.minInsideHumidity.units,
        ),
      ),
    );
  }
}
