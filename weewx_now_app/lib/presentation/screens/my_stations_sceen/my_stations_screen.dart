import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_now_app/injection.dart';
import 'package:weewx_now_app/presentation/bloc/my_stations_screen/my_stations_screen_bloc.dart';
import 'package:weewx_now_app/presentation/bloc/weewx_endpoint/weewx_endpoint_cubit.dart';
import 'package:weewx_now_app/presentation/screens/add_station_screen/add_station_screen.dart';

class MyStationsScreen extends StatelessWidget {
  const MyStationsScreen({super.key});

  static const String routeName = 'myStationsScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<MyStationsScreenBloc>(),
      child: PlatformScaffold(
        appBar: PlatformAppBar(),
        body: SafeArea(
          child: BlocBuilder<MyStationsScreenBloc, MyStationsScreenState>(
            builder: (context, state) {
              if (state is MyStationsScreenLoading) {
                return PlatformCircularProgressIndicator();
              } else if (state is MyStationsScreenLoaded) {
                return ListView(
                  children: state.endpoints
                      .map(
                        (e) => PlatformElevatedButton(
                          child: Text(e.name),
                          onPressed: () {
                            context.read<WeewxEndpointCubit>().selectEndpoint(e);
                            context.pop();
                          },
                        ),
                      )
                      .toList()
                    ..addAll([
                      PlatformElevatedButton(
                        child: const Text('NEU HINZUFÜGEN'),
                        onPressed: () => context.pushNamed(AddStationScreen.routeName),
                      ),
                    ]),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
