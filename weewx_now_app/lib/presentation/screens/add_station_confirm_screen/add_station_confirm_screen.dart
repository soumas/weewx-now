import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weewx_now/injection.dart';
import 'package:weewx_now/presentation/bloc/add_station_confirm_screen/add_station_confirm_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/add_station_precheck_screen/add_station_precheck_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/weewx_endpoint/weewx_endpoint_cubit.dart';

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
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Text(precheckResult.weeWxConfig.station.location),
                  PlatformElevatedButton(
                    child: const Text('jo passt'),
                    onPressed: () {
                      context.read<AddStationConfirmScreenBloc>().add(
                            ConfirmAddStation(
                              name: precheckResult.weeWxConfig.station.location,
                              url: precheckResult.endpointUrl,
                            ),
                          );
                    },
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
