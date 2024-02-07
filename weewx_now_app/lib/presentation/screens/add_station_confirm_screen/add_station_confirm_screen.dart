import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weewx_now/injection.dart';
import 'package:weewx_now/presentation/bloc/add_station_confirm_screen/add_station_confirm_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/add_station_precheck_screen/add_station_precheck_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/weewx_endpoint/weewx_endpoint_cubit.dart';
import 'package:weewx_now/presentation/widgets/weewx_now_scaffold.dart';

import '../../widgets/browser_link.dart';

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
            appBar: PlatformAppBar(title: Text('Station bestätigen')),
            body: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  color: Colors.lightGreen.shade100,
                  child: PlatformListTile(
                    trailing: Icon(Icons.check),
                    title: Text('Verbindung OK'),
                    subtitle: Text('Bitte bestätigen Sie die Angaben um den Vorgang abzuschließen.'),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      PlatformListTile(
                        title: Text('Standort'),
                        subtitle: Text(precheckResult.weeWxConfig.station.location),
                      ),
                      PlatformListTile(
                        title: Text('Internetadressse'),
                        subtitle: BrowserLink(
                          text: precheckResult.endpointUrl,
                          url: precheckResult.endpointUrl,
                        ),
                      ),
                      PlatformListTile(
                        title: Text('Position'),
                        subtitle: BrowserLink(
                          text: '${precheckResult.weeWxConfig.station.latitude};${precheckResult.weeWxConfig.station.longitude}',
                          url:
                              'https://www.openstreetmap.org/?mlat=${precheckResult.weeWxConfig.station.latitude}&mlon=${precheckResult.weeWxConfig.station.longitude}',
                        ),
                      ),
                      PlatformListTile(
                        title: Text('Betreiber'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(precheckResult.weeWxConfig.now.responsibleEntityName),
                            BrowserLink(
                              text: precheckResult.weeWxConfig.now.responsibleEntityUrl,
                              url: precheckResult.weeWxConfig.now.responsibleEntityUrl,
                            ),
                          ],
                        ),
                      ),
                      PlatformListTile(
                        title: SizedBox(),
                        subtitle: Text('Hinweis: Bitte beachten Sie, dass die vollständige Verantwortung über die Daten beim oben genannten Betreiber liegt.'),
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
