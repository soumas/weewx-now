import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_now_app/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now_app/injection.dart';
import 'package:weewx_now_app/presentation/bloc/my_stations_screen/my_stations_screen_bloc.dart';
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
                return Column(
                  children: [
                    Text('${state.endpoints.length}'),
                    PlatformTextButton(
                      onPressed: () {
                        context.pushNamed<WeewxEndpoint>(AddStationScreen.routeName).then((newEndpoint) {
                          if (newEndpoint != null) {
                            context.read<MyStationsScreenBloc>().add(LoadMyStations());
                          }
                        });
                      },
                      child: const Text('gemma jetzt endpoint anlegen, ha?'),
                    )
                  ],
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
