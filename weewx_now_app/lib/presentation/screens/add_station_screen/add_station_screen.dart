import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_now/injection.dart';
import 'package:weewx_now/presentation/bloc/add_station_screen/add_station_screen_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weewx_now/presentation/screens/add_station_screen/fragments/station_url_input_dialog.dart';

class AddStationScreen extends StatelessWidget {
  const AddStationScreen({super.key});

  static const String routeName = 'addStationScreen';

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(AppLocalizations.of(context)!.addWeeWXStation),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: BlocProvider(
            create: (context) => sl.get<AddStationScreenBloc>(),
            child: BlocListener<AddStationScreenBloc, AddStationScreenState>(
              listener: (context, state) {
                if (state is AddStationCompleted) {
                  context.pop(state.endpoint);
                }
                if (state is AddStationScreenData) {
                  if (state.endpointCheckError != null) {
                    showPlatformDialog(
                      context: context,
                      builder: (context) => AlertDialog(content: Card(child: Text('Fehler: ${state.endpointCheckError}'))),
                    );
                  }
                }
              },
              child: BlocBuilder<AddStationScreenBloc, AddStationScreenState>(
                builder: (context, state) {
                  if (state is AddStationScreenData) {
                    final lastCheckeEndpoint = context.read<AddStationScreenBloc>().stateData.lastCheckeEndpoint;
                    if (state.weeWxConfig == null) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Bitte wählen Sie die Methode, mit der die neue WeeWX Station hinzugefügt werden soll.'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                child: PlatformTextButton(
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.qr_code_2,
                                        size: 100,
                                      ),
                                      Text(AppLocalizations.of(context)!.viaQrCode),
                                    ],
                                  ),
                                  onPressed: () async {
                                    await FlutterBarcodeScanner.scanBarcode(
                                      '#ff6666',
                                      AppLocalizations.of(context)!.cancel,
                                      false,
                                      ScanMode.QR,
                                    ).then((value) {
                                      if (value.startsWith('http')) {
                                        context.read<AddStationScreenBloc>().add(RunEndpointCheck(url: value));
                                      }
                                    });
                                  },
                                ),
                              ),
                              Card(
                                child: PlatformTextButton(
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.link,
                                        size: 100,
                                      ),
                                      Text(AppLocalizations.of(context)!.viaLink),
                                    ],
                                  ),
                                  onPressed: () async {
                                    await showPlatformDialog<String>(
                                      context: context,
                                      builder: (context) => StationUrlInputDialog(
                                        initialValue: lastCheckeEndpoint,
                                      ),
                                    ).then((value) {
                                      if (value != null) {
                                        context.read<AddStationScreenBloc>().add(RunEndpointCheck(url: value));
                                      }
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          //if (state.endpointCheckError != null) Card(child: Text('Fehler: ${state.endpointCheckError}')),
                        ],
                      );
                    } else {
                      return Card(
                        child: Column(children: [
                          const Text('verbindung paaaast'),
                          Text('Station: ${state.weeWxConfig!.station.location}'),
                          Text('Station: ${state.weeWxConfig!.station.hardware}'),
                          PlatformElevatedButton(
                            child: const Text('ok'),
                            onPressed: () => context.read<AddStationScreenBloc>().add(AddStation()),
                          ),
                          PlatformElevatedButton(
                            child: const Text('abbrechen'),
                            onPressed: () => context.read<AddStationScreenBloc>().add(ClearStation()),
                          ),
                        ]),
                      );
                    }
                  }
                  return const SizedBox();
                },
              ),
            ),
          )),
        ),
      ),
    );
  }
}
