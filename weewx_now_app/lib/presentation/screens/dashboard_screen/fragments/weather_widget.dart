import 'package:flutter/material.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Text('WeatherWidget'),
    );
    // const windRoseSize = 65.0;
    // return BlocBuilder<DashboardScreenBloc, DashboardScreenState>(
    //   builder: (context, state) {
    //     if (state is DashboardData) {
    //       return Column(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.only(top: 20),
    //             child: Row(
    //               children: [
    //                 SizedBox(
    //                   width: MediaQuery.of(context).size.width / 2,
    //                   child: Center(
    //                     child: Column(
    //                       children: [
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             const Icon(Icons.thermostat),
    //                             Text(
    //                               '16,8 °C',
    //                               style: Theme.of(context).textTheme.headlineLarge,
    //                             ),
    //                           ],
    //                         ),
    //                         Text('Feels like: 13,7 °C', style: Theme.of(context).textTheme.bodyMedium)
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   width: MediaQuery.of(context).size.width / 2,
    //                   child: Center(
    //                     child: Row(
    //                       children: [
    //                         Column(
    //                           children: [
    //                             Text(
    //                               '1,3 km/h',
    //                               style: Theme.of(context).textTheme.headlineLarge,
    //                             ),
    //                             Text('Gust: 13,4 km/h', style: Theme.of(context).textTheme.bodyMedium),
    //                           ],
    //                         ),
    //                         Stack(
    //                           children: [
    //                             Container(
    //                               width: windRoseSize,
    //                               height: windRoseSize,
    //                               decoration: BoxDecoration(
    //                                 shape: BoxShape.circle,
    //                                 border: Border.all(color: Colors.blue, width: 5),
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               width: windRoseSize,
    //                               height: windRoseSize,
    //                               child: Column(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 children: [
    //                                   Text(
    //                                     'SW',
    //                                     style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
    //                                   ),
    //                                   Text(
    //                                     '${state.weather.current.windDirection.value.round()}${state.weather.current.windDirection.units}',
    //                                     style: Theme.of(context).textTheme.labelSmall,
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                             Transform.rotate(
    //                               angle: state.weather.current.windDirection.value * math.pi / 180,
    //                               child: Container(
    //                                 width: windRoseSize,
    //                                 height: windRoseSize,
    //                                 child: Align(
    //                                   alignment: Alignment.topCenter,
    //                                   child: Text(
    //                                     '▼',
    //                                     style: TextStyle(
    //                                       color: Colors.blue,
    //                                       fontWeight: FontWeight.bold,
    //                                       fontSize: 11,
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           const Text('12.11.2023, 15:36 Uhr'),
    //           const Divider(),
    //           PlatformListTile(
    //             title: Text(
    //               'Zusammenfassung',
    //               style: Theme.of(context).textTheme.headlineSmall,
    //             ),
    //             trailing: PlatformPopupMenu(
    //               icon: Row(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   Text(_evalTimePeriodLabel(state.selectedTimePeriod)),
    //                   const Icon(Icons.arrow_drop_down),
    //                 ],
    //               ),
    //               options: [
    //                 PopupMenuOption(
    //                     label: _evalTimePeriodLabel(TimePeriod.day),
    //                     onTap: (_) => context.read<DashboardScreenBloc>().add(SelectTimePeriod(timePeriod: TimePeriod.day))),
    //                 PopupMenuOption(
    //                     label: _evalTimePeriodLabel(TimePeriod.week),
    //                     onTap: (_) => context.read<DashboardScreenBloc>().add(SelectTimePeriod(timePeriod: TimePeriod.week))),
    //                 PopupMenuOption(
    //                     label: _evalTimePeriodLabel(TimePeriod.month),
    //                     onTap: (_) => context.read<DashboardScreenBloc>().add(SelectTimePeriod(timePeriod: TimePeriod.month))),
    //                 PopupMenuOption(
    //                     label: _evalTimePeriodLabel(TimePeriod.year),
    //                     onTap: (_) => context.read<DashboardScreenBloc>().add(SelectTimePeriod(timePeriod: TimePeriod.year))),
    //               ],
    //             ),
    //           ),
    //           PlatformListTile(
    //             title: _buildValueTable(state, state.selectedTimePeriod),
    //           ),
    //           PlatformListTile(
    //             title: Column(children: [
    //               //Image.network('${state.endpoint.url}/dayET.png'),
    //               AspectRatio(
    //                 aspectRatio: 16 / 7,
    //                 child: Image.network(
    //                     '${state.endpoint.url}/${state.selectedTimePeriod.name}barometer.png?reload=${state.weather.current.generation.millisecondsSinceEpoch}'),
    //               ),
    //               AspectRatio(
    //                 aspectRatio: 16 / 7,
    //                 child: Image.network(
    //                     '${state.endpoint.url}/${state.selectedTimePeriod.name}tempdew.png?reload=${state.weather.current.generation.millisecondsSinceEpoch}'),
    //               ),
    //               AspectRatio(
    //                 aspectRatio: 16 / 7,
    //                 child: Image.network(
    //                     '${state.endpoint.url}/${state.selectedTimePeriod.name}tempfeel.png?reload=${state.weather.current.generation.millisecondsSinceEpoch}'),
    //               ),
    //               AspectRatio(
    //                 aspectRatio: 16 / 7,
    //                 child: Image.network(
    //                     '${state.endpoint.url}/${state.selectedTimePeriod.name}hum.png?reload=${state.weather.current.generation.millisecondsSinceEpoch}'),
    //               ),
    //               AspectRatio(
    //                 aspectRatio: 16 / 7,
    //                 child: Image.network(
    //                     '${state.endpoint.url}/${state.selectedTimePeriod.name}wind.png?reload=${state.weather.current.generation.millisecondsSinceEpoch}'),
    //               ),
    //               AspectRatio(
    //                 aspectRatio: 16 / 7,
    //                 child: Image.network(
    //                     '${state.endpoint.url}/${state.selectedTimePeriod.name}winddir.png?reload=${state.weather.current.generation.millisecondsSinceEpoch}'),
    //               ),
    //               AspectRatio(
    //                 aspectRatio: 16 / 7,
    //                 child: Image.network(
    //                     '${state.endpoint.url}/${state.selectedTimePeriod.name}windvec.png?reload=${state.weather.current.generation.millisecondsSinceEpoch}'),
    //               ),
    //               AspectRatio(
    //                 aspectRatio: 16 / 7,
    //                 child: Image.network(
    //                     '${state.endpoint.url}/${state.selectedTimePeriod.name}UV.png?reload=${state.weather.current.generation.millisecondsSinceEpoch}'),
    //               ),
    //               AspectRatio(
    //                 aspectRatio: 16 / 7,
    //                 child: Image.network(
    //                     '${state.endpoint.url}/${state.selectedTimePeriod.name}tempin.png?reload=${state.weather.current.generation.millisecondsSinceEpoch}'),
    //               ),
    //               AspectRatio(
    //                 aspectRatio: 16 / 7,
    //                 child: Image.network(
    //                     '${state.endpoint.url}/${state.selectedTimePeriod.name}humin.png?reload=${state.weather.current.generation.millisecondsSinceEpoch}'),
    //               ),
    //             ]),
    //           )
    //         ],
    //       );
    //     }
    //     return const SizedBox();
    //   },
    // );
  }

  // String _evalTimePeriodLabel(TimePeriod selectedTimePeriod) {
  //   switch (selectedTimePeriod) {
  //     case TimePeriod.day:
  //       return AppLocalizations.of(context)!.timePeriodDay;
  //     case TimePeriod.week:
  //       return AppLocalizations.of(context)!.timePeriodWeek;
  //     case TimePeriod.month:
  //       return AppLocalizations.of(context)!.timePeriodMonth;
  //     case TimePeriod.year:
  //       return AppLocalizations.of(context)!.timePeriodYear;
  //     default:
  //       return '';
  //   }
  // }

  // _buildValueTable(DashboardData data, TimePeriod selectedTimePeriod) {
  //   switch (selectedTimePeriod) {
  //     case TimePeriod.day:
  //       return KeyValueTable(
  //         keyValuePairs: <String, String>{
  //           'Outside Temperature': _minMax(data.weather.day.minTemperature, data.weather.day.maxTemperature),
  //           'Dew Point': _minMax(data.weather.day.minDewpoint, data.weather.day.maxDewpoint),
  //           'Outside Humidity': _minMax(data.weather.day.minHumidity, data.weather.day.maxHumidity, fractionDigits: 0),
  //           'Barometer': _minMax(data.weather.day.minBarometer, data.weather.day.maxBarometer),
  //           'Wind Speed': _minMax(data.weather.day.maxWindSpeed, null),
  //           'Wind Gust': _minMax(data.weather.day.maxWindGust, data.weather.day.maxWindGust),
  //           'Rain Today': _minMax(data.weather.day.rainTotal, null),
  //           'Rain Rate': _minMax(data.weather.day.maxRainRate, null),
  //           'Inside Temperature': _minMax(data.weather.day.minInsideTemperature, data.weather.day.maxInsideTemperature),
  //           'Inside Humidity': _minMax(data.weather.day.minInsideHumidity, data.weather.day.maxInsideHumidity),
  //         },
  //       );
  //     case TimePeriod.week:
  //       return KeyValueTable(
  //         keyValuePairs: <String, String>{
  //           'Outside Temperature': _minMax(data.weather.week.minTemperature, data.weather.week.maxTemperature),
  //           'Dew Point': _minMax(data.weather.week.minDewpoint, data.weather.week.maxDewpoint),
  //           'Outside Humidity': _minMax(data.weather.week.minHumidity, data.weather.week.maxHumidity, fractionDigits: 0),
  //           'Barometer': _minMax(data.weather.week.minBarometer, data.weather.week.maxBarometer),
  //           'Wind Speed': _minMax(data.weather.week.maxWindSpeed, null),
  //           'Wind Gust': _minMax(data.weather.week.maxWindGust, data.weather.week.maxWindGust),
  //           'Rain Today': _minMax(data.weather.week.rainTotal, null),
  //           'Rain Rate': _minMax(data.weather.week.maxRainRate, null),
  //           'Inside Temperature': _minMax(data.weather.week.minInsideTemperature, data.weather.week.maxInsideTemperature),
  //           'Inside Humidity': _minMax(data.weather.week.minInsideHumidity, data.weather.week.maxInsideHumidity),
  //         },
  //       );
  //     case TimePeriod.month:
  //       return KeyValueTable(
  //         keyValuePairs: <String, String>{
  //           'Outside Temperature': _minMax(data.weather.month.minTemperature, data.weather.month.maxTemperature),
  //           'Dew Point': _minMax(data.weather.month.minDewpoint, data.weather.month.maxDewpoint),
  //           'Outside Humidity': _minMax(data.weather.month.minHumidity, data.weather.month.maxHumidity, fractionDigits: 0),
  //           'Barometer': _minMax(data.weather.month.minBarometer, data.weather.month.maxBarometer),
  //           'Wind Speed': _minMax(data.weather.month.maxWindSpeed, null),
  //           'Wind Gust': _minMax(data.weather.month.maxWindGust, data.weather.month.maxWindGust),
  //           'Rain Today': _minMax(data.weather.month.rainTotal, null),
  //           'Rain Rate': _minMax(data.weather.month.maxRainRate, null),
  //           'Inside Temperature': _minMax(data.weather.month.minInsideTemperature, data.weather.month.maxInsideTemperature),
  //           'Inside Humidity': _minMax(data.weather.month.minInsideHumidity, data.weather.month.maxInsideHumidity),
  //         },
  //       );
  //     case TimePeriod.year:
  //       return KeyValueTable(
  //         keyValuePairs: <String, String>{
  //           'Outside Temperature': _minMax(data.weather.year.minTemperature, data.weather.year.maxTemperature),
  //           'Dew Point': _minMax(data.weather.year.minDewpoint, data.weather.year.maxDewpoint),
  //           'Outside Humidity': _minMax(data.weather.year.minHumidity, data.weather.year.maxHumidity, fractionDigits: 0),
  //           'Barometer': _minMax(data.weather.year.minBarometer, data.weather.year.maxBarometer),
  //           'Wind Speed': _minMax(data.weather.year.maxWindSpeed, null),
  //           'Wind Gust': _minMax(data.weather.year.maxWindGust, data.weather.year.maxWindGust),
  //           'Rain Today': _minMax(data.weather.year.rainTotal, null),
  //           'Rain Rate': _minMax(data.weather.year.maxRainRate, null),
  //           'Inside Temperature': _minMax(data.weather.year.minInsideTemperature, data.weather.year.maxInsideTemperature),
  //           'Inside Humidity': _minMax(data.weather.year.minInsideHumidity, data.weather.year.maxInsideHumidity),
  //         },
  //       );
  //   }
  // }

  // _minMax(AggDataEntry min, AggDataEntry? max, {fractionDigits = 1}) {
  //   return max != null
  //       ? '${max.value.toStringAsFixed(fractionDigits)} ${max.units}\n${min.value.toStringAsFixed(fractionDigits)} ${min.units}'
  //       : '${min.value.toStringAsFixed(fractionDigits)} ${min.units}';
  // }
}
