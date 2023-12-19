import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewx_pwa/presentation/bloc/config_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, this.url});

  static const String routeName = 'mainScreen';
  final String? url;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigBloc, ConfigState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case ConfigLoading:
            return const Text('Loading');
          case ConfigLoaded:
            return Text((state as ConfigLoaded).config.station.location);
          default:
            return ElevatedButton(
              onPressed: () => context
                  .read<ConfigBloc>()
                  .add(LoadConfigEvent(endpoint: url!)),
              child: const Text('lade mich'),
            );
        }
      },
    );
  }
}
