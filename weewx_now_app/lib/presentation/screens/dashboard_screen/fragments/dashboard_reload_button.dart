import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:weewx_now/presentation/bloc/dashboard_screen/dashboard_screen_bloc.dart';
import 'package:weewx_now/presentation/bloc/weewx_endpoint/endpoint_cubit.dart';

class DashboardReloadButton extends StatefulWidget {
  const DashboardReloadButton({super.key});

  @override
  State<DashboardReloadButton> createState() => _DashboardReloadButtonState();
}

class _DashboardReloadButtonState extends State<DashboardReloadButton> with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
      animationBehavior: AnimationBehavior.normal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardScreenBloc, DashboardScreenState>(
      listener: (context, state) {
        if (state is DashboardInitializing || (state is DashboardData && state.loading)) {
          _rotationController.repeat();
        } else {
          _rotationController.reset();
        }
      },
      child: BlocBuilder<DashboardScreenBloc, DashboardScreenState>(
        builder: (context, state) {
          if (state is DashboardData) {
            return PlatformIconButton(
              icon: AnimatedBuilder(
                  animation: _rotationController,
                  builder: (context, child) {
                    return RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(_rotationController),
                      child: Icon(PlatformIcons(context).refresh),
                    );
                  }),
              onPressed: () {
                context.read<DashboardScreenBloc>().add(
                      LoadDashboardData(
                        endpoint: context.read<CurrentEndpointCubit>().selectedEndpoint!,
                      ),
                    );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
