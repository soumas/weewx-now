import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_now/domain/entities/endpoint/weewx_endpoint.dart';
import 'package:weewx_now/injection.dart';
import 'package:weewx_now/presentation/bloc/busy/busy_cubit.dart';
import 'package:weewx_now/presentation/bloc/my_stations_screen/my_stations_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/weewx_endpoint/weewx_endpoint_cubit.dart';
import 'package:weewx_now/presentation/screens/add_station_precheck_screen/add_station_precheck_screen.dart';
import 'package:weewx_now/presentation/widgets/weewx_now_scaffold.dart';

class MyStationsScreen extends StatelessWidget {
  const MyStationsScreen({super.key});

  static const String routeName = 'myStationsScreen';

  @override
  Widget build(BuildContext context) {
    final selectedEndpoint = context.read<CurrentEndpointCubit>().selectedEndpoint;
    return BlocProvider(
      create: (context) => sl.get<MyStationsScreenBloc>(),
      child: BlocListener<MyStationsScreenBloc, MyStationsScreenState>(
        listener: (context, state) {
          context.read<BusyCubit>().setBusy(state is MyStationsScreenLoading);
        },
        child: WeeWxNowScaffold(
          appBar: PlatformAppBar(
            title: const Text('Meine Stationen'),
            cupertino: (context, platform) {
              return CupertinoNavigationBarData(
                trailing: PlatformIconButton(
                  icon: Icon(PlatformIcons(context).add),
                  onPressed: () => _addNewStation(context),
                ),
              );
            },
          ),
          body: BlocBuilder<MyStationsScreenBloc, MyStationsScreenState>(
            builder: (context, state) {
              if (state is MyStationsScreenLoaded) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.endpoints.length,
                  itemBuilder: (context, index) {
                    return PlatformListTile(
                      leading: Icon(
                        (state.endpoints[index].url == selectedEndpoint?.url)
                            ? PlatformIcons(context).checkBoxCheckedOutlineRounded
                            : PlatformIcons(context).checkBoxBlankOutlineRounded,
                      ),
                      title: Text(state.endpoints[index].name),
                      trailing: PlatformIconButton(
                        icon: Icon(PlatformIcons(context).delete),
                        onPressed: () {
                          showPlatformDialog<WeewxEndpoint>(
                            context: context,
                            builder: (context) => PlatformAlertDialog(
                              title: Text('Station löschen?'),
                              content: Text('Möchten Sie die Station "${state.endpoints[index].name}" (${state.endpoints[index].url}) endgültig löschen?'),
                              actions: [
                                PlatformDialogAction(
                                  child: PlatformText('Abbrechen'),
                                  onPressed: () => context.pop(),
                                ),
                                PlatformDialogAction(
                                  child: PlatformText('Löschen'),
                                  onPressed: () => context.pop(state.endpoints[index]),
                                )
                              ],
                            ),
                          ).then((value) {
                            if (value != null) {
                              context.read<MyStationsScreenBloc>().add(DeleteStation(endpoint: value, isSelected: value.url == selectedEndpoint?.url));
                            }
                          });
                        },
                      ),
                      onTap: () {
                        context.read<CurrentEndpointCubit>().selectEndpoint(state.endpoints[index]);
                        context.pop();
                      },
                    );
                  },
                );
              }
              return const SizedBox();
            },
          ),
          material: (context, platform) {
            return MaterialScaffoldData(
                floatingActionButton: FloatingActionButton(
              child: Icon(PlatformIcons(context).add),
              onPressed: () => _addNewStation(context),
            ));
          },
        ),
      ),
    );
  }

  _addNewStation(BuildContext context) {
    context.pushNamed(AddStationPrecheckScreen.routeName).then((value) => context.read<MyStationsScreenBloc>().add(LoadMyStations()));
  }
}
