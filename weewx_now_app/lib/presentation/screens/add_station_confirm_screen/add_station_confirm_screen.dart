import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weewx_now/injection.dart';
import 'package:weewx_now/presentation/bloc/add_station_confirm_screen/add_station_confirm_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/add_station_precheck_screen/add_station_precheck_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/weewx_endpoint/weewx_endpoint_cubit.dart';
import 'package:weewx_now/presentation/widgets/weewx_now_scaffold.dart';

class AddStationConfirmScreen extends StatelessWidget {
  const AddStationConfirmScreen({super.key, required this.precheckResult});

  static const routeName = 'addStationConfirmScreen';

  final AddStationPrecheckSuccess precheckResult;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<AddStationConfirmScreenBloc>(),
      child: BlocListener<AddStationConfirmScreenBloc, AddStationConfirmScreenState>(
        listener: (context, state) {
          if (state is AddStationConfirmed) {
            context.read<CurrentEndpointCubit>().selectEndpoint(state.endpoint);
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        },
        child: Builder(builder: (context) {
          return WeeWxNowScaffold(
            appBar: PlatformAppBar(title: Text('Hinzufügen bestätigen')),
            child: ListView(
              children: [
                PlatformListTile(
                  title: Text('Internetadressse'),
                  subtitle: Row(
                    children: [
                      Text(precheckResult.endpointUrl),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          PlatformIcons(context).checkMark,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                PlatformListTile(
                  title: Text('Standort'),
                  subtitle: Text(precheckResult.weeWxConfig.station.location),
                ),
                PlatformListTile(
                  title: Text('Position'),
                  subtitle: Row(
                    children: [
                      Text('Lat = ${precheckResult.weeWxConfig.station.latitude}, Lon = ${precheckResult.weeWxConfig.station.longitude}'),
                      PlatformIconButton(
                          icon: const Icon(Icons.public),
                          onPressed: () {
                            launchUrl(Uri.parse(
                                'https://www.openstreetmap.org/?mlat=${precheckResult.weeWxConfig.station.latitude}&mlon=${precheckResult.weeWxConfig.station.longitude}'));
                          }),
                    ],
                  ),
                ),
                PlatformListTile(
                  title: Text('Betreiber'),
                  subtitle: Text(precheckResult.weeWxConfig.station.location),
                ),
                PlatformListTile(
                  title: Text('Nutzungsbedingungen'),
                  subtitle: Text(precheckResult.weeWxConfig.station.location),
                ),
                PlatformListTile(
                  title: Row(
                    children: [
                      PlatformElevatedButton(
                        child: Text('Station hinzufügen'),
                        onPressed: () {
                          context
                              .read<AddStationConfirmScreenBloc>()
                              .add(ConfirmAddStation(url: precheckResult.endpointUrl, name: precheckResult.weeWxConfig.station.location));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
