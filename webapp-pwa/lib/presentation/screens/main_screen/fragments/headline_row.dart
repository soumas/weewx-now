import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewx_pwa/presentation/cubit/theme/theme_cubit.dart';

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'context.watch<WeewxEndpointCubit>(),',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {},
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
  }
}
