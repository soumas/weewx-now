import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewx_pwa/presentation/bloc/main_screen/main_screen_bloc.dart';
import 'package:weewx_pwa/presentation/cubit/theme/theme_cubit.dart';

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
              icon: const Icon(Icons.refresh),
            ),
            PopupMenuButton(
              icon: const Icon(Icons.menu),
              itemBuilder: (context) => [
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
