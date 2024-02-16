import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewx_now/presentation/bloc/dashboard_screen/dashboard_screen_bloc.dart';

class ImagesWidget extends StatefulWidget {
  const ImagesWidget({super.key});

  @override
  State<ImagesWidget> createState() => _ImagesWidgetState();
}

class _ImagesWidgetState extends State<ImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardScreenBloc, DashboardScreenState>(
      builder: (context, state) {
        if (state is DashboardData && state.config.now.hideImageViewer != true) {
          return const Text('Bilder');
        }
        return const SizedBox();
      },
    );
  }
}
