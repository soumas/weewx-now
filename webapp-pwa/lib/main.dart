import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewx_pwa/injection.dart';
import 'package:weewx_pwa/presentation/bloc/main_screen_bloc.dart';
import 'package:weewx_pwa/presentation/routes.dart';
import 'package:weewx_pwa/presentation/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: themeDataLight,
      builder: (context, child) => BlocProvider(
        create: (context) => sl.get<MainScreenBloc>(),
        child: child,
      ),
    );
  }
}
