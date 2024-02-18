import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weewx_now/domain/entities/weather/time_period.dart';
import 'package:weewx_now/presentation/bloc/dashboard_screen/dashboard_screen_bloc.dart';
import 'package:weewx_now/presentationOLD/widgets/key_value_table.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    const windRoseSize = 70.0;
    return BlocBuilder<DashboardScreenBloc, DashboardScreenState>(
      builder: (context, state) {
        if (state is DashboardData) {
          return Column(children: [
            PlatformListTile(
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            '16,8 °C',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Text('Feels like: 13,7 °C'),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text('High'),
                                  Text('18,4 °C'),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Low'),
                                  Text('11,7 °C'),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: windRoseSize,
                                height: windRoseSize,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.blue, width: 4),
                                ),
                              ),
                              SizedBox(
                                width: windRoseSize,
                                height: windRoseSize,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'SW',
                                      style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${state.weather.current.windDirection.value.round()}${state.weather.current.windDirection.units}',
                                      style: Theme.of(context).textTheme.labelSmall,
                                    ),
                                  ],
                                ),
                              ),
                              Transform.rotate(
                                angle: state.weather.current.windDirection.value * math.pi / 180,
                                child: Container(
                                  width: windRoseSize,
                                  height: windRoseSize,
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      '▼',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text('Speed'),
                                  Text('1.3 km/h'),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Gust'),
                                  Text('11,2 km/h'),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Text('12.11.2023, 15:36 Uhr'),
                ],
              ),
            ),
            PlatformListTile(
              title: Text(
                'Zusammenfassung',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              trailing: PlatformPopupMenu(
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_evalTimePeriodLabel(state.selectedTimePeriod)),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
                options: [
                  PopupMenuOption(
                      label: _evalTimePeriodLabel(TimePeriod.day),
                      onTap: (_) => context.read<DashboardScreenBloc>().add(SelectTimePeriod(timePeriod: TimePeriod.day))),
                  PopupMenuOption(
                      label: _evalTimePeriodLabel(TimePeriod.week),
                      onTap: (_) => context.read<DashboardScreenBloc>().add(SelectTimePeriod(timePeriod: TimePeriod.week))),
                  PopupMenuOption(
                      label: _evalTimePeriodLabel(TimePeriod.month),
                      onTap: (_) => context.read<DashboardScreenBloc>().add(SelectTimePeriod(timePeriod: TimePeriod.month))),
                  PopupMenuOption(
                      label: _evalTimePeriodLabel(TimePeriod.year),
                      onTap: (_) => context.read<DashboardScreenBloc>().add(SelectTimePeriod(timePeriod: TimePeriod.year))),
                ],
              ),
            ),
            PlatformListTile(
              title: const KeyValueTable(
                keyValuePairs: <String, String>{
                  'Tracking Time': '12.11.2023 @ 15:36',
                  'Outside Temperature': '6.2°C',
                  'Heat Index': '4.7°C',
                  'Wind Chill': '6.2°C',
                  'Dew Point': '1.1°C',
                  'Outside Humidity': '70%',
                  'Barometer': '1007.6 mbar (-0.8)',
                  'Wind': '2 km/h ESE (112°)',
                  'Rain Today': '0.00 cm',
                  'Rain Rate': '0.00 cm/h',
                  'UV Index': '0.0',
                  'Radiation': '102 W/m²',
                  'Inside Temperature': '23.1°C',
                  'Inside Humidity': '35%',
                },
              ),
            ),
            PlatformListTile(
              title: Column(children: [
                //Image.network('${state.endpoint.url}/dayET.png'),
                AspectRatio(
                  aspectRatio: 16 / 7,
                  child: Image.network('https://meteo.fankyy.ch/WsSe2/${state.selectedTimePeriod.name}barometer.png'),
                ),
                AspectRatio(
                  aspectRatio: 16 / 7,
                  child: Image.network('https://meteo.fankyy.ch/WsSe2/${state.selectedTimePeriod.name}tempdew.png'),
                ),
                AspectRatio(
                  aspectRatio: 16 / 7,
                  child: Image.network('https://meteo.fankyy.ch/WsSe2/${state.selectedTimePeriod.name}tempfeel.png'),
                ),
                AspectRatio(
                  aspectRatio: 16 / 7,
                  child: Image.network('https://meteo.fankyy.ch/WsSe2/${state.selectedTimePeriod.name}hum.png'),
                ),
                AspectRatio(
                  aspectRatio: 16 / 7,
                  child: Image.network('https://meteo.fankyy.ch/WsSe2/${state.selectedTimePeriod.name}wind.png'),
                ),
                AspectRatio(
                  aspectRatio: 16 / 7,
                  child: Image.network('https://meteo.fankyy.ch/WsSe2/${state.selectedTimePeriod.name}winddir.png'),
                ),
                AspectRatio(
                  aspectRatio: 16 / 7,
                  child: Image.network('https://meteo.fankyy.ch/WsSe2/${state.selectedTimePeriod.name}windvec.png'),
                ),
                AspectRatio(
                  aspectRatio: 16 / 7,
                  child: Image.network('https://meteo.fankyy.ch/WsSe2/${state.selectedTimePeriod.name}UV.png'),
                ),
                AspectRatio(
                  aspectRatio: 16 / 7,
                  child: Image.network('https://meteo.fankyy.ch/WsSe2/${state.selectedTimePeriod.name}tempin.png'),
                ),
                AspectRatio(
                  aspectRatio: 16 / 7,
                  child: Image.network('https://meteo.fankyy.ch/WsSe2/${state.selectedTimePeriod.name}humin.png'),
                ),
              ]),
            )
          ]);
        }
        return const SizedBox();
      },
    );
  }

  String _evalTimePeriodLabel(TimePeriod selectedTimePeriod) {
    switch (selectedTimePeriod) {
      case TimePeriod.day:
        return AppLocalizations.of(context)!.timePeriodDay;
      case TimePeriod.week:
        return AppLocalizations.of(context)!.timePeriodWeek;
      case TimePeriod.month:
        return AppLocalizations.of(context)!.timePeriodMonth;
      case TimePeriod.year:
        return AppLocalizations.of(context)!.timePeriodYear;
      default:
        return '';
    }
  }
}
