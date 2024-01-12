import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_pwa/domain/entities/endpoint/weewx_endpoint_entity.dart';
import 'package:weewx_pwa/injection.dart';
import 'package:weewx_pwa/presentation/bloc/add_endpoint_screen/add_endpoint_screen_bloc.dart';
import 'package:weewx_pwa/presentation/widgets/responsive_container.dart';

class AddEndpointScreen extends StatefulWidget {
  const AddEndpointScreen({super.key, this.endpointSuggestion});

  static const String routeName = 'addEndpointScreen';
  final WeewxEndpointEntity? endpointSuggestion;

  @override
  State<AddEndpointScreen> createState() => _AddEndpointScreenState();
}

class _AddEndpointScreenState extends State<AddEndpointScreen> {
  final addEndpointScreenBloc = sl.get<AddEndpointScreenBloc>();
  late TextEditingController _endpointNameInputController;
  late TextEditingController _endpointUrlInputController;

  @override
  void initState() {
    super.initState();
    _endpointNameInputController =
        TextEditingController(text: 'WeeWX Station 1');
    _endpointUrlInputController =
        TextEditingController(text: widget.endpointSuggestion?.url);
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
      child: BlocListener<AddEndpointScreenBloc, AddEndpointScreenState>(
        listener: (context, state) {
          if (state is EndpointAdded) {
            context.pop(state.endpoint);
          }
        },
        child: ResponsiveContainer(
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
                      CheckEndpoint(
                          endpointUrl: _endpointUrlInputController.text),
                    ),
                    child: const Text('check'),
                  ),
                  Card(
                    child: BlocBuilder<AddEndpointScreenBloc,
                        AddEndpointScreenState>(
                      builder: (context, state) {
                        if (state is CheckingEndpoint) {
                          return const CircularProgressIndicator();
                        }
                        if (state is EndpointCheckFailed) {
                          return Text('Fehler: ${state.message}');
                        }
                        if (state is EndpointCheckSuccess) {
                          _endpointNameInputController.text =
                              state.settings.station.location;
                          return Column(
                            children: [
                              Text(state.endpointUrl),
                              TextField(
                                controller: _endpointNameInputController,
                              ),
                              ElevatedButton(
                                onPressed: () => addEndpointScreenBloc.add(
                                  AddEndpoint(
                                      name: _endpointNameInputController.text,
                                      url: state.endpointUrl),
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
    );
  }
}
