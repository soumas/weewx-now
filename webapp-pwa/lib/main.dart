import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weewx_pwa/injection.dart';
import 'package:weewx_pwa/presentation/cubit/theme/theme_cubit.dart';
import 'package:weewx_pwa/presentation/cubit/weewx_endpoint/weewx_endpoint_cubit.dart';
import 'package:weewx_pwa/presentation/routes.dart';
import 'package:weewx_pwa/presentation/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Injection.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl.get<ThemeCubit>()),
        BlocProvider(create: (context) => sl.get<WeewxEndpointCubit>()),
      ],
      child: Builder(builder: (context) {
        final themeMode = context.watch<ThemeCubit>().currentThemeMode;
        return themeMode != null
            ? MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: router,
                theme: themeDataLight,
                darkTheme: themeDataDark,
                themeMode: themeMode,
              )
            : const SizedBox();
      }),
    );
  }
}
