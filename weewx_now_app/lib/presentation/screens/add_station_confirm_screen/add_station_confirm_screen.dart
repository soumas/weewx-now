import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weewx_now/injection.dart';
import 'package:weewx_now/presentation/bloc/add_station_confirm_screen/add_station_confirm_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/add_station_precheck_screen/add_station_precheck_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/theme/theme_cubit.dart';
import 'package:weewx_now/presentation/bloc/weewx_endpoint/weewx_endpoint_cubit.dart';
import 'package:weewx_now/presentation/widgets/weewx_now_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/browser_link.dart';

class AddStationConfirmScreen extends StatefulWidget {
  const AddStationConfirmScreen({super.key, required this.precheckResult});

  static const routeName = 'addStationConfirmScreen';

  final AddStationPrecheckSuccess precheckResult;

  @override
  State<AddStationConfirmScreen> createState() => _AddStationConfirmScreenState();
}

class _AddStationConfirmScreenState extends State<AddStationConfirmScreen> {
  final _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _name.text = widget.precheckResult.weeWxConfig.station.location;
  }

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
            appBar: PlatformAppBar(title: Text(AppLocalizations.of(context)!.addStationConfirmTitle)),
            body: ListView(
              children: [
                Container(
                  color: context.read<ThemeCubit>().currentThemeMode == ThemeMode.dark ? Colors.green.shade800 : Colors.lightGreen.shade100,
                  child: PlatformListTile(
                    trailing: const Icon(Icons.check),
                    title: Text(AppLocalizations.of(context)!.addStationConfirmUrlOK),
                    subtitle: BrowserLink(
                      text: widget.precheckResult.endpointUrl,
                      url: widget.precheckResult.endpointUrl,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                PlatformListTile(
                  title: Text(
                    AppLocalizations.of(context)!.addStationConfirmPositionAndOperator,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                PlatformListTile(
                  title: Text(AppLocalizations.of(context)!.location),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.precheckResult.weeWxConfig.station.location),
                      BrowserLink(
                        text: '${widget.precheckResult.weeWxConfig.station.latitude};${widget.precheckResult.weeWxConfig.station.longitude}',
                        url:
                            'https://www.openstreetmap.org/?mlat=${widget.precheckResult.weeWxConfig.station.latitude}&mlon=${widget.precheckResult.weeWxConfig.station.longitude}',
                      ),
                    ],
                  ),
                ),
                PlatformListTile(
                  title: Text(AppLocalizations.of(context)!.operator),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.precheckResult.weeWxConfig.now.responsibleEntityName),
                      BrowserLink(
                        text: widget.precheckResult.weeWxConfig.now.responsibleEntityUrl,
                        url: widget.precheckResult.weeWxConfig.now.responsibleEntityUrl,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(),
                ),
                PlatformListTile(
                  title: Text(
                    AppLocalizations.of(context)!.myStation,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                PlatformListTile(
                  title: const SizedBox(),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.addStationConfirmStationName),
                      PlatformTextFormField(
                        controller: _name,
                      ),
                    ],
                  ),
                ),
                PlatformListTile(
                  title: PlatformElevatedButton(
                    child: Text(AppLocalizations.of(context)!.addWeeWXStation),
                    onPressed: () {
                      context.read<AddStationConfirmScreenBloc>().add(ConfirmAddStation(url: widget.precheckResult.endpointUrl, name: _name.text));
                    },
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
