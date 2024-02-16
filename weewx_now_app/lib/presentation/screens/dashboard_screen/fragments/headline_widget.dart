import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weewx_now/presentation/bloc/dashboard_screen/dashboard_screen_bloc.dart';

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardScreenBloc, DashboardScreenState>(
      builder: (context, state) {
        if (state is DashboardData) {
          return PlatformListTile(
            title: Text(
              state.endpoint.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
