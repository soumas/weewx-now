import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_now/injection.dart';
import 'package:weewx_now/presentation/bloc/dashboard_screen/dashboard_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/locale/locale_cubit.dart';
import 'package:weewx_now/presentation/bloc/theme/theme_cubit.dart';
import 'package:weewx_now/presentation/bloc/weewx_endpoint/weewx_endpoint_cubit.dart';
import 'package:weewx_now/presentation/screens/dashboard_screen/fragments/dashboard_reload_button.dart';
import 'package:weewx_now/presentation/screens/dashboard_screen/fragments/endpoint_required_widget.dart';
import 'package:weewx_now/presentation/screens/my_stations_sceen/my_stations_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const String routeName = 'dashboardScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<DashboardScreenBloc>(),
      child: BlocListener<CurrentEndpointCubit, WeewxEndpointState>(
        listenWhen: (previous, current) => current is WeewxEndpointSelected || current is NoSelectableEndpointFound,
        listener: (context, state) {
          if (state is WeewxEndpointSelected) {
            context.read<DashboardScreenBloc>().add(LoadDashboardData(endpoint: context.read<CurrentEndpointCubit>().selectedEndpoint!));
          }
          if (state is NoSelectableEndpointFound) {
            context.read<DashboardScreenBloc>().add(EmitEndpointRequired());
          }
        },
        child: PlatformScaffold(
          appBar: PlatformAppBar(
            title: context.watch<CurrentEndpointCubit>().selectedEndpoint != null ? Text(context.watch<CurrentEndpointCubit>().selectedEndpoint!.name) : null,
            trailingActions: [
              PlatformPopupMenu(options: [
                PopupMenuOption(
                  label: 'stationen',
                  onTap: (p0) => context.pushNamed(MyStationsScreen.routeName),
                ),
                PopupMenuOption(
                  label: 'toggle theme',
                  onTap: (p0) => context.read<ThemeCubit>().toggleThemeMode(),
                ),
                PopupMenuOption(
                  label: 'language en',
                  onTap: (p0) => context.read<LocaleCubit>().setLocale(const Locale('en')),
                ),
                PopupMenuOption(
                  label: 'language de',
                  onTap: (p0) => context.read<LocaleCubit>().setLocale(const Locale('de')),
                ),
                PopupMenuOption(
                  label: 'current lang: ${context.watch<LocaleCubit>().currentLocale}',
                  onTap: (p0) {},
                ),
              ], icon: const Icon(Icons.menu)),
            ],
          ),
          body: SafeArea(
            child: BlocBuilder<DashboardScreenBloc, DashboardScreenState>(
              builder: (context, state) {
                if (state is DashboardData) {
                  return Column(
                    children: [
                      const DashboardReloadButton(),
                      Text('${state.weather.toString()} ${state.config.station.location}'),
                    ],
                  );
                } else if (state is DashboardDataError) {
                  return Text("error: ${state.error}");
                } else if (state is EndpointRequired) {
                  return const EndpointRequiredWidget();
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