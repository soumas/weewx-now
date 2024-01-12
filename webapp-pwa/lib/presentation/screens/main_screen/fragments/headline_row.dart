import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weewx_pwa/domain/entities/endpoint/weewx_endpoint_entity.dart';
import 'package:weewx_pwa/presentation/bloc/main_screen/main_screen_bloc.dart';
import 'package:weewx_pwa/presentation/cubit/theme/theme_cubit.dart';
import 'package:weewx_pwa/presentation/screens/add_endpoint_screen/add_endpoint_screen.dart';

class HeadlineRow extends StatelessWidget {
  const HeadlineRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = context.watch<MainScreenBloc>().state;
    if (data is MainScreenData) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          bottom: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.endpoint.name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Expanded(child: SizedBox()),
            IconButton(
              onPressed: () {
                context.read<MainScreenBloc>().add(
                      LoadMainScreenData(endpoint: data.endpoint),
                    );
              },
              icon: data.busy
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(),
                    )
                  : const Icon(Icons.refresh),
            ),
            PopupMenuButton(
              icon: const Icon(Icons.menu),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Text('Stationen'),
                  onTap: () async {
                    final result = await showDialog<WeewxEndpointEntity>(
                      context: context,
                      builder: (context) {
                        return Column(
                          children: data.endpointOptions
                              .map(
                                (e) => ElevatedButton(
                                  onPressed: () => context.pop(e),
                                  child: Text(
                                    e.name,
                                  ),
                                ),
                              )
                              .toList()
                            ..add(
                              ElevatedButton(
                                onPressed: () async {
                                  context.pop(await context
                                      .pushNamed(AddEndpointScreen.routeName));
                                },
                                child: const Text('Neue Station'),
                              ),
                            ),
                        );
                      },
                    );
                    if (result != null) {
                      context
                          .read<MainScreenBloc>()
                          .add(ChangeEndpoint(endpoint: result));
                    }
                  },
                ),
                PopupMenuItem(
                  child: const Text('Einstellungen'),
                  onTap: () {
                    context.read<ThemeCubit>().toggleThemeMode();
                  },
                ),
                PopupMenuItem(
                  child: const Text('Impressum'),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
