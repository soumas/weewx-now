import 'package:flutter/material.dart';
import 'package:weewx_pwa/presentation/screens/main_screen/fragments/main_screen_data_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, this.url});

  static const String routeName = 'mainScreen';
  final String? url;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: MainScreenDataWidget(),
      ),
    );
  }
}
