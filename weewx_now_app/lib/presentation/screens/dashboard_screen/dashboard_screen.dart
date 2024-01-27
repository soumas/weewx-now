import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weewx_now_app/injection.dart';
import 'package:weewx_now_app/presentation/state/dashboard_screen/dashboard_screen_bloc.dart';
import 'package:weewx_now_app/presentation/state/weewx_endpoint/weewx_endpoint_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const String routeName = 'dashboardScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<DashboardScreenBloc>(),
      child: BlocListener<WeewxEndpointCubit, WeewxEndpointState>(
        listenWhen: (previous, current) => current is WeewxEndpointSelection || current is NoSelectableEndpointFound,
        listener: (context, state) {
          if (state is WeewxEndpointSelection) {
            context.read<DashboardScreenBloc>().add(LoadEverChangingData(endpoint: state.endpoint));
          }
          if (state is NoSelectableEndpointFound) {
            context.read<DashboardScreenBloc>().add(EmitEndpointRequired());
          }
        },
        child: PlatformScaffold(
          appBar: PlatformAppBar(
            title: const Text('WeeWX Now'),
            trailingActions: [
              PlatformIconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  context.read<WeewxEndpointCubit>().init();
                },
              ),
            ],
          ),
          body: SafeArea(
            child: BlocBuilder<DashboardScreenBloc, DashboardScreenState>(
              builder: (context, state) {
                if (state is EverChangingDataLoading) {
                  return PlatformCircularProgressIndicator();
                } else if (state is EverChangingLoaded) {
                  return Text('${state.weather.toString()} ${state.endpoint.name}');
                } else if (state is EverChangingDataError) {
                  return Text("error: ${state.error}");
                } else if (state is EndpointRequired) {
                  return Column(
                    children: [
                      const Text('no endpoint'),
                      PlatformTextButton(
                        onPressed: () {},
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
      ),
    );
  }
}
