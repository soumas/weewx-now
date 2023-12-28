import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewx_pwa/injection.dart';
import 'package:weewx_pwa/presentation/bloc/main_screen_bloc.dart';
import 'package:weewx_pwa/presentation/screens/main_screen/fragments/main_screen_data_widget.dart';
import 'package:weewx_pwa/presentation/screens/main_screen/fragments/main_screen_loading_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, this.url});

  static const String routeName = 'mainScreen';
  final String? url;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MainScreenBloc>()
        ..add(url != null
            ? ChangeStation(endpoint: url!)
            : UpdateMainScreenData()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<MainScreenBloc, MainScreenState>(
            builder: (context, state) {
              switch (state) {
                case MainScreenInitial():
                  return const MainScreenLoadingWidget();
                case ChangingStation():
                  return MainScreenLoadingWidget(
                    information: Text('change station to ${state.endpoint}.'),
                  );
                case MainScreenData():
                  return const MainScreenDataWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
