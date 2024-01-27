import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_now_app/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now_app/injection.dart';
import 'package:weewx_now_app/presentation/bloc/add_station_screen/add_station_screen_bloc.dart';

class AddStationScreen extends StatefulWidget {
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
        child: Scaffold(
          appBar: AppBar(
            title: const Text('WeeWX Station hinzufügen'),
          ),
          body: SingleChildScrollView(
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
                              controller: _endpointNameInputController,
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
    );
  }
}
