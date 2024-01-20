import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewx_now_app/injection.dart';
import 'package:weewx_now_app/presentation/cubit/theme/theme_cubit.dart';
import 'package:weewx_now_app/presentation/routes.dart';
import 'package:weewx_now_app/presentation/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Injection.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl.get<ThemeCubit>()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().currentThemeMode;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: themeDataLight,
      darkTheme: themeDataDark,
      themeMode: themeMode,
    );
  }
}
