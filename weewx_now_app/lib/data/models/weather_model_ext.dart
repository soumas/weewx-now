import 'package:weewx_now/data/models/weather_model.dart';
import 'package:weewx_now/domain/entities/weather/value_agg_data.dart';
import 'package:weewx_now/domain/entities/weather/value_data.dart';
import 'package:weewx_now/domain/entities/weather/weather_aggregation.dart';
import 'package:weewx_now/domain/entities/weather/weather_current.dart';
import 'package:weewx_now/domain/entities/weather/weather_data.dart';

extension WeatherModelModelExt on WeatherModel {
  WeatherData toEntity() {
    return WeatherData(
      current: WeatherCurrent(
        generation: DateTime.parse(current.generation),
        temperature: ValueData(
          value: current.temperature.value,
          units: current.temperature.units,
        ),
        dewpoint: ValueData(
          value: current.dewpoint.value,
          units: current.dewpoint.units,
        ),
        humidity: ValueData(
          value: current.humidity.value,
          units: current.humidity.units,
        ),
        heatIndex: ValueData(
          value: current.heatIndex.value,
          units: current.heatIndex.units,
        ),
        barometer: ValueData(
          value: current.barometer.value,
          units: current.barometer.units,
        ),
        windSpeed: ValueData(
          value: current.windSpeed.value,
          units: current.windSpeed.units,
        ),
        windGust: ValueData(
          value: current.windGust.value,
          units: current.windGust.units,
        ),
        windDirection: ValueData(
          value: current.windDirection.value,
          units: current.windDirection.units,
        ),
        windChill: ValueData(
          value: current.windChill.value,
          units: current.windChill.units,
        ),
        rainRate: ValueData(
          value: current.rainRate.value,
          units: current.rainRate.units,
        ),
        insideTemperature: ValueData(
          value: current.insideTemperature.value,
          units: current.insideTemperature.units,
        ),
        insideHumidity: ValueData(
          value: current.insideHumidity.value,
          units: current.insideHumidity.units,
        ),
      ),
      day: WeatherAggregation(
        maxTemperature: ValueAggData(
          at: day.maxTemperature.at,
          value: day.maxTemperature.value,
          units: day.maxTemperature.units,
        ),
        minTemperature: ValueAggData(
          at: day.minTemperature.at,
          value: day.minTemperature.value,
          units: day.minTemperature.units,
        ),
        maxDewpoint: ValueAggData(
          at: day.maxDewpoint.at,
          value: day.maxDewpoint.value,
          units: day.maxDewpoint.units,
        ),
        minDewpoint: ValueAggData(
          at: day.minDewpoint.at,
          value: day.minDewpoint.value,
          units: day.minDewpoint.units,
        ),
        maxHumidity: ValueAggData(
          at: day.maxHumidity.at,
          value: day.maxHumidity.value,
          units: day.maxHumidity.units,
        ),
        minHumidity: ValueAggData(
          at: day.minHumidity.at,
          value: day.minHumidity.value,
          units: day.minHumidity.units,
        ),
        maxBarometer: ValueAggData(
          at: day.maxBarometer.at,
          value: day.maxBarometer.value,
          units: day.maxBarometer.units,
        ),
        minBarometer: ValueAggData(
          at: day.minBarometer.at,
          value: day.minBarometer.value,
          units: day.minBarometer.units,
        ),
        maxWindSpeed: ValueAggData(
          at: day.maxWindSpeed.at,
          value: day.maxWindSpeed.value,
          units: day.maxWindSpeed.units,
        ),
        maxWindGust: ValueAggData(
          at: day.maxWindGust.at,
          value: day.maxWindGust.value,
          units: day.maxWindGust.units,
        ),
        maxRainRate: ValueAggData(
          at: day.maxRainRate.at,
          value: day.maxRainRate.value,
          units: day.maxRainRate.units,
        ),
        rainTotal: ValueAggData(
          at: '',
          value: day.rainTotal.value,
          units: day.rainTotal.units,
        ),
        maxInsideTemperature: ValueAggData(
          at: day.maxInsideTemperature.at,
          value: day.maxInsideTemperature.value,
          units: day.maxInsideTemperature.units,
        ),
        minInsideTemperature: ValueAggData(
          at: day.minInsideTemperature.at,
          value: day.minInsideTemperature.value,
          units: day.minInsideTemperature.units,
        ),
        maxInsideHumidity: ValueAggData(
          at: day.maxInsideHumidity.at,
          value: day.maxInsideHumidity.value,
          units: day.maxInsideHumidity.units,
        ),
        minInsideHumidity: ValueAggData(
          at: day.minInsideHumidity.at,
          value: day.minInsideHumidity.value,
          units: day.minInsideHumidity.units,
        ),
      ),
      week: WeatherAggregation(
        maxTemperature: ValueAggData(
          at: week.maxTemperature.at,
          value: week.maxTemperature.value,
          units: week.maxTemperature.units,
        ),
        minTemperature: ValueAggData(
          at: week.minTemperature.at,
          value: week.minTemperature.value,
          units: week.minTemperature.units,
        ),
        maxDewpoint: ValueAggData(
          at: week.maxDewpoint.at,
          value: week.maxDewpoint.value,
          units: week.maxDewpoint.units,
        ),
        minDewpoint: ValueAggData(
          at: week.minDewpoint.at,
          value: week.minDewpoint.value,
          units: week.minDewpoint.units,
        ),
        maxHumidity: ValueAggData(
          at: week.maxHumidity.at,
          value: week.maxHumidity.value,
          units: week.maxHumidity.units,
        ),
        minHumidity: ValueAggData(
          at: week.minHumidity.at,
          value: week.minHumidity.value,
          units: week.minHumidity.units,
        ),
        maxBarometer: ValueAggData(
          at: week.maxBarometer.at,
          value: week.maxBarometer.value,
          units: week.maxBarometer.units,
        ),
        minBarometer: ValueAggData(
          at: week.minBarometer.at,
          value: week.minBarometer.value,
          units: week.minBarometer.units,
        ),
        maxWindSpeed: ValueAggData(
          at: week.maxWindSpeed.at,
          value: week.maxWindSpeed.value,
          units: week.maxWindSpeed.units,
        ),
        maxWindGust: ValueAggData(
          at: week.maxWindGust.at,
          value: week.maxWindGust.value,
          units: week.maxWindGust.units,
        ),
        maxRainRate: ValueAggData(
          at: week.maxRainRate.at,
          value: week.maxRainRate.value,
          units: week.maxRainRate.units,
        ),
        rainTotal: ValueAggData(
          at: '',
          value: week.rainTotal.value,
          units: week.rainTotal.units,
        ),
        maxInsideTemperature: ValueAggData(
          at: week.maxInsideTemperature.at,
          value: week.maxInsideTemperature.value,
          units: week.maxInsideTemperature.units,
        ),
        minInsideTemperature: ValueAggData(
          at: week.minInsideTemperature.at,
          value: week.minInsideTemperature.value,
          units: week.minInsideTemperature.units,
        ),
        maxInsideHumidity: ValueAggData(
          at: week.maxInsideHumidity.at,
          value: week.maxInsideHumidity.value,
          units: week.maxInsideHumidity.units,
        ),
        minInsideHumidity: ValueAggData(
          at: week.minInsideHumidity.at,
          value: week.minInsideHumidity.value,
          units: week.minInsideHumidity.units,
        ),
      ),
      month: WeatherAggregation(
        maxTemperature: ValueAggData(
          at: month.maxTemperature.at,
          value: month.maxTemperature.value,
          units: month.maxTemperature.units,
        ),
        minTemperature: ValueAggData(
          at: month.minTemperature.at,
          value: month.minTemperature.value,
          units: month.minTemperature.units,
        ),
        maxDewpoint: ValueAggData(
          at: month.maxDewpoint.at,
          value: month.maxDewpoint.value,
          units: month.maxDewpoint.units,
        ),
        minDewpoint: ValueAggData(
          at: month.minDewpoint.at,
          value: month.minDewpoint.value,
          units: month.minDewpoint.units,
        ),
        maxHumidity: ValueAggData(
          at: month.maxHumidity.at,
          value: month.maxHumidity.value,
          units: month.maxHumidity.units,
        ),
        minHumidity: ValueAggData(
          at: month.minHumidity.at,
          value: month.minHumidity.value,
          units: month.minHumidity.units,
        ),
        maxBarometer: ValueAggData(
          at: month.maxBarometer.at,
          value: month.maxBarometer.value,
          units: month.maxBarometer.units,
        ),
        minBarometer: ValueAggData(
          at: month.minBarometer.at,
          value: month.minBarometer.value,
          units: month.minBarometer.units,
        ),
        maxWindSpeed: ValueAggData(
          at: month.maxWindSpeed.at,
          value: month.maxWindSpeed.value,
          units: month.maxWindSpeed.units,
        ),
        maxWindGust: ValueAggData(
          at: month.maxWindGust.at,
          value: month.maxWindGust.value,
          units: month.maxWindGust.units,
        ),
        maxRainRate: ValueAggData(
          at: month.maxRainRate.at,
          value: month.maxRainRate.value,
          units: month.maxRainRate.units,
        ),
        rainTotal: ValueAggData(
          at: '',
          value: month.rainTotal.value,
          units: month.rainTotal.units,
        ),
        maxInsideTemperature: ValueAggData(
          at: month.maxInsideTemperature.at,
          value: month.maxInsideTemperature.value,
          units: month.maxInsideTemperature.units,
        ),
        minInsideTemperature: ValueAggData(
          at: month.minInsideTemperature.at,
          value: month.minInsideTemperature.value,
          units: month.minInsideTemperature.units,
        ),
        maxInsideHumidity: ValueAggData(
          at: month.maxInsideHumidity.at,
          value: month.maxInsideHumidity.value,
          units: month.maxInsideHumidity.units,
        ),
        minInsideHumidity: ValueAggData(
          at: month.minInsideHumidity.at,
          value: month.minInsideHumidity.value,
          units: month.minInsideHumidity.units,
        ),
      ),
      year: WeatherAggregation(
        maxTemperature: ValueAggData(
          at: year.maxTemperature.at,
          value: year.maxTemperature.value,
          units: year.maxTemperature.units,
        ),
        minTemperature: ValueAggData(
          at: year.minTemperature.at,
          value: year.minTemperature.value,
          units: year.minTemperature.units,
        ),
        maxDewpoint: ValueAggData(
          at: year.maxDewpoint.at,
          value: year.maxDewpoint.value,
          units: year.maxDewpoint.units,
        ),
        minDewpoint: ValueAggData(
          at: year.minDewpoint.at,
          value: year.minDewpoint.value,
          units: year.minDewpoint.units,
        ),
        maxHumidity: ValueAggData(
          at: year.maxHumidity.at,
          value: year.maxHumidity.value,
          units: year.maxHumidity.units,
        ),
        minHumidity: ValueAggData(
          at: year.minHumidity.at,
          value: year.minHumidity.value,
          units: year.minHumidity.units,
        ),
        maxBarometer: ValueAggData(
          at: year.maxBarometer.at,
          value: year.maxBarometer.value,
          units: year.maxBarometer.units,
        ),
        minBarometer: ValueAggData(
          at: year.minBarometer.at,
          value: year.minBarometer.value,
          units: year.minBarometer.units,
        ),
        maxWindSpeed: ValueAggData(
          at: year.maxWindSpeed.at,
          value: year.maxWindSpeed.value,
          units: year.maxWindSpeed.units,
        ),
        maxWindGust: ValueAggData(
          at: year.maxWindGust.at,
          value: year.maxWindGust.value,
          units: year.maxWindGust.units,
        ),
        maxRainRate: ValueAggData(
          at: year.maxRainRate.at,
          value: year.maxRainRate.value,
          units: year.maxRainRate.units,
        ),
        rainTotal: ValueAggData(
          at: '',
          value: year.rainTotal.value,
          units: year.rainTotal.units,
        ),
        maxInsideTemperature: ValueAggData(
          at: year.maxInsideTemperature.at,
          value: year.maxInsideTemperature.value,
          units: year.maxInsideTemperature.units,
        ),
        minInsideTemperature: ValueAggData(
          at: year.minInsideTemperature.at,
          value: year.minInsideTemperature.value,
          units: year.minInsideTemperature.units,
        ),
        maxInsideHumidity: ValueAggData(
          at: year.maxInsideHumidity.at,
          value: year.maxInsideHumidity.value,
          units: year.maxInsideHumidity.units,
        ),
        minInsideHumidity: ValueAggData(
          at: year.minInsideHumidity.at,
          value: year.minInsideHumidity.value,
          units: year.minInsideHumidity.units,
        ),
      ),
    );
  }
}
