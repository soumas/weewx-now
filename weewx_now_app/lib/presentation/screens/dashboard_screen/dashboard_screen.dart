import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_now/injection.dart';
import 'package:weewx_now/presentation/bloc/busy/busy_cubit.dart';
import 'package:weewx_now/presentation/bloc/dashboard_screen/dashboard_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/weewx_endpoint/endpoint_cubit.dart';
import 'package:weewx_now/presentation/screens/dashboard_screen/fragments/dashboard_reload_button.dart';
import 'package:weewx_now/presentation/screens/dashboard_screen/fragments/endpoint_required_widget.dart';
import 'package:weewx_now/presentation/screens/dashboard_screen/fragments/images_widget.dart';
import 'package:weewx_now/presentation/screens/dashboard_screen/fragments/weather_widget.dart';
import 'package:weewx_now/presentation/screens/my_stations_sceen/my_stations_screen.dart';
import 'package:weewx_now/presentation/screens/settings_screen/settings_screen.dart';
import 'package:weewx_now/presentation/widgets/weewx_now_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const String routeName = 'dashboardScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<DashboardScreenBloc>(),
      child: BlocListener<CurrentEndpointCubit, EndpointState>(
        listener: (context, state) {
          if (state is EndpointSelected) {
            context.read<DashboardScreenBloc>().add(LoadDashboardData(endpoint: context.read<CurrentEndpointCubit>().selectedEndpoint!));
          }
          if (state is NoSelectableEndpointFound) {
            context.read<DashboardScreenBloc>().add(EmitEndpointRequired());
          }
        },
        child: WeeWxNowScaffold(
          appBar: PlatformAppBar(
            title: BlocBuilder<DashboardScreenBloc, DashboardScreenState>(
              builder: (context, state) {
                if (state is DashboardData) {
                  return Text(state.endpoint.name);
                }
                return const SizedBox();
              },
            ),
            trailingActions: [
              const DashboardReloadButton(),
              PlatformPopupMenu(
                options: [
                  PopupMenuOption(
                    label: AppLocalizations.of(context)!.myStations,
                    onTap: (p0) => context.pushNamed(MyStationsScreen.routeName),
                  ),
                  PopupMenuOption(
                    label: AppLocalizations.of(context)!.settings,
                    onTap: (p0) {
                      context.pushNamed(SettingsScreen.routeName);
                    },
                  ),
                ],
                icon: const Icon(Icons.menu),
              ),
            ],
          ),
          body: BlocListener<DashboardScreenBloc, DashboardScreenState>(
            listener: (context, state) {
              context.read<BusyCubit>().setBusy(state is DashboardInitializing || (state is DashboardData && state.loading));
            },
            child: BlocBuilder<DashboardScreenBloc, DashboardScreenState>(
              builder: (context, state) {
                if (state is DashboardData) {
                  return ListView(
                    children: const [
                      ImagesWidget(),
                      //HeadlineWidget(),
                      WeatherWidget(),
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
