import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewx_pwa/presentation/bloc/main_screen_bloc.dart';

class HeadlineRow extends StatelessWidget {
  const HeadlineRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        bottom: 10.0,
      ),
      child: BlocBuilder<MainScreenBloc, MainScreenState>(
        buildWhen: (previous, current) => current is MainScreenData,
        builder: (context, state) {
          final cState = state as MainScreenData;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cState.data.settings.station.location,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {
                  context.read<MainScreenBloc>().add(UpdateMainScreenData());
                },
                icon: cState.isUpdating
                    ? const Icon(Icons.edgesensor_high)
                    : const Icon(Icons.refresh),
              ),
              PopupMenuButton(
                icon: const Icon(Icons.menu),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Text('Einstellungen'),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: const Text('Impressum'),
                    onTap: () {},
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
