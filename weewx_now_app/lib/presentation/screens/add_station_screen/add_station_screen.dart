import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_now_app/injection.dart';
import 'package:weewx_now_app/presentation/bloc/add_station_screen/add_station_screen_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              },
              child: BlocBuilder<AddStationScreenBloc, AddStationScreenState>(
                builder: (context, state) {
                  if (state is AddStationScreenData) {
                    if (state.weeWxConfig == null) {
                      return Column(
                        children: [
                          PlatformTextFormField(
                            keyboardType: TextInputType.url,
                            autofocus: true,
                            enabled: !state.endpointCheckRunning,
                            initialValue: context.read<AddStationScreenBloc>().stateData.userInputUrl,
                            onChanged: (value) {
                              context.read<AddStationScreenBloc>().add(UserInputUrl(input: value));
                            },
                          ),
                          if (state.endpointCheckError != null) Text('Fehler: ${state.endpointCheckError}'),
                          if (state.weeWxConfig != null) Text('Station: ${state.weeWxConfig!.station.location}'),
                          PlatformElevatedButton(
                            child: const Text('check'),
                            onPressed: () => context.read<AddStationScreenBloc>().add(RunEndpointCheck()),
                          ),
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

/*class AddStationScreen extends StatefulWidget {
  const AddStationScreen({super.key, this.endpointSuggestion});

  static const String routeName = 'addStationScreen';
  final WeewxEndpoint? endpointSuggestion;

  @override
  State<AddStationScreen> createState() => _AddStationScreenState();
}

class _AddStationScreenState extends State<AddStationScreen> {
  final addEndpointScreenBloc = sl.get<AddStationScreenBloc>();
  late TextEditingController _endpointNameInputController;
  late TextEditingController _endpointUrlInputController;

  @override
  void initState() {
    super.initState();
    _endpointNameInputController = TextEditingController(text: 'WeeWX Station 1');
    _endpointUrlInputController = TextEditingController(text: widget.endpointSuggestion?.url);
    if (widget.endpointSuggestion != null) {
      addEndpointScreenBloc.add(
        CheckEndpoint(endpointUrl: widget.endpointSuggestion!.url),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addEndpointScreenBloc,
      child: BlocListener<AddStationScreenBloc, AddStationScreenState>(
        listener: (context, state) {
          if (state is StationAdded) {
            context.pop(state.endpoint);
          }
        },
        child: PlatformScaffold(
          appBar: PlatformAppBar(
            title: Text(AppLocalizations.of(context)!.addWeeWXStation),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text('URL eingeben um neue WeeWX Station hinzuzufügen'),
                    TextField(
                      controller: _endpointUrlInputController,
                    ),
                    ElevatedButton(
                      onPressed: () => addEndpointScreenBloc.add(
                        CheckEndpoint(endpointUrl: _endpointUrlInputController.text),
                      ),
                      child: const Text('check'),
                    ),
                    Card(
                      child: BlocBuilder<AddStationScreenBloc, AddStationScreenState>(
                        builder: (context, state) {
                          if (state is EndpointCheckLoading) {
                            return const CircularProgressIndicator();
                          }
                          if (state is EndpointCheckError) {
                            return Text('Fehler: ${state.message}');
                          }
                          if (state is EndpointCheckSuccess) {
                            _endpointNameInputController.text = state.settings.station.location;
                            return Column(
                              children: [
                                Text(state.endpointUrl),
                                TextField(
                                  //controller: _endpointNameInputController,
                                  onChanged: (value) {
                                    log(value);
                                  },
                                ),
                                ElevatedButton(
                                  onPressed: () => addEndpointScreenBloc.add(
                                    AddStation(
                                      name: _endpointNameInputController.text,
                                      url: state.endpointUrl,
                                    ),
                                  ),
                                  child: const Text('add endpoint'),
                                ),
                              ],
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/